# Satsuma Design System

A working design system for **Satsuma Ventures** — a private family venture studio based in Seattle. The brand is warm, organic, and unhurried.

> *A family venture studio cultivating ideas worth growing.*

The canonical brand book is [`../brand.html`](../brand.html) at the repository root. This folder contains the machine-readable layer: design tokens, base CSS, atomic preview cards, and an Agent Skills entry point.

---

## What is Satsuma Ventures?

Satsuma Ventures is a private family holding studio. It serves as the parent entity for a portfolio of internally ideated and built businesses — concepts developed, validated, and spun out as independent entities over time. The studio may also support select angel investments.

It sits at the intersection of **founder thinking** and **patient capital**. The studio cultivates a small number of ideas with genuine care — building the structure that lets them bear fruit.

The name *Satsuma* refers to a variety of mandarin orange — easy to peel, naturally sweet, grown in groves.

---

## Index

```
design-system/
├── README.md                  ← you are here
├── SKILL.md                   ← Agent Skills entry point
├── colors_and_type.css        ← single import for tokens + base type
├── assets/                    ← logo copies (so this folder is portable as a skill)
└── preview/                   ← atomic design system cards
```

The brand book (`../brand.html`) is the human-readable source of truth. This README documents the layer underneath — content fundamentals, visual foundations, and iconography rules — for designers and AI agents building new artifacts.

---

## Content fundamentals

Satsuma's voice is **warm but substantive** — a studio with a point of view, not a corporate holding vehicle. It speaks like a thoughtful founder, not a fund manager.

**Voice rules:**

- Write as a person, not an institution
- Use plain language — no jargon, no buzzwords
- Be specific rather than vague about what the studio does
- Never sound like a VC pitch deck
- Unhurried — the studio thinks in years, not quarters

**Tone qualities:** Warm. Confident without being boastful. Lightly narrative. Patient.

**Casing.**
- **Sentence case** for body, headings, taglines. Title Case is avoided.
- **UPPERCASE with +0.10–0.14em tracking** for labels, section markers, and nav links. Tiny size only (11–13px).
- Never use all-caps for body copy.

**Person & address.** First-person plural ("we") is acceptable for the studio, but the brand prefers neutral third-person where possible ("Satsuma cultivates…"). Direct "you" is rare — this isn't a marketing funnel.

**Punctuation.**
- Em dashes — used freely for parenthetical asides and shifts of tone.
- En dashes for ranges (`16 – 17px`).
- Middle-dot `·` (with hairline space) for meta separators: `Seattle, WA · satsumaventures.com · 2026`.
- Curly quotes and proper apostrophes. No straight quotes in display copy.

**Emoji & exclamation marks.** Neither. Emoji are not part of the brand. Exclamation marks read as eager and don't fit the studio's pace.

**Things to never write:** "synergies," "ecosystem play," "fund I," "thesis-driven," "AI-native," "next-gen," "world-class," "unlock value." A useful sniff test: would a thoughtful founder say this out loud to a friend? If no, cut it.

---

## Visual foundations

### Mood

Open. Quiet. Editorial. The page should feel like a printed letterpress card, not a SaaS marketing site. White space is **the** primary design element — not a polish step.

### Color

| Token | Hex | Role |
|---|---|---|
| **Grove** | `#2E5428` | Primary brand color. Structural — nav, headings, marks |
| **Satsuma** | `#D4681E` | Accent only. Section numbers, eyebrows, en-dash bullets, link hover. Earns its place |
| **Deep Ink** | `#1C2818` | Body text, high-contrast surfaces |
| **Linen** | `#F2ECDD` | **Primary page background.** Warm, paper-like — never plain white |
| **Warm Bark** | `#E8DED0` | Card surfaces, warm fills |
| **Mist** | `#F6F8F3` | Cool surface alternative — used rarely, for contrast |
| **Sage** | `#7AAA68` | Decorative supporting green |
| **Sage-700** | `#4F7441` | Decorative — was previously used for labels but the page got too green |
| **Rule** | `#D8DDD0` | Hairline dividers |
| **Muted** | `#5A6B52` | Secondary text |

Each primary (Grove, Satsuma, Sage) has a full 11-stop scale in `colors_and_type.css` for hover/disabled/border states.

**Rules:**
- Grove is **dominant** — navigation, headings, structural color, buttons, link defaults.
- Satsuma is **sparing but present** — it shows up in earned, repeating micro-moments: section numbers (`01`, `02`…), eyebrow labels, brand-list en-dash bullets, the fruit in the mark, and link hover. Never as a fill on a large surface.
- Linen is the default page background. Never plain white.
- Sage **is not the default label color** — it was too close to Grove at scale and muddied the page. Default labels are Deep Ink; eyebrows are Satsuma.
- Warm Bark is for cards and inline code chips.

