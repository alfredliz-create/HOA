# the brand — Components

> Per component: **states**, **tokens used**, **variants**, **rules of use**, and a minimal working snippet.
> All snippets assume `styles.css` is linked. Inline duotone SVGs as noted in `icons.css`.

---

## Pill

The brand's defining graphic. See **BRAND_RULES §6** for geometry.

**Variants**
- `pill--filled-gradient` — `background: var(--brand-gradient)` (default)
- `pill--filled-solid` — `background: var(--brand-deep)`
- `pill--outline` — `background: transparent; border: 2px solid var(--brand-deep)`
- Family variants — replace gradient/solid with the family pair
- With **knob** — same-height circle inset in one end

**States** — pill is decorative, not interactive by default. Used as a row container or chrome accent.

**Tokens** — `--brand-gradient`, `--brand-deep`, `--brand-bright`, `--radius-pill`

**Rules**
- USE when you need the brand's signature shape inline.
- DON'T USE in dense tabular UI — use chips or badges instead.
- All outline pills in one composition must share one color.
- Sanctioned rotations: `0deg` (default) or `30deg`. No others.

**Snippet**
```html
<div class="pill pill--filled-gradient" style="height:56px; width:240px; border-radius: var(--radius-pill); background: var(--brand-gradient); display:inline-flex; align-items:center; justify-content:center; color:#fff; font-weight:700;">
  See platform
</div>

<!-- Outline with knob -->
<div style="position:relative; height:56px; width:240px; border-radius: var(--radius-pill); border: 2px solid var(--brand-deep); display:inline-flex; align-items:center; padding-left: 64px;">
  <span style="position:absolute; left:4px; top:4px; width:48px; height:48px; border-radius:50%; background: var(--brand-deep);"></span>
  <span style="font-weight:700; color: var(--brand-title);">Step 01</span>
</div>
```

---

## Button (primary / secondary / ghost)

**Variants**
1. **Primary** — filled D→B gradient pill, white label, weight 700.
2. **Secondary** — solid `var(--brand-deep)` pill, white label.
3. **Ghost** — transparent, weight 700, color `var(--brand-deep)`, optional trailing `→`. No background.

**States**
- **Rest** — as defined.
- **Hover** — primary/secondary: subtle background tint shift toward `--brand-deep` (Multiply 5% black, NOT opacity reduction). Ghost: underline.
- **Press** — slightly darker fill (Multiply 5% more black). **No scale reduction.**
- **Focus-visible** — `outline: 2px solid var(--brand-deep); outline-offset: 3px; border-radius: var(--radius-pill);`
- **Disabled** — `opacity: 0.4; pointer-events: none;`

**Tokens** — `--brand-gradient`, `--brand-deep`, `--radius-pill`, `--duration-medium`, `--ease-out`

**Sizes** — default height `48px` (padding `0 24px`); large `56px` (`0 28px`); small `40px` (`0 20px`).

**Rules**
- ONE primary button per surface. Multiple primaries dilute hierarchy.
- Ghost is the secondary action paired with a primary on a hero / form / modal.
- Never use opacity-based hover.
- Label uses sentence case ("Request a demo"), not Title Case.

**Snippet**
```html
<button class="btn btn--primary"
  style="height:48px; padding:0 24px; border:none; border-radius: var(--radius-pill);
         background: var(--brand-gradient); color:#fff; font: 700 16px/1 'Open Sans',Arial,sans-serif;
         transition: filter 300ms var(--ease-out);">
  Request a demo
</button>

<button class="btn btn--secondary"
  style="height:48px; padding:0 24px; border:none; border-radius: var(--radius-pill);
         background: var(--brand-deep); color:#fff; font:700 16px/1 'Open Sans',Arial,sans-serif;">
  Sign in
</button>

<a href="#" class="btn btn--ghost"
   style="display:inline-flex; align-items:center; gap:6px; height:48px;
          color: var(--brand-deep); font:700 16px/1 'Open Sans',Arial,sans-serif; text-decoration:none;">
  See the platform <span aria-hidden="true">→</span>
</a>

<style>
  .btn--primary:hover, .btn--secondary:hover { filter: brightness(0.95); }
  .btn--primary:active, .btn--secondary:active { filter: brightness(0.9); }
  .btn:focus-visible { outline: 2px solid var(--brand-deep); outline-offset: 3px; }
  .btn:disabled { opacity: 0.4; pointer-events: none; }
</style>
```

