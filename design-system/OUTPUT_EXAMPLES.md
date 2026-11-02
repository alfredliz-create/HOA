# the brand — Output Examples

> For each artifact type, what a **correct** output contains. Use as a checklist when finalizing.

---

## 1. Cover slide (institutional presentation)

**Tokens obrigatórios**
- Background: `linear-gradient(115deg, #0050f0 0%, #00d2ff 100%)`
- Logo: `assets/logo-white.svg` at top-left (height 64px, left 135, top 130)
- Headline: weight `800`, size `128px`, color `#fff`, tracking `-0.035em`, line-height `0.92`, sentence case
- Subhead: weight `400`, size `26px`, color `rgba(255,255,255,0.92)`, line-height `1.5`
- Pill cluster (signature, 12 pills, on-color paint) bleeding right
- Optional: small "the brand Worldwide Network" mark at `bottom: 78px, left: 135px`

**Layout esperado**
- Logo top-left
- Headline anchored at vertical baseline `460px`, max width `980px`
- Subhead at `700px`, max width `620px`
- Pill cluster fills the right ~700px, bleeds off-canvas

**Erros que invalidam**
- Headline centered horizontally
- Family-color gradient background (covers always use blue)
- Pure-white logo (use `logo-white.svg`, not a hex hack)
- Title Case headline
- Pill cluster missing or placed on the left edge
- Pill cluster at rotation other than 0°

---

## 2. Section opener slide

**Tokens obrigatórios**
- Background: family or blue 115° gradient
- Number-badge eyebrow pill (outline white, `56px` tall, with `38px` solid circle inside in `--brand-deep`)
- Headline `76px / 300` with one `<b>` clause at weight `800`, color `#fff`, line-height `1.18`
- Pill cluster (on-color, `--pill-accent` retuned to family)

**Layout esperado**
- Number badge at `top: 360, left: 135`
- Headline at `top: 450, left: 135`, width `1000`
- No body paragraph (the headline carries the slide)

