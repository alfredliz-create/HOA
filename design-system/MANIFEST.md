# MANIFEST — the brand Design Skill

> Inventory and navigation index for this skill package. **Read this first** when invoked, to know what's in the box and where to look for what.

---

## TOTAL: 200 / 200 files (limit respected)

Breakdown by folder:

| Folder | Files |
|---|---:|
| `skill-package/` (root) | 10 |
| `assets/` | 3 |
| `assets/icons/` | 4 |
| `assets/icons/duotone/` | 1 |
| `assets/icons/duotone/<14 categories>/` | 165 |
| `fonts/` | 5 |
| `templates/` | 12 |
| **Total** | **200** |

---

## 1 · Root files

- **`SKILL.md`** — Agent Skill manifest (YAML frontmatter + behavior instructions). The entry point Claude reads when this skill is invoked.
  Use as: the contract. STEP 1–3 plus the non-negotiable rules and pre-flight checklist live here.

- **`MANIFEST.md`** — you are here. The navigation index of the whole skill.
  Use as: entry point. Map of everything.

- **`README.md`** (≈7 KB) — company context, four categories, ten core principles, where-to-look order, non-negotiables.
  Use as: 60-second briefing on who the brand is and what "looks right."

- **`BRAND_RULES.md`** (≈29 KB) — every rule, numerically, in the OBRIGATÓRIO / PROIBIDO / VALORES EXATOS / MOTIVO / EXEMPLO CORRETO / EXEMPLO ERRADO format. 14 topics.
  Use as: the checklist for any generated output. Verify each rule before delivering.

- **`LAYOUT_PATTERNS.md`** (≈36 KB) — 17 layouts as reproducible recipes (USO / GRID / ESTRUTURA / HIERARQUIA / PILLS / ESPAÇAMENTO / RESPONSIVO / SNIPPET / ERRO COMUM).
  Use as: when reaching for a layout, find the matching recipe, then copy the template HTML.

- **`COMPONENTS.md`** (≈19 KB) — every component (pill, button, card, eyebrow, icon container, KPI, badge, nav, sidebar, table row, alert, form field, chip) with states, tokens, variants, snippets.
  Use as: when building UI parts, copy the variant matching the context.

- **`OUTPUT_EXAMPLES.md`** (≈10 KB) — what a correct output contains for each artifact type (cover slide, dashboard, sign-in, post, email, marketing landing) + final-output checklist.
  Use as: pre-flight review before delivering.

- **`colors_and_type.css`** (≈9 KB) — every token: colors, type, spacing, radii, shadows, motion, borders, layout. Plus semantic element defaults (h1–h4, p, .eyebrow, .brand-text-gradient).
  Use as: the source of truth for any CSS variable. Never hard-code a hex.

- **`icons.css`** (≈3 KB) — duotone icon theming classes (`.icon-primary`, family themes, `.icon-on-dark`, etc.) + the three icon-container variants (`white`, `colored`, `outline`) with the brand's asymmetric shadow recipe.
  Use as: apply a theme class on a wrapper around an inlined duotone SVG.

- **`styles.css`** (≈0.5 KB) — single-entry stylesheet that `@import`s the two above.
  Use as: link this one file from any HTML you generate.

---

## 2 · `assets/` — brand graphics with real geometry

- **`assets/logo.svg`** — Placeholder logo (light bg). Replace with your own.
  Use in: every artifact on light or off-white backgrounds. Place top-left by default. Min height digital 24px. Never recolor, rotate, stretch, or reconstruct.
  Note: redrawn from the official reference image supplied by the brand owner; replace with the original `.ai` / `.svg` if your team has it.

- **`assets/logo-white.svg`** — Placeholder logo (dark bg). Replace with your own.
  Use in: any artifact on dark, gradient, or photographic backgrounds. Same placement rules as the positive logo.

- **`assets/pill-cluster.svg`** — The signature pill cluster (12 pills, 5 staggered rows on the right edge), exported 1:1 from the brand slide masters. `viewBox="0 0 1920 1080"`. Each pill carries the D→B gradient (`#0050F0 → #00D2FF`, stops `10%/90%`).
  Use in: any 1920×1080 slide canvas as the brand's signature decoration. On colored backgrounds layer with `mix-blend-mode: screen` and lower opacity, OR substitute solid-accent + fade-to-transparent (the "delicate" treatment) — see BRAND_RULES §7.

### `assets/icons/` — Category bespoke marks (4)

Each is a two-tone SVG drawn at 48×48 with `strokeWidth ≈ 2.2`. Use inside the three icon-container variants (white box / colored box / outline) — see BRAND_RULES §8 + COMPONENTS · Icon container.


### `assets/icons/duotone/` — themable UI icon library