---

## Card

**Variants**
1. **Default (light)** — white `#fff`, hairline border, blue-tinted shadow.
2. **Hover** — translates up 2px, swaps shadow to `--shadow-glow`.
3. **Dark panel** — on `--surface-ink` background, fill `rgba(255,255,255,0.04)`, border `rgba(255,255,255,0.06)`, inset top-light highlight `inset 0 1px 0 rgba(255,255,255,0.06)`.

**States** — rest, hover, focus-visible (outline `var(--border-brand)`).

**Tokens** — `--surface-0`, `--border-hairline`, `--shadow-md`, `--shadow-glow`, `--radius-lg`, `--space-6` / `--space-8`, `--ease-out`

**Rules**
- Internal padding 24–40px (`--space-6` to `--space-10`).
- Never use `border-radius: 0`. Default `--radius-lg` (16px).
- Use `--radius-xl` (24px) for hero / feature cards.
- On dark backgrounds switch to the dark-panel variant — do not invert the light-card recipe.

**Snippet**
```html
<article class="card"
  style="background: var(--surface-0); border: var(--border-hairline);
         border-radius: var(--radius-lg); padding: var(--space-8);
         box-shadow: var(--shadow-md);
         transition: transform 300ms var(--ease-out), box-shadow 300ms var(--ease-out);">
  <h3>Card title</h3>
  <p>Card body copy describing the card's purpose.</p>
</article>

<style>
  .card:hover { transform: translateY(-2px); box-shadow: var(--shadow-glow); }
</style>
```

---

## Icon container (3 variants)

The most-important icon pattern in the brand book (p.16–17).

**Variants**
1. **`.icon-box--white`** — white fill, asymmetric `--shadow-solution`. **Light backgrounds only** (remove the shadow on dark).
2. **`.icon-box--colored`** — solid family fill (per-family: Credit + Lead use Bright; Supply + Category D use Deep). No shadow.
3. **`.icon-box--outline`** — transparent fill, 2px colored stroke. Use over photography or palette-colored fields.

**Tokens** — `--shadow-solution`, `--radius-icon-box` (22%), family Deep / Bright tokens.

**Rules**
- Container corner radius is `22% of size` (scales).
- Always pair with a Category icon (or duotone icon) **of the same family**.
- White box on dark → drop the shadow.
- Outline variant is the "on-photo" treatment.

**Snippet**
```html
<!-- White box, light bg, Credit family icon -->
<div class="icon-box icon-box--white" style="width:72px; height:72px; border-radius: 22%;">
  <!-- inline category-a.svg here -->
</div>

<!-- Colored box, Lead family — fill is Bright (#ff0087) -->
<div class="icon-box icon-box--colored" style="--box-fill: var(--lead-bright); width:72px; height:72px; border-radius: 22%;">
  <!-- inline category-c.svg (tones inverted to white) -->
</div>

<!-- Outline, over photo -->
<div class="icon-box icon-box--outline" style="--box-stroke:#fff; width:72px; height:72px; border-radius: 22%;">
  <!-- inline icon, single-color white -->
</div>
```

---

## Eyebrow

**Variants** — light-mode (`color: var(--brand-deep)`) and dark-mode (`color: #fff`).

**States** — static. Eyebrow is a typographic label, not interactive.

**Tokens** — `--type-eyebrow` (11px), `--fw-bold`, `--tracking-eyebrow` (0.22em), `--brand-deep`

**Rules**
- Uppercase. Always.
- Pair with a headline below (gap `var(--space-4)` or `var(--space-3)`).
- One eyebrow per section. Two reads as "filler."

**Snippet**
```html
<span class="eyebrow">Category A</span>
<!-- ↓ headline immediately below -->
<h2>Make confident credit decisions</h2>
```

The `.eyebrow` class is defined in `colors_and_type.css`.

---

## Nav / header

**Variants** — public site (`light`) vs in-app top bar.

