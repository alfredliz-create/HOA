// Serves the Board Decision Hub from GitHub (board/index.html) so the app is live without GitHub Pages.
const RAW = "https://raw.githubusercontent.com/alfredliz-create/HOA/main/board/index.html";
let cache: { at: number; html: string } | null = null;
Deno.serve(async () => {
  if (!cache || Date.now() - cache.at > 60_000) {
    const r = await fetch(RAW, { headers: { "Cache-Control": "no-cache" } });
    cache = { at: Date.now(), html: await r.text() };
  }
  return new Response(cache.html, { headers: { "Content-Type": "text/html; charset=utf-8", "Cache-Control": "no-cache" } });
});