- **`manifest.json`** — index of every duotone icon by category (165 icons in 14 categories).
  Use as: lookup table when picking an icon. Categories: `finance · data · commerce · business · communication · files · ui · arrows · navigation · security · status · devices · people · time`.

Each `.svg` exposes `--icon-strong` + `--icon-soft` CSS variables. **Inline the SVG in the DOM** (not `<img src>`) for theming to apply — see BRAND_RULES §8 and `icons.css`.

**165 icons total** across 14 categories.

#### Counts per category
- `arrows/` — 8 (arrow-up/down/left/right, arrow-square-out, arrows-clockwise, arrows-left-right, arrow-arc-left)
- `business/` — 12 (briefcase, building-office, buildings, certificate, factory, handshake, identification-badge, identification-card, kanban, seal-check, strategy, suitcase-simple)
- `commerce/` — 10 (bag-simple, barcode, cardholder, gift, package, qr-code, shopping-bag-open, shopping-cart-simple, storefront, tag)
- `communication/` — 12 (address-book, at, bell, bell-ringing, chat-circle-text, chats, envelope-open, envelope-simple, megaphone, paper-plane-tilt, phone, phone-call)
- `data/` — 14 (chart-bar, chart-bar-horizontal, chart-donut, chart-line-down, chart-line-up, chart-pie, chart-pie-slice, chart-scatter, database, gauge, presentation-chart, ranking, trend-down, trend-up)
- `devices/` — 13 (browser, cloud, cloud-arrow-up, cpu, desktop, device-mobile, hard-drive, keyboard, laptop, plug, printer, robot, terminal-window)
- `files/` — 15 (archive, book-open, clipboard-text, file, file-csv, file-pdf, file-text, file-xls, files, folder, folder-open, newspaper, note, notebook, paperclip)
- `finance/` — 18 (bank, coin, coins, credit-card, currency-btc, currency-circle-dollar, currency-dollar, currency-eur, hand-coins, invoice, money, money-wavy, percent, piggy-bank, receipt, scales, vault, wallet)
- `navigation/` — 8 (compass, flag, globe-hemisphere-west, map-pin, map-trifold, navigation-arrow, signpost, target)
- `people/` — 8 (hand-pointing, head-circuit, user, user-circle, user-gear, user-plus, users, users-three)
- `security/` — 11 (eye, eye-slash, fingerprint, key, lock, lock-key, lock-open, password, scan, shield-check, shield-warning)
- `status/` — 11 (check-circle, hourglass, info, prohibit, question, seal-warning, spinner-gap, warning, warning-circle, warning-octagon, x-circle)
- `time/` — 6 (alarm, calendar-check, calendar-dots, clock, clock-countdown, timer)
- `ui/` — 19 (caret-down, caret-right, check, dots-three, funnel, funnel-simple, gear-six, list, list-checks, magnifying-glass, plus, sidebar, sliders-horizontal, sort-ascending, squares-four, swap, table, toggle-right, x)

---

## 3 · `fonts/` — Open Sans (sanctioned weights, self-hosted `.ttf`)

The brand's only typeface. Sanctioned weights are 300/400/700/800; SemiBold 600 is included for utility UI labels (table headers, buttons). `@font-face` rules live in `colors_and_type.css`.

- **`fonts/OpenSans-Light.ttf`** — weight 300. Subhead/lede paired with extrabold display.
- **`fonts/OpenSans-Regular.ttf`** — weight 400. Body paragraphs.
- **`fonts/OpenSans-SemiBold.ttf`** — weight 600. Utility UI only (button labels, table headers). NOT a headline weight.
- **`fonts/OpenSans-Bold.ttf`** — weight 700. Eyebrows, H3, ghost links, CTAs.
- **`fonts/OpenSans-ExtraBold.ttf`** — weight 800. Display, H1, H2, gradient numbers.

Arial is the system fallback for PowerPoint, Keynote, and email surfaces. Never use a non-sanctioned typeface — see BRAND_RULES §5.

---

## 4 · `templates/` — 12 runnable starting points

Each file is fully self-contained: link `../styles.css`, reference `../assets/...`, copy and edit text. Slides scale to viewport via JS (transform: translate(-50%, -50%) scale(var(--scale))). Web templates flow responsively.

### Slide templates (1920×1080)

- **`templates/cover.html`** — Capa institucional. Blue 115° gradient + on-color pill cluster + reversed logo + 128px sentence-case headline.
  Use as: slide 1 of any deck. Edit headline, subhead, "BRAND BOOK · 2024" stamp.

- **`templates/section-opener.html`** — Section divider. 5 theme variants via `data-theme="blue|credit|supply|lead|category-d"`. Number badge + light/extrabold mixed headline + family-tuned `--pill-accent`.
  Use as: family-specific section divider.

