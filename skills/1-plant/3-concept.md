# Concept

**Track:** 1 — Plant the Seed
**Track Phase:** 3 of 3
**Overall Phase:** 3
**Tool:** Claude Code VS Code extension (orchestration, DesignSync, DESIGN.md derivation); claude.ai/design (design system generation, concept screens — founder-driven)
**Compatible with:** 2-thesis v1.0+
**Version:** 2.2
**Input:** `artifacts/1-2-thesis.md`, `artifacts/1-1-signal-brief.md`, studio design-system conventions from `../studio/design-system/`
**Output:** `artifacts/1-3-design-system-brief.md`, `artifacts/1-3-concept-brief.md`, `DESIGN.md` (repo root), `artifacts/1-3-gate-brief.md`, synced Claude Design projects

---

## Playbook Context

Read the **Principles**, **Design Tooling**, and **Track 1** sections of `PLAYBOOK.md` before beginning.

Principles most active in this phase:

- **AI leads, humans govern** — Claude Code orchestrates the workflow and derives machine-readable artifacts. Claude Design generates the visual design system and concept screens. The founder reviews and approves at each HITL checkpoint.
- **UX is not a phase — it is a thread** — Phase 3 establishes the visual and tonal foundation that all subsequent phases build from.
- **Kill early, kill cleanly** — the gate at the end of this phase is the Track 1 terminal gate. Run `retro.md` Mode C (adversarial review) before confirming a commit decision.

**Phase 3 tool model:**
Claude Code orchestrates the workflow — it reads artifacts, generates briefs, manages DesignSync, derives DESIGN.md, and produces the gate brief. Claude Design (at claude.ai/design) does the design work — it generates the visual design system, brand.html, and concept screens. These are separate tools with a DesignSync bridge. Claude Code does not generate brand.html or concept screens directly.

**File hierarchy:** `artifacts/` are source of truth. `context/` files are background color — prior art that informs but does not replace the phase work. Rich context is a head start, not a conclusion.

---

## Purpose

Translate the validated thesis into a visual design system and concept screens. Produce the gate brief the founder uses to make the commit-or-kill decision. Establish the design system foundation that Phases 5 and 6 extend and implement.

---

## Behavior

### 1. Check for existing artifacts

Before doing anything else, check:

- `artifacts/1-3-design-system-brief-WIP.md` — work in progress; ask whether to resume
- `artifacts/1-3-design-system-brief.md` — brief complete; ask whether to regenerate
- `artifacts/1-3-gate-brief.md` — phase complete; confirm with founder before proceeding

If none exist, proceed to Step 2.

---

### 2. Orient to Signal Brief and Thesis

Read:
- `artifacts/1-1-signal-brief.md` — problem, user, key assumption
- `artifacts/1-2-thesis.md` — competitive landscape, gap, what we believe, top risks, Notes for Phase 3

Extract from the Thesis:
- The venture's emotional register — what it should feel like to use this product
- The primary user and their context
- Any visual or tonal carry-forward notes from "Notes for Phase 3"
- The competitive context — what visual patterns the venture should distinguish itself from

---

### 3. Generate the Design System Brief

Write to `artifacts/1-3-design-system-brief-WIP.md` as each section completes — append incrementally. After each write, reference the file path rather than restating content.

The Design System Brief is the creative brief Claude Design uses to generate the venture's visual identity. It must contain enough creative direction for Claude Design to make good decisions without being prescriptive about specific values (those are Claude Design's decisions).

**Template:**

