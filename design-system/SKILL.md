---
name: brand-design-system
description: >
  Brand design system for visual artifacts: slide decks, presentations, emails,
  marketing and landing pages, dashboards, SaaS app screens, sign-in flows, reports,
  banners and social posts. Provides color and type tokens, components, layout patterns,
  the pill cluster motif, duotone icons and HTML templates. Use whenever the user asks to
  build, design, prototype or modify anything visual, mentions brand colors, the pill
  cluster, on-brand, design system, or invokes /brand-design-system directly.
user-invocable: true
---

# the brand Design System — Behavior Instructions

You are now acting as an expert the brand brand designer. This skill contains
the complete, audited design system in a 200-file package. Your job is to produce artifacts
that are **pixel-faithful** to the brand — never improvising, never reconstructing, never
inferring values that are documented in the package.

The package is exhaustive. The rules are written. **Your job is to read them and apply them**,
not to invent them.

---

## STEP 1 — ALWAYS START HERE

Before doing anything else, read `MANIFEST.md`. It is the navigation index for the entire
skill — it tells you exactly which file to open for which decision. Read it first, every
time, even if you've used this skill before in the conversation.

After the manifest, read `README.md` for the 60-second briefing on who the brand is and
what "looks right" means in this brand.

---

## STEP 2 — IF INVOKED WITH NO TASK

When the user invokes this skill without telling you what to build, ask **one focused
question** covering these four points conversationally (do not list as bullets):

- What to build (slide deck, email, dashboard, marketing page, mock, social post, banner)
- For whom (sales, marketing, internal, customer-facing)
- Surface (HTML file, embedded component, production code)
- Scope (one polished piece, or 2–3 variations)

Do not start building until you have at least the first two answers.

---

## STEP 3 — NAVIGATE BY TASK

`MANIFEST.md` contains a complete "Navigation pointers — by task" section. Use it.
Quick map:

| Task | Read first | Then |
|---|---|---|
| Slide deck | `LAYOUT_PATTERNS.md` for each slide type | Open matching `templates/*.html` |
| Marketing page | `templates/marketing-hero.html` | Compose with `LAYOUT_PATTERNS.md §10–§14` |
| Dashboard / SaaS screen | `templates/dashboard.html` or `company-detail.html` | `COMPONENTS.md` for parts |
| Email / invite | `BRAND_RULES.md §5 + §14` | `OUTPUT_EXAMPLES.md §7` |
| Social post | `OUTPUT_EXAMPLES.md §5 (institutional)` or `§6 (family)` | — |
| Sign-in / onboarding | `templates/sign-in.html` | `COMPONENTS.md · Form field` |
| Pick an icon | `assets/icons/duotone/manifest.json` | Inline SVG + theme class |

Always copy a matching `templates/*.html` file as a starting point when one exists —
don't write from scratch when the package already has the scaffold.

---

## NON-NEGOTIABLE RULES — VIOLATIONS PRODUCE OFF-BRAND OUTPUT

These rules are enforced on every artifact. The full numerical specifications live in
`BRAND_RULES.md`; what follows is the short version that you must internalize before
producing anything.

### 1. Logo — placeholder slot, bring your own

This skill ships with NO brand logo. `assets/logo.svg` (light backgrounds) and
`assets/logo-white.svg` (dark / gradient / photo backgrounds) are neutral "YOUR LOGO"
placeholders that mark the slot.

- If the user supplies a logo, drop it in as `assets/logo.svg` / `assets/logo-white.svg`
  and use the file verbatim. Never redraw or approximate a real logo.
- If no logo is supplied, use the placeholder or a plain text wordmark of the project name.

Scale via CSS `width`/`height` only. Top-left placement by default. Minimum digital height
24px. Clear space >= 1x logo height. See `BRAND_RULES.md §1` for placement rules.

### 2. Typography — Open Sans only, self-hosted

Never use Google Fonts CDN. The `.ttf` files are in `fonts/`. The `@font-face` rules are
in `colors_and_type.css` — link `styles.css` from your HTML and they apply automatically.

Sanctioned weights: **300 · 400 · 700 · 800**. Weight 600 (SemiBold) is utility-only
(button labels, table headers) — never for headlines. Arial is the fallback for
PowerPoint, Keynote, and email — not for HTML.

The brand signature is the contrast between extrabold display (800) and light subhead (300).
Sentence case for headlines. Eyebrows are uppercase, 11px, weight 700, letter-spacing 0.22em.
Full type scale in `BRAND_RULES.md §5`.

### 3. Colors — tokens only, never hardcode

Always use CSS variables from `colors_and_type.css`. Never write a hex value that a
variable already covers.