**Public-site header**
- Background `--surface-1` or transparent over hero.
- Logo left (`assets/logo.svg`, h: 32px).
- Nav links right: `font-weight: 600`, `color: var(--brand-title)`, `gap: var(--space-6)`.
- Optional right-side primary button.
- Hairline bottom border `--border-hairline`.

**In-app top bar**
- White background, `height: 64px`.
- Page title left (h2-size, weight 700).
- Search input center (max-width 480px).
- User menu right (avatar 32px + chevron).

**Snippet (public nav)**
```html
<header style="position: sticky; top:0; z-index: 10; background: rgba(250,251,252,0.92); backdrop-filter: blur(8px); border-bottom: var(--border-hairline);">
  <nav style="max-width: var(--content-max); margin: 0 auto; padding: var(--space-4) var(--space-8); display: flex; align-items:center; gap: var(--space-8);">
    <img src="assets/logo.svg" alt="Logo" style="height: 32px; width: auto;">
    <ul style="display:flex; gap: var(--space-6); margin: 0 auto 0 var(--space-12); padding:0; list-style:none;">
      <li><a href="#" style="color:var(--brand-title); font-weight:600; text-decoration:none;">Solutions</a></li>
      <li><a href="#" style="color:var(--brand-title); font-weight:600; text-decoration:none;">Platform</a></li>
      <li><a href="#" style="color:var(--brand-title); font-weight:600; text-decoration:none;">Customers</a></li>
      <li><a href="#" style="color:var(--brand-title); font-weight:600; text-decoration:none;">About</a></li>
    </ul>
    <a href="#" style="height:44px; padding:0 20px; border-radius: var(--radius-pill); background: var(--brand-deep); color:#fff; font-weight:700; display:inline-flex; align-items:center; text-decoration:none;">Sign in</a>
  </nav>
</header>
```

---

## KPI card

**Anatomy** — eyebrow label, giant number (gradient, weight 800), delta indicator (small, colored by direction), supporting copy.

**Variants** — neutral (default), `kpi--up` (green delta), `kpi--down` (orange/red delta), `kpi--warn` (warning yellow).

**Tokens** — `--brand-gradient`, `--shadow-md`, `--status-success`, `--status-danger`, `--status-warning`

**Rules**
- One KPI dominates per card (the giant number). Delta is small and secondary.
- Delta colors: success uses `--credit-bright`; danger uses `--supply-deep`; warning uses `--supply-bright`. **Status colors re-use family Brights / Deeps deliberately.**
- Always include an eyebrow with the metric label.

**Snippet**
```html
<article class="kpi-card card" style="padding: var(--space-6);">
  <span class="eyebrow">Active monitors</span>
  <div class="brand-text-gradient" style="margin-top: var(--space-3); font-size: 56px; font-weight: 800; letter-spacing: -0.03em; line-height: 1;">
    12,438
  </div>
  <div style="margin-top: var(--space-3); display: flex; align-items: center; gap: 8px; color: var(--status-success); font-weight: 700;">
    <span aria-hidden="true">↑</span> 4.2% vs. last month
  </div>
</article>
```

---

## Risk gauge

**Anatomy** — semicircular meter (180° arc). Track: `rgba(0,0,0,0.06)`. Fill: D→B gradient or risk-band color. Center: numeric score (extrabold, gradient text), supporting label.

**Variants**
- **Default** — `--brand-gradient` fill (informational, no judgment).
- **By risk band** — Low: `--credit-bright`. Medium: `--supply-bright`. High: `--supply-deep`.

**Tokens** — `--brand-gradient`, family Brights / Deeps for status, `--brand-title`

**Rules**
- Use SVG (semicircular arc) — not a CSS hack.
- Score scale documented next to the gauge ("0–1000" or "AAA–D").
- Never use color alone to convey the band; pair with the label text.