- **`templates/stat.html`** — Single-number stat slide. Left = title + body; right = uppercase label + giant gradient number (200px) + supporting copy.
  Use as: proof-point slide ("43 countries", "500M+ companies").

- **`templates/feature-grid.html`** — Title-pipe-intro pattern + 4-column card grid.
  Use as: feature showcase, 3–4 properties in parallel.

- **`templates/icon-pill-list.html`** — Large title left + 3 pill-row attributes right. Each row IS a full pill (`r=h/2`).
  Use as: 3–4 attributes / values list.

- **`templates/two-column.html`** — Text-heavy typographic showcase. Title block, then 2 columns: prose left + giant stat right.
  Use as: long-form slide with one anchor number.

- **`templates/photo-left.html`** — Left-bleed photo (880×1080) + 3 horizontal pills crossing the seam + right title/lede/body.
  Use as: signature "pill on photo" treatment.

- **`templates/index.html`** — Outline / agenda slide. Numbered gradient circles + 4-row list.
  Use as: table of contents.

### Web / app templates

- **`templates/marketing-hero.html`** — Public-site hero band + stat strip + solution grid + footer mega-band. End-to-end landing scaffold.
  Use as: starting point for any Brand marketing page.

- **`templates/dashboard.html`** — Authenticated SaaS shell. Dark navy sidebar (240px) + white topbar (64px) + 4-KPI row + table + risk gauge + alert list.
  Use as: any Risk Insights Platform app screen with KPI overview.

- **`templates/company-detail.html`** — Company drill-in. Header band + risk gauge as verdict + 4 KPI cards + horizontal tabs + related-entities table + alert column.
  Use as: counterparty / supplier / lead detail page.

- **`templates/sign-in.html`** — Auth screen. Split-screen: form (left 50%, white) + brand statement (right 50%, blue gradient + pill cluster).
  Use as: sign-in, sign-up, password reset.

---

## 5 · Rules index — `BRAND_RULES.md`

When working on… → consult this section.

| If you're deciding… | Consult |
|---|---|
| Where to put the logo, what size, on which background | **§1 Logo** |
| Which blues vs which family colors to reach for | **§2 Cores institucionais** |
| Gradient stops, angles, text-fill vs background usage | **§3 Gradiente** |
| When a family color is allowed vs forbidden | **§4 Categories** |
| Headline size, weight, casing, tracking | **§5 Tipografia** |
| Pill geometry, rotation, outline-color rules | **§6 Pills** |
| The signature 12-pill cluster geometry | **§7 Pill cluster (signature formation)** |
| Inlining duotone, white/colored/outline icon containers | **§8 Ícones** |
| Shadow tokens, the asymmetric Category shadow | **§9 Shadows** |
| Border weights, radius scale, no-zero-radius rule | **§10 Borders & radii** |
| Spacing scale, section rhythm, max content width | **§11 Espaçamento** |
| The two primary backgrounds, dark panels, when family bg is OK | **§12 Backgrounds** |
| Durations, easings, drift animation, reduced-motion | **§13 Motion** |
| Tone, casing, sanctioned typographic chars, forbidden phrases | **§14 Voz e copy** |

## 6 · Layouts index — `LAYOUT_PATTERNS.md`

When you need to produce… → consult this layout.

| Asking for… | Recipe |
|---|---|
| Cover slide of an institutional deck | **§1 Cover slide** + `templates/cover.html` |
| Section divider colored by family | **§2 Section opener** + `templates/section-opener.html` |
| Agenda / outline slide | **§3 Index / outline slide** + `templates/index.html` |
| One-big-number slide | **§4 Stat slide** + `templates/stat.html` |
| Photo + text with pills on the seam | **§6 Photo-left + text-right** + `templates/photo-left.html` |
| 3–4 features side by side | **§7 Feature grid** + `templates/feature-grid.html` |
| Attribute list with pill rows | **§8 Icon-pill list** + `templates/icon-pill-list.html` |
| Text-heavy two-column with one stat | **§9 Two-column text + stat** + `templates/two-column.html` |
| Web landing hero | **§10 Marketing hero** + `templates/marketing-hero.html` |
| Four-family cards row | **§11 Solution grid** |
| Proof-points number strip | **§12 Stat strip** |
| Long-form feature block | **§13 Feature showcase** |
| Site footer mega-band | **§14 Footer mega-band** |
| Authenticated SaaS dashboard | **§15 SaaS dashboard** + `templates/dashboard.html` |
| Single-company drill-in screen | **§16 Company detail** + `templates/company-detail.html` |
| Sign-in / auth screen | **§17 Sign-in / auth** + `templates/sign-in.html` |

---

## 7 · Navigation pointers — by task