```markdown
# Design System Brief: [Venture Name]
*Date · Skill: 3-concept v2.0*

## Venture context
[2–3 sentences: what the product does, who it's for, what it needs to feel like to use]

## Emotional register
[How should this product feel? 5–7 adjectives. Not generic ("clean", "modern") — specific to this venture's position and user.]

## What it should NOT feel like
[Category clichés and visual patterns common in this space that this venture must distinguish itself from. Be specific.]

## Reference points
[2–3 products or brands whose aesthetic this venture should feel adjacent to — not identical to, but in the same emotional territory. Explain why each is a useful reference.]

## User context
[Where and how will users encounter this product? Desktop-first or mobile-first? High-focus environment or ambient? This informs spacing, density, and typographic hierarchy.]

## Output expectations
Produce a complete design system following the file conventions below. The design system will be used by Claude Code in Phase 6 to implement the product UI — every token and component definition you produce will be directly consumed by the implementation.

### Required files and conventions

**`SKILL.md`** — design system descriptor:
```yaml
---
name: [venture-name]-design
description: [One sentence describing the venture and what this skill is for]
user-invocable: true
---
```
Followed by: brand personality summary, hard rules (never-violate constraints), and file inventory.

**`brand.html`** — human-readable rendering of the full design system. Should include: color palette with hex values and semantic roles, typography specimens (display, heading, body, caption, label, mono), spacing scale, component gallery (button states, card, input, link, badge at minimum).

**`colors_and_type.css`** — drop-in CSS variables for all tokens. Import this first in any artifact built from this system.

**`preview/_base.css`** — shared base CSS imported by all preview cards:
```css
/* Standard structure */
@import url('[Google Fonts URL for this venture's chosen fonts]');
:root { /* all token variables */ }
*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
html, body { background: var(--bg); color: var(--text); font-family: var(--font-body); }
.card { width: 700px; padding: 28px 32px; background: var(--bg); }
.card-label { /* standard label style */ }
```

**`preview/[component-name].html`** — one file per component, following `@dsCard` convention:
```html
<!-- @dsCard group="[Group]" name="[Component name]" subtitle="[States shown]" viewport="700x[height]" -->
```
Required preview cards: colors-brand, type-scale, type-display, type-body, components-button-primary, components-button-secondary, components-card, components-input, spacing-scale.

**`assets/`** — venture logo SVGs (if available). Placeholder structure if not yet designed.

**`_ds_manifest.json`** — Design System pane manifest (generated automatically by Claude Design).

### Output conventions for docs/ deployment

All files generated in this project will be synced to the venture repo and served via GitHub Pages from the `docs/` folder. Follow these conventions so files work correctly when served from that path:

- **Self-contained HTML files.** Every `.html` file must work standalone — no dependencies on files outside the project that won't be present in `docs/`. No local asset paths that don't resolve from `docs/`.
- **CDN fonts only.** Use Google Fonts CDN `@import` in `<style>` or `<link>` tags. No local font files.
- **Relative paths within the project.** References between files (e.g. `_base.css` from a preview card) use relative paths that will resolve correctly when synced to `docs/` and `design-system/` in the repo.
- **brand.html** will be placed at `docs/brand.html` — write it as a standalone document that works at that path.
- **Concept screens** will be placed at `docs/concepts/[name].html` — write each as a fully self-contained file with no external dependencies beyond CDN fonts.
```

When the brief is complete, rename `artifacts/1-3-design-system-brief-WIP.md` to `artifacts/1-3-design-system-brief.md` and commit.

---

### 4. Generate the Concept Brief

Write to `artifacts/1-3-concept-brief-WIP.md` incrementally.

The Concept Brief defines the screens Claude Design generates after the design system is complete. Screen selection should demonstrate the core value proposition — not a full product, but enough to evaluate whether the concept is compelling.

**Template:**

```markdown
# Concept Brief: [Venture Name]
*Date · Skill: 3-concept v2.0*

## What these screens need to demonstrate
[The core user action or value moment this concept should make visible. What should someone be able to immediately understand from seeing these screens?]

## Screen inventory (3–5 screens)

### Screen 1 — [Name]
**What it shows:** [Specific content/state]
**Why this screen:** [What it demonstrates about the value proposition]
**Key elements:** [Primary components that must appear]

### Screen 2 — [Name]
[Same structure]

[Continue for each screen]

## Design anchors
- Design system: [Venture Name] Design System (Claude Design Project 1)
- Primary user context: [From signal brief]
- Viewport: [Desktop / Mobile / Both]
- Fidelity target: High enough to evaluate the concept — not a polished finished UI, but not a wireframe

## What these screens are NOT
These are concept screens for a commit-or-kill gate decision, not production designs. They do not need to represent a complete product.
```

