---
name: satsuma-design
description: Use this skill to generate well-branded interfaces and assets for Satsuma, a private family venture studio based in Seattle — for production work or throwaway prototypes, mocks, slides, and landing pages. Contains essential design guidelines, colors, type tokens, fonts, logo assets, and component patterns.
user-invocable: true
---

# Satsuma — Design Skill

Satsuma is a private family venture studio. The brand is **warm, organic, unhurried**. Not corporate. Not VC. White space is the primary design element; typography carries the meaning.

Read [`README.md`](README.md) in this folder for the full brand context — content fundamentals, visual foundations, iconography, voice rules. Then explore the other files:

- [`colors_and_type.css`](colors_and_type.css) — drop-in CSS variables for color, type, spacing, motion. Import this first in any new artifact.
- [`assets/`](assets/) — six logo SVGs (mark and lockup, each in stacked / horizontal × light / dark).
- [`preview/`](preview/) — atomic design system cards (colors, type specimens, components). Useful as references when assembling new layouts.

The canonical brand book is [`brand.html`](../brand.html) at the repository root. Open it in a browser when in doubt about typographic rhythm, spacing, or color use.

## When working on visual artifacts (slides, mocks, prototypes)

Copy assets out of `assets/` into your output. Import `colors_and_type.css` as the foundation. Keep static HTML files self-contained where possible. Match the rhythm of `../index.html` — generous margins, two type families only, accent orange used like punctuation.

## When working on production code

Read the rules in `README.md` and the tokens in `colors_and_type.css`. Use the CSS variables; don't hardcode hex. Honor the "Grove is structural, Satsuma is accent" rule strictly — if you ever find yourself filling a large surface with `#D4681E`, stop.

## When invoked without further guidance

Ask the user what they want to build or design. Ask a few short clarifying questions about audience, scope, and surface (landing, deck, app screen, brand asset). Then act as an expert designer and produce HTML artifacts or production code, depending on the need.

## Photo credits — the `pexels-link` class

Where photography is sourced from Pexels (via the `pexels_search_photos` tool), the delivered HTML must credit it inline, adjacent to the image: "Photo by [Photographer] on Pexels", linked to the photo page.

The credit is a caption, not a call to action — it should read as quiet text. Define and use a `pexels-link` class for the anchor:

- Inherits the caption's size, weight, and muted color — no link color, no underline at rest
- On hover: a standard arrow glyph (`↗`) appears after the text; color shifts to the accent, still no underline
- Focus-visible: standard focus ring, per the rest of the system
- Never bolded, never boxed, never a button

```css
.pexels-link { color: inherit; text-decoration: none; }
.pexels-link::after { content: " ↗"; opacity: 0; transition: opacity var(--dur-fast) var(--ease-out); }
.pexels-link:hover { color: var(--satsuma); }
.pexels-link:hover::after { opacity: 1; }
```

## Hard rules — never violate

- Never use Satsuma orange `#D4681E` as a dominant color. It is an accent.
- Never use plain white as the page background. The brand background is **Linen `#F2ECDD`** — warm and paper-like.
- Never use more than two type families (Crimson Pro + Plus Jakarta Sans).
- Never add drop shadows, gradients, or glassmorphism.
- Never write VC-pitch-deck copy. Plain language only.
- Never use emoji. Never use exclamation marks in display copy.
- Never recolor or distort the logo lockups.
