# the brand Design Skill

> Brand & UI rules, tokens, assets, and templates for **the brand** — the leading counterparty insights solutions and commercial data provider across 43 countries throughout Latin America and the Caribbean. Exclusive Latin-American partner of the global the brand Worldwide Network.

Generated from the **the brand 2024 Brand Book** (`EN_BRANDBOOK_2024.pdf`, 29 pages). This package is the canonical source — when a generator decision conflicts with anything visible in a screenshot or memory, the rules in here win.

---

## 1 · COMPANY CONTEXT

**the brand** helps organizations succeed through **data-driven relationships with suppliers and customers**, transforming risk decisions through SaaS platforms paired with proprietary data, designed to enhance key business workflows.

Proof points to weave into copy where relevant:
- **43 countries** throughout Latin America and the Caribbean
- **20,000+ customers**
- **500M+ companies** in the global data graph
- **~200 years** of the brand Worldwide Network heritage

### Categories (4) — categorical, not decorative

| Family | Deep | Bright | Colored-box fill | Stands for |
|---|---|---|---|---|
| **Category A** | `#005f32` | `#00cc00` | Bright | calm · security · control |
| **Category B**  | `#ff3700` | `#ffbd28` | Deep    | speed · motion · technology |
| **Category C**    | `#78005f` | `#ff0087` | Bright  | growth · reach · activation |
| **Category D**        | `#8e00d8` | `#00ffcd` | Deep    | humanized · simplified · bold |

Family colors flag a specific Category. **They never decorate a generic page.**

---

## 2 · CORE PRINCIPLES — read before generating anything

1. **BLUE ALWAYS LEADS.** Brand Deep `#0050f0` + Bright `#00d2ff` are the default for every surface, pill, and decoration. Family greens/oranges/pinks/purples are secondary and **categorical** — used only to flag a specific Category.
2. **Pills are the brand's defining graphic.** Rectangle with `radius = height / 2`, applied at **0° (default)** or **30° (dynamic)**. Never vertical, distorted, or other angles.
3. **The signature pill cluster** — 12 pills in 5 staggered rows on the right edge of a 1920×1080 canvas, bleeding off, all 0°, height-uniform (h=105). On light backgrounds each pill gets a D→B gradient (fill or 2px gradient ring); on colored backgrounds it gets solid-accent + fade-to-transparent + white 0.6 outlines (the "delicate" treatment).
4. **Two primary backgrounds:** (a) blue D→B gradient with white delicate pills, (b) white `#fafbfc` with blue D→B gradient pills. A family-gradient background is the exception — only on a section opener that flags one specific Category.
5. **The gradient stops are 10% / 90%, never 0% / 100%.** The named token is `--brand-gradient`.
6. **Open Sans, four sanctioned weights:** 300 Light, 400 Regular, 700 Bold, 800 Extrabold. SemiBold 600 only for utility UI labels. Arial is the system fallback.
7. **No emoji. No exclamation marks. Sentence case for headlines.** All-caps is reserved for tracked eyebrows (`tracking: 0.22em`).
8. **Duotone icons must be inlined in the DOM** for `--icon-strong` / `--icon-soft` theming to apply. An `<img src="icon.svg">` falls back to monochrome.
9. **All shadows are blue-tinted, never gray.** The Category icon shadow `-11px 11px 23px rgba(0,0,0,0.15)` is intentionally asymmetric and only used on white icon boxes over light backgrounds.
10. **No `border-radius: 0` anywhere.** Even tiny chips have at least 4px. The brand's vocabulary is round.

---

## 3 · WHERE TO LOOK

When asked to generate anything, read in this order:

1. **`BRAND_RULES.md`** — every rule, numerically. Use this as the checklist.
2. **`LAYOUT_PATTERNS.md`** — every layout in the system as a reproducible recipe (grid + structure + spacing + HTML snippet + common error).
3. **`COMPONENTS.md`** — every component (pill, button, card, eyebrow, icon container, KPI, badge, nav, table row, alert) with states, tokens, snippets.
4. **`OUTPUT_EXAMPLES.md`** — what a correct output looks like for each artifact type (cover slide, dashboard, sign-in, post, email).
5. **`styles.css`** — the single CSS entry point (it `@import`s `colors_and_type.css` for tokens + `icons.css` for duotone theming).
6. **`templates/`** — 13 ready HTML templates (cover, section opener, stat, content+photo, feature grid, icon-pill list, two-column, photo-left, index, marketing hero, dashboard, company detail, sign-in). Copy one and edit, don't reinvent.
7. **`assets/`** — official logos, four Category icons, the pill cluster SVG, and the duotone icon library (165 icons in 14 categories).
8. **`fonts/`** — Open Sans `.ttf` for self-hosting. Five sanctioned weights only.

---

## 4 · HOW TO USE

**To build a slide deck** → start from `templates/cover.html` + the relevant section openers + the content templates. Keep the pill cluster decoration. Edit text only.

**To build a marketing page** → start from `templates/marketing-hero.html` and document the lower sections by composing the feature/photo/two-column templates.

**To build a SaaS app screen** → start from `templates/dashboard.html` or `templates/company-detail.html` for an authenticated screen, `templates/sign-in.html` for auth.

**To produce CSS for production** → copy the three CSS files into your project; never hardcode a hex value a token covers. To re-skin the system into a different brand, only the tokens in `colors_and_type.css` and the logo SVGs in `assets/` need to change.

**If invoked with no guidance**, ask:
1. **What** is being built (deck, page, app screen, dashboard, email).
2. **For whom** (sales, marketing, internal, customer-facing).
3. **What surface** (HTML, slide, embedded component, production code).
4. **How much variation** (one polished take, or 3–5 explorations).

---

## 5 · NON-NEGOTIABLES (the floor of brand compliance)

A generated output is **wrong** if any of these are violated:

- Hard-coded a hex value a token covers
- Used a family color (green/orange/pink/purple) decoratively, outside its Category context
- Used a gradient with stops other than `10%` / `90%`
- Used a pill at any rotation other than `0°` or `30°`
- Mixed two different outline-pill colors in the same composition
- Used `<img src>` for a duotone icon expected to be themed
- Used any font other than Open Sans (or Arial fallback in non-web surfaces)
- Used an emoji or an exclamation mark in body copy
- Used title case on headlines (sentence case only)
- Used pure `#000` or `#fff` for body text or page backgrounds
- Used a gray-toned shadow instead of a blue-toned one
- Used `border-radius: 0` anywhere

If you cannot meet a rule because the input is ambiguous, ask the user instead of guessing.