### "Build me a slide deck"
1. Read **`README.md` §2 (Core principles)**.
2. Read **`LAYOUT_PATTERNS.md`** for each slide type you'll need.
3. Open the matching `templates/*.html` file as a starting point.
4. Verify against **`BRAND_RULES.md` §6 (Pills) + §7 (Pill cluster) + §5 (Typography)**.
5. Cross-check final deck against **`OUTPUT_EXAMPLES.md` §1 (cover) + §2 (section opener)**.

### "Build me a marketing page"
1. Read **`README.md`** + **`BRAND_RULES.md` §12 (Backgrounds)**.
2. Open **`templates/marketing-hero.html`** as the end-to-end scaffold.
3. For each section, consult **`LAYOUT_PATTERNS.md` §10–§14**.
4. Use **`COMPONENTS.md` · Card, Eyebrow, Button**.
5. Cross-check against **`OUTPUT_EXAMPLES.md` §8 (Página de marketing)**.

### "Build me a dashboard / SaaS app screen"
1. Read **`README.md` §2** + **`BRAND_RULES.md` §10 (Borders & radii) + §11 (Espaçamento) + §9 (Shadows)**.
2. Open **`templates/dashboard.html`** (KPI overview) or **`templates/company-detail.html`** (drill-in).
3. For each piece consult **`COMPONENTS.md` · KPI card, Risk gauge, Sidebar, Table row, Badge, Alert**.
4. Cross-check **`OUTPUT_EXAMPLES.md` §9 (Dashboard) / §10 (Company detail)**.

### "Build me an email / invite"
1. Read **`BRAND_RULES.md` §5 (Type) + §14 (Voz e copy)**.
2. Consult **`OUTPUT_EXAMPLES.md` §7 (Email de convite)**.
3. Use **`COMPONENTS.md` · Button (primary), Card, Eyebrow**.
4. Self-host fonts via `@font-face` from `colors_and_type.css`; specify Arial fallback explicitly (email clients strip Open Sans).

### "Build me a LinkedIn / social post"
1. Decide: institutional vs product-focused (=family).
2. Consult **`OUTPUT_EXAMPLES.md` §5 (institutional post) or §6 (family post)**.
3. Use **`BRAND_RULES.md` §14 (no emoji, no "!", proof points)**.
4. 1080×1080 or 1080×1350 canvas; one headline + one decoration.

### "Build me a sign-in / onboarding screen"
1. Open **`templates/sign-in.html`** for the split-screen pattern.
2. Consult **`COMPONENTS.md` · Form field, Button (primary)**.
3. Cross-check **`OUTPUT_EXAMPLES.md` §4 (Onboarding) / §11 (Sign-in)**.

### "Pick the right icon"
1. Identify the metric / concept.
2. Lookup `assets/icons/duotone/manifest.json` by category.
3. **Inline** the SVG markup (paste, not `<img src>`).
4. Wrap with `<span class="brand-icon icon-primary icon-md">…</span>` (or family variant).
5. Verify against **`BRAND_RULES.md` §8 (Ícones)**.

### "I'm asked to reskin this into a different brand"
1. Read **`README.md` §5 (Non-negotiables)** to know what's brand-specific vs structural.
2. Edit `colors_and_type.css` tokens, `icons.css` theme classes, the two logo SVGs, and the fonts in `fonts/`. The components inherit everything.

---

## 8 · Final pre-flight checklist (mirrors `OUTPUT_EXAMPLES.md`)

- [ ] Background is one of the sanctioned two (white `#fafbfc` or blue 115° gradient), or a family gradient on a section opener only.
- [ ] Blue dominates; family colors only appear when content is *about* that family.
- [ ] All gradients use `10% / 90%` stops (or 115° hero variant).
- [ ] All pills have `border-radius: 9999px` (or `h/2`).
- [ ] All pill rotations are `0°` or `30°`. Outline pills in one composition share one color.
- [ ] Headlines are sentence case. Eyebrows are uppercase + `0.22em` tracked.
- [ ] Open Sans loaded; weights 300/400/700/800 (+ 600 utility only).
- [ ] Shadows are blue-tinted (`rgba(0,80,240, …)`), never gray.
- [ ] Category shadow `-11px 11px 23px` only on white icon boxes over light bg.
- [ ] No emoji. No exclamation marks. No "click here" CTAs.
- [ ] Duotone icons are inlined `<svg>`, not `<img src>`.
- [ ] Proof points where relevant: 43 countries · 500M+ companies · 20,000+ customers · ~200 years.
- [ ] No `border-radius: 0`. No pure `#000` body text. No pure `#fff` page background.
- [ ] Logo: positive on light, reversed on dark/gradient; clear-space ≥ 1× height.
