---
name: satsuma-design
description: Use this skill to generate well-branded interfaces and assets for Satsuma Ventures, a private family venture studio based in Seattle — for production work or throwaway prototypes, mocks, slides, and landing pages. Contains essential design guidelines, colors, type tokens, fonts, logo assets, and component patterns.
user-invocable: true
---

# Satsuma Ventures — Design Skill

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

## Hard rules — never violate

- Never use Satsuma orange `#D4681E` as a dominant color. It is an accent.
- Never use plain white as the page background. The brand background is **Linen `#F2ECDD`** — warm and paper-like.
- Never use more than two type families (Libre Baskerville + Plus Jakarta Sans).
- Never add drop shadows, gradients, or glassmorphism.
- Never write VC-pitch-deck copy. Plain language only.
- Never use emoji. Never use exclamation marks in display copy.
- Never recolor or distort the logo lockups.