**Snippet**
```html
<svg viewBox="0 0 200 110" width="200" height="110" aria-label="Risk score 740">
  <defs>
    <linearGradient id="rgGrad" x1="0%" x2="100%">
      <stop offset="10%" stop-color="#0050f0"/>
      <stop offset="90%" stop-color="#00d2ff"/>
    </linearGradient>
  </defs>
  <path d="M 10 100 A 90 90 0 0 1 190 100" fill="none" stroke="rgba(0,0,0,0.06)" stroke-width="14" stroke-linecap="round"/>
  <path d="M 10 100 A 90 90 0 0 1 156 38" fill="none" stroke="url(#rgGrad)" stroke-width="14" stroke-linecap="round"/>
  <text x="100" y="84" text-anchor="middle" font-family="Open Sans" font-weight="800" font-size="36" fill="url(#rgGrad)">740</text>
  <text x="100" y="105" text-anchor="middle" font-family="Open Sans" font-weight="700" font-size="11" letter-spacing="0.22em" fill="#7c7c7c">RISK SCORE</text>
</svg>
```

---

## Badge / tag (family flag)

**Variants** — one per Category, plus neutral.

**Anatomy** — small pill, `height: 24px`, padding `0 12px`. Background is the family colored-box fill (Bright for Credit/Lead, Deep for Supply/Category D), label is white. Font: `12px / 700 / sentence case`.

**Tokens** — family colors, `--radius-pill`

**Rules**
- USE in app surfaces to flag a record as belonging to a Category.
- DON'T USE more than two distinct family badges in a single row — that's a sign your data model is leaking.

**Snippet**
```html
<span style="display:inline-flex; align-items:center; height:24px; padding:0 12px; border-radius: var(--radius-pill); background: var(--credit-bright); color:#fff; font: 700 12px/1 'Open Sans',Arial,sans-serif;">
  Credit
</span>
```

---

## Table row

**Anatomy** — `tr` with `padding: var(--space-3) var(--space-4)`, `border-bottom: var(--border-hairline)`, first cell may carry a badge or avatar.

**States**
- **Rest** — white background.
- **Hover** — `background: rgba(0,80,240,0.04)`; cursor pointer if interactive.
- **Selected** — `background: rgba(0,210,255,0.08)`; left border `3px solid var(--brand-deep)` (offset 0).
- **Header row** — `background: var(--surface-2)`, eyebrow-style labels (`11px / 700 / 0.22em / uppercase / var(--brand-muted)`).

**Tokens** — `--border-hairline`, `--space-3` / `--space-4`, `--brand-deep`, `--surface-2`