When complete, rename to `artifacts/1-3-concept-brief.md` and commit.

---

### 5. HITL — Review briefs before Claude Design

Present both briefs to the founder. Ask:
- Does the Design System Brief capture the right emotional register?
- Are the reference points accurate and useful?
- Is the screen inventory the right set for the gate decision?

Do not proceed to DesignSync until the founder approves both briefs.

---

### 6. Create the venture Claude Design project

Using DesignSync, create a single Design System project for the venture. This project holds both the design system and the concept screens, organized by subfolder. DesignSync only supports Design System projects — this is the confirmed project type for all Claude Design work.

```
DesignSync: create_project
  name: "[Venture Name] Design System"
  type: design_system
```

Push the Design System Brief and a reference to the studio conventions:
```
DesignSync: push_file
  projectId: [project ID]
  path: "BRIEF.md"
  content: [contents of artifacts/1-3-design-system-brief.md]
```

Record the project ID in `STATUS.md`. This single project is reused across phases — Phase 5 extends it, Phase 6 anchors to it.

---

### 7. ⏸ Waiting — Design system generation in claude.ai/design

```
## ⏸ Waiting — action required in claude.ai/design

**What to do:**
1. Open claude.ai/design
2. Open the "[Venture Name] Design System" project
3. Review BRIEF.md — the creative brief is in there
4. Generate the design system: colors, type, spacing, components, brand.html
5. Follow the file conventions in the brief exactly (preview cards, @dsCard markers, _base.css)
6. When complete, return here and confirm

**What to bring back:**
- Confirmation the design system is generated
- Any questions or decisions that came up during generation

**What happens next:**
Claude Code will sync the output, derive DESIGN.md, push it back, then set up the concept screens project.
```

**Do not proceed past this step until the founder confirms.**

---

### 8. Sync Project 1 output

Using DesignSync, sync all files from Claude Design Project 1 back to the venture repo:

```
DesignSync: list_files / get_file for each file in Project 1
```

Write to these locations:

| Claude Design location | Repo location |
|---|---|
| `preview/`, `SKILL.md`, `colors_and_type.css`, `assets/` | `design-system/` |
| `brand.html` | `docs/brand.html` |

Commit. `docs/brand.html` is immediately viewable via GitHub Pages.

---

### 9. Derive DESIGN.md from Project 1 output

Read the synced Claude Design output (particularly `colors_and_type.css`, `brand.html`, and `SKILL.md`) and derive `DESIGN.md` — the machine-readable translation for Phase 6 implementation.

**DESIGN.md schema:**

```markdown
# [Venture Name] — Design System
*Derived from Claude Design on [date] · Phase 3 · Skill: 3-concept v2.0*

## Color tokens
```css
:root {
  /* Semantic roles */
  --color-primary:    [hex];   /* [usage rule] */
  --color-accent:     [hex];   /* [usage rule — sparingly?] */
  --color-bg:         [hex];   /* Page background */
  --color-surface:    [hex];   /* Card/panel background */
  --color-text:       [hex];   /* Primary text */
  --color-text-muted: [hex];   /* Secondary text */
  --color-rule:       [hex];   /* Borders and dividers */
  /* State colors */
  --color-success:    [hex];
  --color-warning:    [hex];
  --color-error:      [hex];
}
```

## Typography
**Display font:** [Family name] — [Google Fonts URL]
**Body font:** [Family name] — [Google Fonts URL]
**Mono font:** [Family name or none]

### Type scale
| Role     | Size  | Weight | Line height | Usage |
|----------|-------|--------|-------------|-------|
| display  | [px]  | [wt]   | [lh]        | [when to use] |
| h1       | [px]  | [wt]   | [lh]        | |
| h2       | [px]  | [wt]   | [lh]        | |
| body     | [px]  | [wt]   | [lh]        | |
| caption  | [px]  | [wt]   | [lh]        | |
| label    | [px]  | [wt]   | [lh]        | |
| mono     | [px]  | [wt]   | [lh]        | |

## Spacing scale
Base unit: [value]px
Scale: 4 · 8 · 12 · 16 · 24 · 32 · 48 · 64 · 96

## Border radius
[sm / md / lg / full values]

## Component definitions

### Button — primary
- Background: `var(--color-primary)`
- Text: [token]
- Padding: [values]
- Radius: [token]
- Hover: [token]
- Press: [token]
- Disabled: [token]

### Button — secondary
[Same structure]

### Card
[Background, border, radius, padding, shadow if any]

### Input
[Background, border, focus ring, placeholder, error state]

### [Additional components from design system]

## Hard rules
[Derived from SKILL.md — the inviolable constraints. Copy exactly from Claude Design's output.]
- [Rule 1]
- [Rule 2]
- [etc.]

## Phase 6 implementation notes
- Always use CSS custom properties — never hardcode hex values
- Import `design-system/colors_and_type.css` as the token source
- Reference `design-system/preview/` cards for component implementation targets
```