**Erros que invalidam**
- Two `<b>` clauses in the headline (mutes the contrast)
- Using blue gradient when the section is family-coded
- Forgetting to retune `--pill-accent` to the family tone
- Adding a body paragraph (it's not in this layout)

---

## 3. Card de KPI em dashboard

**Tokens obrigatórios**
- Container: `card` (light) — background `#fff`, border `var(--border-hairline)`, radius `var(--radius-lg)`, shadow `var(--shadow-md)`, padding `var(--space-6)`
- Eyebrow: `.eyebrow` class, color `--brand-deep`
- Number: `.brand-text-gradient`, size `56px`, weight `800`, line-height `1`, tracking `-0.03em`
- Delta indicator: small flex row with arrow + percent, color `var(--status-success | danger | warning)`

**Layout esperado**
- Eyebrow → Number (gap `var(--space-3)`) → Delta (gap `var(--space-3)`)
- Width fluid in a 4-column grid

**Erros que invalidam**
- Multiple gradient numbers in the same card (one per card)
- Delta in primary blue (must be status color)
- Replacing the eyebrow with a regular `<label>`
- `border-radius: 0` on the card

---

## 4. Tela de onboarding SaaS

**Tokens obrigatórios**
- Either: white card on `--surface-1` page background with hairline border, OR split-screen with brand gradient on the right
- Logo at top of card (height 32–40px)
- Headline `h2-size / 800`, sentence case
- Step indicator: 3–5 pills in a row, only the current one is filled with `--brand-deep`, the rest are outline pills in the same color
- Primary button: filled gradient pill, full-width, height `56px`
- Field stack with `48px`-height inputs, labels above, gap `var(--space-4)`

**Layout esperado**
- Card max-width `480px`, centered horizontally
- Padding inside card: `var(--space-12)` / `var(--space-16)`
- Bottom links row: "Already have an account? Sign in" — body size, ghost-link styling

**Erros que invalidam**
- Step indicator using dots or numbers instead of pills
- Mixing outline-pill colors in the step indicator
- Using a family color for the primary button
- Placeholder-as-label on inputs
- Submit button at default browser height (~32px)

---

## 5. Post de LinkedIn (sem foco em produto — institucional)

**Tokens obrigatórios**
- Background: blue 115° gradient OR `#fafbfc` with a single drift pill behind
- Logo (positive or reversed depending on bg)
- One short headline, sentence case, weight `800`
- One short body line, weight `300`
- Optional middle-dot triplet: `Calm · Security · Control`
- No emoji; no exclamation marks
- Proof point if relevant: `43 countries · 500M+ companies · 20,000+ customers`

**Layout esperado**
- Square (1080×1080) or 4:5 (1080×1350) canvas
- Logo top-left or top-center
- Headline anchored mid-vertical, max width ~70% of canvas
- One pill or pill cluster as decoration (small, not the focus)

**Erros que invalidam**
- Family gradient on a generic post
- Title Case headline
- Emoji or `!`
- Two competing visual elements (the post is one headline with one supporting decoration)

---

## 6. Post de LinkedIn (com foco em produto — Category)

**Tokens obrigatórios**
- Background: family 115° gradient (e.g., `linear-gradient(115deg, var(--credit-deep), var(--credit-bright))`)
- Logo reversed (white)
- Category icon in a **white-box container** (`72×72`, radius `22%`, shadow removed since bg is colored)
- Headline `800`, white, sentence case
- Body `300`, white at 90% opacity

**Erros que invalidam**
- Using a different family's icon in the container
- Putting the icon in a colored-box variant (it'd compete with the bg)
- Promoting a feature without the Category name in the eyebrow

---

## 7. Email de convite para evento

**Tokens obrigatórios**
- Top band (full-bleed): blue 115° gradient, height ~120px, with logo-white centered
- Event card on white: hairline border, radius `var(--radius-lg)`, padding `var(--space-12)`
- Event title `h2 / 800 / sentence case`
- Date + location row: small eyebrow + body
- Primary CTA pill `Register`
- Footer: small print in `--brand-muted`, links in `--brand-deep`

**Layout esperado**
- Email body max-width `600px`
- Single-column (emails are vertical)
- One primary CTA — no competing buttons
- Pill cluster optional, very subtly in the top band only

**Erros que invalidam**
- Multi-column layout (most email clients render it poorly)
- Web fonts not specified with Arial fallback (email clients often strip Open Sans)
- Bright background on the body (must be white card on `#fafbfc`)
- Multiple CTAs of equal weight

---

## 8. Página de marketing (full landing)

**Tokens obrigatórios — by section**
1. **Nav** — sticky, hairline bottom, `Sign in` pill on the right
2. **Hero** — blue 115° gradient OR white-with-cluster; headline `--type-display`; one primary + one ghost CTA
3. **Stat strip** — 3 gradient-text numbers with eyebrow labels
4. **Solution grid** — 4 cards, each with its family icon container (proper Deep/Bright per family)
5. **Feature showcase** — 2-column with eyebrow + title + 4 mini features
6. **Customer logo strip** — grayscale wordmarks, height ~32px, gap `var(--space-12)`
7. **Footer mega-band** — gradient bg, headline, 4 link columns, logo-white

**Erros que invalidam**
- More than one primary button in the hero
- Solution grid mixing family fill rules (must follow §4 of BRAND_RULES)
- Footer in gray (must be brand gradient)
- Customer logos rendered in their native colors (must be grayscale to read as "trust")

---

## 9. Dashboard SaaS (authenticated)

**Tokens obrigatórios**
- Sidebar `240px` on `--surface-ink`
- Top bar `64px` white with hairline bottom
- Page heading `h2-size / 800` on first row of content
- KPI row: 4 cards
- Below: 2-column (table left + alert list + risk gauge right)
- All cards use the standard light-card recipe

**Layout esperado**
- Content padding `var(--space-8)`
- Max content width `1440px` (slightly wider than marketing, optimized for data density)
- Sidebar items grouped into 2–3 sections with hairline separators

**Erros que invalidam**
- Marketing pill clusters in the app surface
- Family color used as page chrome (only badges and KPI subjects flag families)
- Borders heavier than `1px`
- Gray-tinted shadows

---

## 10. Tela de company detail

**Tokens obrigatórios**
- Sidebar + top bar as dashboard
- Header band: company name `h1 / 800`, sub-row with country + tax-id + family badges using `·` separators
- Risk gauge as the verdict (top-right of header band)
- 4 small KPI cards summarizing the score
- Tabbed sections below (`Overview · Financials · Suppliers · Alerts · Documents`)
- Body: table of related entities + alerts column

**Erros que invalidam**
- Page background tinted with a family color
- Risk gauge without label text (color alone)
- Tab indicators on the left (Brand tabs are horizontal, underlined)
- Missing the alert column

---

## 11. Tela de sign-in

**Tokens obrigatórios**
- Two columns: white form left (50%), blue gradient + cluster right (50%)
- Logo positive at top of form column
- Headline `h2-size / 800 / sentence case`
- Two fields: Email, Password (both 48px)
- Primary pill button `Sign in`, full-width, height `56px`
- Ghost links below: `Forgot password?` and `Create account`
- Right column: brand statement, no form

**Erros que invalidam**
- Form on the right
- Form on top of the gradient column
- Brand statement on the left
- Single-column layout for desktop (split-screen is the brand signature)
- Logo-white in the form column (form is on white, use positive)

---

## Final checklist before delivering any output

Run through this list:
- [ ] Background is one of the sanctioned two (white or blue gradient), or a family gradient on a section opener.
- [ ] Blue dominates; family colors only appear when content is *about* that family.
- [ ] All gradients use `10% / 90%` stops (or the 115° hero variant).
- [ ] All pills have `border-radius: 9999px` (or `h/2`).
- [ ] All pill rotations are `0°` or `30°`.
- [ ] Headlines are sentence case.
- [ ] Eyebrows are uppercase, `0.22em` tracked, weight `700`.
- [ ] Open Sans is loaded; weights are 300/400/700/800 (+ 600 for utility).
- [ ] Shadows are blue-tinted (`rgba(0,80,240, …)`), not gray.
- [ ] Category shadow `-11px 11px 23px` only used on white icon boxes over light bg.
- [ ] No emoji. No exclamation marks. No "click here" CTAs.
- [ ] Duotone icons are inlined `<svg>`, not `<img src>`.
- [ ] Proof points where relevant: 43 countries / 500M+ / 20,000+ / ~200 years.
- [ ] No `border-radius: 0`.
- [ ] No pure `#000` text, no pure `#fff` page background.
- [ ] Logo: positive on light, reversed on dark/gradient; clear-space ≥ 1× height.