**Rules**
- Header text is eyebrow style (the brand's only place where uppercase appears in app surfaces).
- Numbers right-aligned, names left.
- No zebra stripes — the hairline border is enough rhythm.

**Snippet**
```html
<table style="width: 100%; border-collapse: collapse; font-size: 14px;">
  <thead>
    <tr style="background: var(--surface-2);">
      <th style="padding: var(--space-3) var(--space-4); text-align:left; font: 700 11px/1 'Open Sans'; letter-spacing: 0.22em; text-transform: uppercase; color: var(--brand-muted);">Company</th>
      <th style="padding: var(--space-3) var(--space-4); text-align:left; font: 700 11px/1 'Open Sans'; letter-spacing: 0.22em; text-transform: uppercase; color: var(--brand-muted);">Country</th>
      <th style="padding: var(--space-3) var(--space-4); text-align:right; font: 700 11px/1 'Open Sans'; letter-spacing: 0.22em; text-transform: uppercase; color: var(--brand-muted);">Score</th>
    </tr>
  </thead>
  <tbody>
    <tr style="border-bottom: var(--border-hairline);">
      <td style="padding: var(--space-3) var(--space-4); color: var(--brand-title); font-weight: 600;">Empresa Latam S.A.</td>
      <td style="padding: var(--space-3) var(--space-4); color: var(--brand-body);">Brazil</td>
      <td style="padding: var(--space-3) var(--space-4); text-align:right; font-weight: 700; color: var(--brand-title); font-variant-numeric: tabular-nums;">740</td>
    </tr>
  </tbody>
</table>
```

---

## Alert / notification

**Variants** — `info`, `success`, `warning`, `danger`.

**Anatomy** — horizontal flex card with status icon (24×24), title (`14px / 700`), body (`13px / 400`), close button right.

**Tokens** — `--status-info`, `--status-success`, `--status-warning`, `--status-danger`, `--radius-md`, `--shadow-sm`

**Status colors (re-uses family palette)**
- info: `--brand-bright` (`#00d2ff`)
- success: `--credit-bright` (`#00cc00`)
- warning: `--supply-bright` (`#ffbd28`)
- danger: `--supply-deep` (`#ff3700`)

**Rules**
- Left border accent `4px solid <status color>`.
- Background `#fff`, border `var(--border-hairline)`.
- Body text stays `--brand-title` / `--brand-body` — only the icon + left border carry the status color.
- Never use status color as the entire background — that's a banner, not an alert.

**Snippet**
```html
<aside role="status" style="display:flex; gap:12px; padding: var(--space-4); background:#fff; border:var(--border-hairline); border-left: 4px solid var(--status-warning); border-radius: var(--radius-md); box-shadow: var(--shadow-sm); max-width: 480px;">
  <span class="brand-icon icon-supply" style="width:24px; height:24px; flex:none;"><!-- inline status/seal-warning.svg --></span>
  <div>
    <div style="font: 700 14px/1.3 'Open Sans',Arial,sans-serif; color: var(--brand-title);">Counterparty score declined</div>
    <div style="margin-top:4px; font: 400 13px/1.5 'Open Sans',Arial,sans-serif; color: var(--brand-body);">Empresa Latam S.A. moved from 740 → 612 (-128) in the last 30 days.</div>
  </div>
</aside>
```

---

## Form field

**Anatomy** — label above input. Input `height: 48px`, `border: var(--border-default)`, `border-radius: var(--radius-xs)` (4px), `padding: 0 14px`.

**States**
- **Rest** — as above.
- **Focus** — `border-color: var(--brand-deep); box-shadow: 0 0 0 3px rgba(0,80,240,0.15)`.
- **Error** — `border-color: var(--status-danger)`; helper text in danger color below.
- **Disabled** — `background: var(--surface-2); opacity: 0.7`.

**Tokens** — `--border-default`, `--radius-xs`, `--brand-deep`, `--status-danger`, `--space-3`

**Rules**
- Always label fields explicitly (`<label for="...">`) — no placeholder-as-label.
- Field height stays `48px` for consistency with primary button height.

**Snippet**
```html
<label for="email" style="display:block; font: 600 13px/1 'Open Sans',Arial,sans-serif; color: var(--brand-title); margin-bottom: var(--space-2);">Email</label>
<input id="email" type="email"
  style="display:block; width:100%; height:48px; padding:0 14px; border-radius: var(--radius-xs); border: var(--border-default); font-family: 'Open Sans',Arial,sans-serif; font-size: 16px; color: var(--brand-title); background: #fff;">
```

---

## Sidebar (in-app navigation)

**Anatomy** — `240px` wide, full-height, dark `--surface-ink` background. Logo top, nav list, footer (profile).

**Item anatomy** — `height: 44px`, padding `0 20px`, `display:flex; align-items:center; gap: 12px`. Icon `20×20` themed `.icon-on-dark`. Label `14px / 600 / rgba(255,255,255,0.85)`.

**States**
- Rest — as above.
- Hover — `background: rgba(255,255,255,0.04)`.
- Active — `background: rgba(0,210,255,0.10)`; left border `3px solid var(--brand-bright)` inset; label color `#fff`.

**Rules**
- Group nav items into 2–3 logical sections separated by a hairline `rgba(255,255,255,0.06)`.
- Footer: small avatar + name + chevron — never logout button alone.

**Snippet** — see `templates/dashboard.html`.

---

## Chips

**Anatomy** — small pill (`height: 28px`, padding `0 12px`), `border-radius: var(--radius-pill)`, hairline border, white background, weight 600 label.

**Variants**
- Default — neutral chip.
- Selected — fill `var(--brand-deep)`, white label.
- Removable — trailing `×` icon.

**Tokens** — `--radius-pill`, `--border-hairline`, `--brand-deep`

**Snippet**
```html
<span style="display:inline-flex; align-items:center; height:28px; padding:0 12px; border-radius: var(--radius-pill); background:#fff; border: var(--border-hairline); font: 600 13px/1 'Open Sans',Arial,sans-serif; color: var(--brand-title);">
  Brazil
</span>
```