**Blue always leads.** `--brand-deep` (#0050F0) and `--brand-bright` (#00D2FF) dominate
every layout. Family colors (`--credit-*`, `--supply-*`, `--lead-*`, `--cred-*`) exist
only to flag content *about* that specific Category — never as generic decoration
or background.

The brand gradient stops are exactly `10% / 90%` — `linear-gradient(90deg, #0050f0 10%, #00d2ff 90%)`.
Hero variant uses `115deg`. Using `0%/100%` is wrong and visible. See `BRAND_RULES.md §3`.

Two primary backgrounds: white `#fafbfc` (not pure `#fff`) or blue 115° gradient.
A family-color gradient is only allowed on a section opener that explicitly flags
that family. See `BRAND_RULES.md §12`.

### 4. Pills — strict geometry

A pill is a rectangle where `border-radius = height / 2` (use `9999px`). It is not
"a wide button with rounded corners". Sanctioned rotations: **0°** (default,
institutional) or **30°** (dynamic, tech). No other angles. No vertical pills.
No distortion. All outline pills in one composition share one color.

The signature pill cluster is at `assets/pill-cluster.svg` — 12 pills, 5 staggered rows
on the right edge of a 1920×1080 canvas, all uniform height. Use it as-is or as the
geometry reference. See `BRAND_RULES.md §6` and `§7`.

### 5. Icons — inline SVG, never `<img>`

CSS variables (`--icon-strong`, `--icon-soft`) only reach an SVG when it is inlined
in the DOM. An `<img src="icon.svg">` renders monochrome — never do this.

Read the icon file with `view`, paste the markup inline, wrap with a theme class
(`.icon-primary`, `.icon-credit`, `.icon-supply`, `.icon-lead`, `.icon-category-d`,
`.icon-ink`, `.icon-on-dark`). Sizes: `.icon-sm/md/lg/xl`. All classes documented in
`icons.css`.

Icon library: 165 duotone icons across 14 categories. Index in
`assets/icons/duotone/manifest.json`. Categories: finance, data, commerce, business,
communication, files, ui, arrows, navigation, security, status, devices, people, time.

Container variants (white box / colored box / outline) in `icons.css`.
Container `border-radius` = 22% of container size. See `BRAND_RULES.md §8`.

### 6. Voice and copy

No emoji. No exclamation marks. Sentence case for headlines. Title Case only for
product names (Category A, Category B, Category C, Category D).
Outcome-led copy ("Make confident credit decisions"), not feature-led. Include proof
points where relevant: 43 countries · 500M+ companies · 20,000+ customers · ~200 years.
Full guidance in `BRAND_RULES.md §14`.

---

## PRE-FLIGHT CHECKLIST — VERIFY BEFORE DELIVERING

Run this checklist on every artifact before showing it to the user. This mirrors the
final checklist in `OUTPUT_EXAMPLES.md`:

- [ ] Logo slot uses `assets/logo.svg` / `logo-white.svg` (placeholder unless user supplied a logo)
- [ ] `styles.css` linked, which loads `colors_and_type.css` with `@font-face` rules
- [ ] All colors reference CSS variables — no stray hex outside the token file
- [ ] Gradients use exactly `10% / 90%` stops (or `115°` hero variant)
- [ ] Page background is `#fafbfc` or the blue gradient — never pure `#fff`
- [ ] Headlines in sentence case, `#4b4b4b`; body in `#7c7c7c`; eyebrows in `#0050f0`
- [ ] H4 / subhead at weight 300 (Light) where contrast with extrabold is the point
- [ ] All pills have `border-radius: 9999px` and rotate at `0°` or `30°` only
- [ ] Outline pills (if any) all share the same color
- [ ] Icons are inlined `<svg>`, themed via wrapper class — no `<img src>` for duotone
- [ ] Shadows are blue-tinted (`rgba(0, 80, 240, …)`) — never gray
- [ ] Category asymmetric shadow only on white icon boxes over light bg
- [ ] Family colors only appear when content is *about* that family
- [ ] No emoji, no exclamation marks, no "click here" CTAs
- [ ] No `border-radius: 0` anywhere
- [ ] Proof points included where contextually appropriate

If any item fails, fix it before delivering. Do not deliver an artifact with known
violations and ask the user "is this OK?" — fix first.

---

## FILE MAP — WHAT'S IN THE PACKAGE

Full inventory in `MANIFEST.md`. Quick reference:

```
MANIFEST.md             ← READ FIRST every time
README.md               ← 60-second brand briefing
BRAND_RULES.md          ← 14 topics, OBRIGATÓRIO/PROIBIDO/VALORES/exemplos
LAYOUT_PATTERNS.md      ← 17 layouts as reproducible recipes
COMPONENTS.md           ← every UI component with snippets
OUTPUT_EXAMPLES.md      ← correct-output criteria per artifact type
colors_and_type.css     ← every design token (link this)
icons.css               ← duotone theming + icon containers
styles.css              ← single entry point — @imports the two above

assets/
  logo.svg              ← placeholder (light bg)
  logo-white.svg        ← placeholder (dark bg)
  pill-cluster.svg      ← signature cluster, 1920×1080
  icons/                ← 4 Category bespoke marks
  icons/duotone/        ← 165 themable icons in 14 categories
                          + manifest.json index

templates/              ← 12 runnable starting points
  cover.html · section-opener.html · stat.html · index.html
  feature-grid.html · icon-pill-list.html · two-column.html
  photo-left.html · marketing-hero.html · dashboard.html
  company-detail.html · sign-in.html

fonts/                  ← Open Sans Light/Regular/SemiBold/Bold/ExtraBold .ttf
```

---

## WORKING DISCIPLINE

- **Read the rule before writing the code.** If you're about to set a color, open
  `colors_and_type.css` and use the variable. If you're about to position a pill,
  open `BRAND_RULES.md §6`. If you're about to lay out a slide, open
  `LAYOUT_PATTERNS.md` and the matching `templates/*.html`.
- **Copy, don't reconstruct.** The package contains real SVG paths, real CSS tokens,
  real HTML templates. Use them. Never describe in markup what the file already says
  in vector form.
- **Tokens first, components second, templates third.** Build with variables. Compose
  with documented components. Anchor in template scaffolds.
- **When in doubt, ask before guessing.** If the user's request doesn't match a
  documented pattern, ask for clarification rather than improvising.

The point of this skill is fidelity. Everything you need to be faithful is in the
package. Read it, follow it, deliver clean work.