Commit `DESIGN.md` to the venture repo root.

---

### 10. Push DESIGN.md back to Project 1

```
DesignSync: push_file
  projectId: [Project 1 ID]
  path: "DESIGN.md"
  content: [DESIGN.md contents]
```

This anchors concept screen generation to the derived token system.

---

### 11. Push concept brief to the venture project

Push the concept brief into the same project, in a `concepts/` subfolder. The design system tokens and components are already in this project — screens generated here have direct access to them.

```
DesignSync: push_file
  projectId: [project ID from Step 6]
  path: "concepts/CONCEPT_BRIEF.md"
  content: [contents of artifacts/1-3-concept-brief.md]
```

---

### 12. ⏸ Waiting — Concept screen generation in claude.ai/design

```
## ⏸ Waiting — action required in claude.ai/design

**What to do:**
1. Open claude.ai/design
2. Open the "[Venture Name] Design System" project (same project as Step 7)
3. Review `concepts/CONCEPT_BRIEF.md` — the screen inventory is defined there
4. Generate 3–5 concept screens in the `concepts/` subfolder — the design system tokens and components are already available in this project
5. Name screens clearly: `concepts/screen-[n]-[name].html`
6. When complete, return here and confirm

**What to bring back:**
- Confirmation screens are generated
- Any screens you want to discuss or revise before the gate
- Any design decisions that surfaced during generation worth capturing

**What happens next:**
Claude Code will sync the concept screens and produce the gate brief.
```

**Do not proceed past this step until the founder confirms.**

---

### 13. Sync concept screens and commit

Sync the concept screen files from the `concepts/` subfolder of the venture project back to the repo:

```
DesignSync: list_files  →  filter for paths starting with "concepts/"
DesignSync: get_file    →  for each concept screen file
```

Write to `concepts/` folder in the venture repo. Commit alongside `DESIGN.md` and `design-system/`.

---

### 14. Produce the gate brief

Write `artifacts/1-3-gate-brief-WIP.md` incrementally, then rename to `artifacts/1-3-gate-brief.md` at completion.

```markdown
# Gate Brief — Track 1 / Phase 3
*Date · Venture: [Name] · Skill: 3-concept v2.0*

## What we found
[2–3 sentences: what the design system and concept screens produced, what surprised you, what held up from the thesis]

## Three strongest signals
1. [Signal — something the concept revealed that strengthens the case for committing]
2. [Signal]
3. [Signal]

## Three highest risks
1. [Risk — something the concept revealed or confirmed as a real threat]
2. [Risk]
3. [Risk]

## Design system notes for Phase 5
[Anything the Phase 3 design process revealed that Phase 5 should be aware of — design directions that were explored and rejected, constraints discovered, components that will need extension for the full MVP]

## Recommendation
[Go / No-go — one sentence of honest reasoning]
```

---

### 15. Gate: Commit, Kill, or Defer

This is a 1-way-door decision — committing to Track 2 is a significant investment of time and focus. Before presenting the gate question, run `retro.md` **Mode C (adversarial review)**:

