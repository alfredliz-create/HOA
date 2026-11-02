# Winston Towers 200 — Board Decision Hub

Phone-first app where the board votes Yes/No (with a reason) on decisions drafted from the manager's weekly reports.

- `index.html` — the whole app (vanilla JS + supabase-js). Deployed by GitHub Pages and also served at the Supabase `app` function.
- `../supabase/migrations/0001_schema.sql` — database, row-level security (secret ballots enforced in the DB), auto-close on majority, nightly deadline close.
- `../supabase/functions/enter` — turns a person's private link into a session (no passwords).
- `../supabase/functions/app` — serves this page.
- A scheduled Claude task reads the manager's emails, drafts cards with contract KPIs / bid comparisons, chases votes, and emails summaries.
