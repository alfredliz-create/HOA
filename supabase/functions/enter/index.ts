// "enter": turns a person's private link token into a signed-in session.
// POST { token } -> { access_token, refresh_token }
// The token is issued by the admin (hash stored in people.login_token_hash).
import { createClient } from "npm:@supabase/supabase-js@2";

const url = Deno.env.get("SUPABASE_URL")!;
const service = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
const anon = Deno.env.get("SUPABASE_ANON_KEY")!;

const cors = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
};

async function sha256(s: string) {
  const buf = await crypto.subtle.digest("SHA-256", new TextEncoder().encode(s));
  return Array.from(new Uint8Array(buf)).map((b) => b.toString(16).padStart(2, "0")).join("");
}

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: cors });
  const json = (body: unknown, status = 200) =>
    new Response(JSON.stringify(body), { status, headers: { ...cors, "Content-Type": "application/json" } });
  try {
    const { token } = await req.json();
    if (!token || typeof token !== "string" || token.length < 16) return json({ error: "Bad link" }, 400);
    const admin = createClient(url, service, { auth: { persistSession: false } });
    const hash = await sha256(token.trim());
    const { data: person } = await admin.from("people").select("id,name,email,active").eq("login_token_hash", hash).maybeSingle();
    if (!person || !person.active) return json({ error: "This link is not valid any more. Ask Alfred for a new one." }, 401);

    // Make sure an auth user exists for this email.
    const { data: list } = await admin.auth.admin.listUsers({ page: 1, perPage: 1000 });
    const existing = list?.users?.find((u) => (u.email || "").toLowerCase() === person.email.toLowerCase());
    if (!existing) {
      const { error } = await admin.auth.admin.createUser({ email: person.email, email_confirm: true, user_metadata: { name: person.name } });
      if (error) return json({ error: error.message }, 500);
    }
    // Mint a one-time magic link and redeem it server-side → session.
    const { data: link, error: linkErr } = await admin.auth.admin.generateLink({ type: "magiclink", email: person.email });
    if (linkErr || !link?.properties?.hashed_token) return json({ error: linkErr?.message || "Could not sign in" }, 500);
    const client = createClient(url, anon, { auth: { persistSession: false } });
    const { data: sess, error: otpErr } = await client.auth.verifyOtp({ token_hash: link.properties.hashed_token, type: "magiclink" });
    if (otpErr || !sess.session) return json({ error: otpErr?.message || "Could not sign in" }, 500);
    await admin.from("people").update({ last_seen_at: new Date().toISOString() }).eq("id", person.id);
    return json({ access_token: sess.session.access_token, refresh_token: sess.session.refresh_token, name: person.name });
  } catch (e) {
    return json({ error: String(e?.message || e) }, 500);
  }
});