- State the case for committing: what the Signal Brief, Thesis Document, design system, and concept screens together support
- Argue the strongest case against committing: what would have to be wrong for this to be a mistake
- Give the founder the opportunity to engage with the adversarial argument before confirming

**Track 1 terminal gate — higher bar:** This gate commits the venture to Track 2. Run `retro.md` Mode C before confirming. Track 2 requires meaningful investment of time across six phases; committing to it lightly is the most common source of wasted studio capacity.

Once the adversarial review is complete, present the gate:

> Based on this concept, are you ready to commit to Track 2 — or would you kill or defer this idea?

**To commit:** Signal Brief holds up · Thesis is believable · Design system and concept are compelling · Willing to invest Track 2 time
**To kill:** Document why. Institutional memory.
**To defer:** Park with all artifacts intact. Note the specific condition that would trigger revisiting.

> **Session management:** Before starting Track 2, start a new session. Track transitions always warrant a fresh context. CLAUDE.md will re-orient Claude Code to the current state automatically.

---

## Guardrails

**Claude Code does not generate brand.html or concept screens.** These are Claude Design's outputs. Claude Code's role is orchestration, DesignSync operations, DESIGN.md derivation, and gate brief production.

**Wait at handoff steps.** Steps 7 and 12 are explicit waiting states. Do not proceed past them until the founder confirms. Surface the waiting block clearly and stop.

**DESIGN.md is derived, not speculated.** Generate DESIGN.md from Claude Design's actual output — read `colors_and_type.css` and `brand.html` for token values, read `SKILL.md` for hard rules. Do not invent token values.

**Phase boundary discipline.** Phase 3 produces a design system, concept screens, and a gate decision. It does not produce a product spec, user stories, or implementation code. If strong product ideas surface during design work, log them in the gate brief's "Design system notes for Phase 5" section and stay at the concept level.

**DesignSync only supports Design System projects.** This is confirmed — there is no Prototype, Wireframe, or other project type available via DesignSync. All Claude Design work for a venture lives in a single Design System project, organized by subfolder.

**Context files are inputs, not conclusions.** Rich prior art in `context/` informs the brief but does not replace the design work.

---

## Changelog

**v2.2** — docs/ output conventions baked into Design System Brief template: self-contained HTML, CDN fonts, relative paths, brand.html → docs/brand.html, concept screens → docs/concepts/.
**v2.1** — Consolidated to single Claude Design project per venture (DesignSync confirmed to support Design System projects only). Concept screens live in `concepts/` subfolder of the same project. Removed two-project structure and project type validation note.
**v2.2** — docs/ output conventions baked into Design System Brief template: self-contained HTML, CDN fonts, relative paths, brand.html → docs/brand.html, concept screens → docs/concepts/.
**v2.1** — Single persistent Claude Design project per venture (DesignSync confirmed Design System only); concept screens in concepts/ subfolder of Project 1; sync targets updated: design system → design-system/, brand.html and concepts → docs/ for GitHub Pages serving.
**v2.0** — Full structural rewrite. New workflow: Claude Design generates the visual system and concept screens; Claude Code orchestrates via DesignSync and derives DESIGN.md from Claude Design's output. Two new artifacts: `1-3-design-system-brief.md` and `1-3-concept-brief.md`. DESIGN.md schema defined. Studio design-system file conventions baked in for brief generation. Explicit waiting states at Claude Design handoff steps. Two Claude Design projects: Project 1 (Design System, persistent across phases), Project 2 (Concept Screens, phase-specific). DESIGN.md pushed back to Project 1 after derivation.
**v1.6** — Session management pointer at gate step.
**v1.5** — WIP file pattern for gate brief; brand.html noted as validation artifact.
**v1.4** — Artifact paths → `artifacts/1-3-gate-brief.md`; check-before-rebuild added.
**v1.3** — Tool updated to Claude Code VS Code extension.
**v1.2** — Stitch removed; Claude Design via `/design` as sole path; brand.html in Phase 3; HITL checkpoint.
**v1.1** — Two-path model; DESIGN.md as explicit output; gate brief template; adversarial review at commit gate.
**v1.0** — Initial skill.
