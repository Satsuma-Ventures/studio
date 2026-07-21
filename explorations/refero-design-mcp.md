# Exploration Brief — Refero (design-reference tooling + MCP)

*Prepared for: Studio lead · Surfaced from: Meritous (Meritous) Phase 3 · Date: 2026-07-16*

## TL;DR
**Refero** (refero.design) turns any real website into a precise, implementation-ready design-system spec — exact color tokens, per-font type scales (size / line-height / tracking), spacing, radii, elevation, component recipes, do's/don'ts, "similar brands," and copy-paste CSS custom properties + Tailwind theme. It exposes an **MCP server**, so our design agents (Claude Design / Claude Code) could pull these reference specs directly. **Recommend trialing it as a standard input to Phase 3 (Concept)** — it directly attacks the "feels AI-generated / generic" failure mode in AI design generation.

## The problem it solves (observed, not hypothetical)
In Meritous's Phase 3, Claude Design output kept landing in a generic, "AI-generated" register no matter how carefully we described the target aesthetic in prose. Rounds of copy and layout fixes didn't move it. The unlock was feeding it **Refero style references** for three sites we liked (OpenWeb, Aboard, Paragraph): precise, tokenized specs — warm-paper canvas, one reserved saturated accent, exact serif tracking values (−0.03 to −0.09em on display), hex, radii. That instantly recalibrated the direction from vague to specific and pulled the work out of the generic zone.

**The lesson: prose can't carry a design register; tokenized references can.** This is a recurring, every-venture problem, and Refero is aimed squarely at it.

## What it is
- A catalog of real sites, each reverse-engineered into a structured **style reference**: color tokens + roles, type scales, spacing, radii, elevation, component specs, do/don't lists, an "agent prompt guide," similar-brand list, and ready-to-use CSS `:root` + Tailwind `@theme` blocks.
- Exportable as a `design.md` per style (what we used manually this round).
- **Has an MCP server** — an agent can query it programmatically instead of a human exporting files by hand.

## Why it matters for the studio
- **Design fidelity, repeatably.** Every venture hits Phase 3's "make it not feel generic" wall. Refero gives Claude Design a precise, real-world target instead of adjectives.
- **Faster calibration.** Point at 2–3 reference sites → get tokenized specs → hand to Claude Design. Minutes instead of iteration cycles (this round it would have saved several regen loops).
- **Agent-native.** Wire the MCP into the DesignSync / Phase-3 flow so Claude Code/Design pull references directly — no manual export step.

## Where it fits the playbook
Add a lightweight step to **Phase 3 (Concept), before design-system generation**:
> "Gather 2–3 reference sites (via Refero) that match the target register; pull their tokenized style specs as input to the Design System Brief."

Optionally a second pass before concept-screen generation.

## Considerations / risks
- **Cost:** subscription — confirm pricing/seats and whether MCP access is gated to a tier.
- **Derivative-design / IP + homogenization:** references are for *calibration*, not cloning. Guardrail — use them to set *register* (warmth, restraint, accent discipline, type tracking), never to copy a competitor's identity. Brand distinctiveness still comes from our own tokens.
- **Over-reliance:** taste still required to pick the *right* references and to diverge deliberately; the tool sharpens execution, it doesn't decide direction.

## Recommendation / next steps
1. **Trial the Refero MCP** on the next venture entering Phase 3.
2. If it holds up, add the "reference-gathering via Refero" step to the Phase 3 skill and wire the MCP alongside DesignSync.
3. Weigh subscription cost against design-iteration time saved (materially positive on this venture).