**Label vs eyebrow — when to use which:**

| Style | Color | Use for |
|---|---|---|
| **Eyebrow** | Satsuma uppercase, +0.14em tracking | One per surface — introduces a section header, hero, or footer block |
| **Label** | Deep Ink uppercase, +0.14em tracking | In-section sub-labels that mark sub-blocks ("Mission", "Tagline") |
| **Section number** | Satsuma, small | "01", "02"… next to section titles |

### Typography

Two families. No more.

- **Libre Baskerville** — display serif. Regular & italic only. Used for headlines, tagline, and editorial moments.
- **Plus Jakarta Sans** — body & UI. Weights 300 / 400 / 500 / 600. Generous line height (1.75).
- **JetBrains Mono** — system mono, used only for inline code chips and hex codes.

**Scale:**

| Step | Size | Family / weight |
|---|---|---|
| Display / Hero | 48 – 64px | Libre Baskerville, regular |
| H1 | 36 – 42px | Libre Baskerville, regular |
| H2 | 24 – 28px | Plus Jakarta Sans, 500 |
| H3 | 18 – 20px | Plus Jakarta Sans, 500 |
| Body | 16 – 17px | Plus Jakarta Sans, 400, line-height 1.75 |
| Label / Caption | 12 – 13px | Plus Jakarta Sans, 500, tracked +0.1em |

All three families are loaded from Google Fonts; no local TTF bundling required.

### Spacing & layout

- Spacing scale: `xs 8 → sm 16 → md 32 → lg 48 → xl 80 → 2xl 128`. Multiples of 8.
- Page content caps at `860px`; reading copy caps at `680px` or `60ch`.
- **Left-aligned** by default. Centered only for intentional hero moments.

### Backgrounds & imagery

- The page background is **flat Linen `#F2ECDD`** — warm, paper-like, neutral. Never plain white, never plain Mist.
- Mist remains in the palette as a cool, lighter surface alternative — used rarely.
- No textures, no noise, no full-bleed photography.
- Photography (when used) is naturalistic. Botanical references are welcome.
- **No gradients.** None.

### Borders, shadows, motion

- Hairlines only — `1px solid var(--rule)` (`#D8DDD0`).
- **No shadow system.** Elevation is communicated through color (Warm Bark vs Linen) and hairline borders.
- Corner radii: `3px` chips · `6px` buttons · `8px` cards · `12px` large surface. Nothing fully rounded.
- Motion is quiet: easing `cubic-bezier(0.22, 0.61, 0.36, 1)`, durations 160/220/400ms. Color transitions only — no scale, no bounce, no spring.

### Hover & press

- **Links:** hover shifts Grove → Satsuma. No underline change.
- **Buttons (primary, Grove fill):** hover → `Grove-600 #264521`. Press → `Grove-700 #1E371A`.
- **Buttons (ghost, Grove border):** hover → `Grove-100 #EBF0EB`. Press → `Grove-200`.
- Focus rings: 2px Sage outline with 2px offset. No glow.

### What to avoid

- Anything reading as a VC fund or institutional investor
- Aggressive CTAs ("Get started today")
- Orange used prominently — it is an accent
- Rigid grids, corporate templates
- Gradients, drop shadows, glassmorphism
- Emoji, sticker-style decoration

---

## Iconography

**Satsuma's source brand uses essentially no iconography.** The brand is typography-led. Words and white space carry the meaning.

**Practical guidance:**

- **Default: don't use icons.** Try a typographic solution first.
- **If genuinely required**, use [Lucide](https://lucide.dev) at 1.5px stroke, 20–24px, color Grove. *This is a flagged substitution — no icons existed in the source.*
- **Never:** Material Icons (too geometric), Font Awesome (too ornate), emoji, Unicode beyond `·` `—` `–` `★`.
- **The mandarin fruit in the logomark** is the brand's one piece of imagery. Don't extract it as a decorative icon.

**Logo files** (in [`assets/`](assets/)):

| File | Use |
|---|---|
| `satsuma-logomark.svg` | Mark alone on light |
| `satsuma-logomark-light.svg` | Mark alone on Deep Ink / Grove |
| `satsuma-lockup.svg` | Horizontal lockup, default |
| `satsuma-lockup-light.svg` | Horizontal lockup on dark |
| `satsuma-lockup-stacked.svg` | Stacked lockup — covers, hero |
| `satsuma-lockup-stacked-light.svg` | Stacked lockup on dark |

**Lockup rules:** Never recolor. Never distort. Maintain clear space equal to the height of the mark on all sides.
