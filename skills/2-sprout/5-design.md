# Design

**Track:** 2 — Sprout the Idea  
**Track Phase:** 2 of 5  
**Overall Phase:** 5  
**Tool:** Claude Code VS Code extension (orchestration + DESIGN.md); Claude Code CLI (integrated terminal) for `/design` invocation  
**Input:** Signed-off MVP Spec from `2-sprout/4-spec.md`, concept screens from `1-plant/3-concept.md`  
**Output:** `/docs/brand.html` in repo, complete MVP screen designs as HTML, component inventory — the UX source of truth for `2-sprout/6-build.md`
**Version:** 1.3  
**Compatible with:** 4-spec v1.0+  

---

## Playbook Context

Read the **Principles** and **Stack** sections of `PLAYBOOK.md` before beginning this phase. This skill consumes the signed-off MVP Spec from `2-sprout/4-spec.md` and produces the UX artifacts consumed by `2-sprout/6-build.md`.

The principles most active in this phase:

- **UX is not a phase — it is a thread** — every story in the Spec has a corresponding design before implementation begins; this is where that principle becomes concrete
- **Specs are contracts** — the screen inventory from Phase 4 defines the scope of Phase 5; screens outside the inventory require a spec amendment before being designed
- **The AI-native advantage is real** — Claude Code + Claude Design compresses design work from weeks to hours; use the speed to iterate further, not to ship the first output

---

## Purpose

Translate the signed-off MVP Spec into complete, validated screen designs before implementation begins. Phase 5 produces two artifacts that Phase 6 depends on equally: the **screen designs** (what every screen looks like, as HTML) and **`/docs/brand.html`** (the design system Claude Code implements from). Neither is optional. A build that starts without both makes design decisions in code — the most expensive place to make them.

---

## Behavior

### 1. Orient to the MVP Spec and concept screens

Confirm you have reviewed:
- The signed-off MVP Spec from Phase 4 — particularly the OKR, screen inventory, and epic structure
- The concept screens from Phase 3 — these are the visual starting point for the design system

If no signed-off MVP Spec exists, do not proceed. Ask the founder to complete Phase 4 first.

Identify any visual patterns established in the Phase 3 concept screens that should carry forward: color direction, typographic tone, overall aesthetic. These inform the design system brief in Step 2 — they are not binding, but they are a head start.

### 2. Finalize DESIGN.md and establish the design system

The Phase 3 `DESIGN.md` is the starting point — not a blank slate. Phase 5 refines and extends it to cover the full MVP screen inventory.

**Step A — Logo creation (hard gate)**

Before updating `DESIGN.md`, the venture logo must exist. Generate the Logo Design Brief:

**Logo Design Brief**



Produce a Logo Design Brief from the venture context. This brief is for the founder to use when creating the logo manually — via a designer, a logo creation tool, or any other approach they choose. Logo creation is not automated; it is a deliberate human decision.

The brief should contain:

**Venture name and positioning**
[Name, what it does in one sentence, who it is for]

**Brand personality**
[5 adjectives that describe how the brand should feel]

**Mark direction**
[Wordmark only / Icon + wordmark / Icon only / Open to interpretation — with brief reasoning]

**Visual style**
[Geometric or organic, minimal or expressive, serious or playful, modern or classic — give direction, not a specification]

**What it should NOT look like**
[Category clichés to avoid, visual patterns common in this space that would make the mark feel generic]

**Reference marks**
[2–3 existing logos the venture should feel adjacent to in character — not to copy, to calibrate]

**Required deliverables**
SVG format, transparent background. Minimum: one dark version (`logo-dark.svg`) and one light version (`logo-light.svg`). Preferred: mark-only variants as well.

---

**⛔ Hard gate — Logo creation**

Do not proceed past this point until the founder confirms the logo is created and assets are committed to `/assets/` in the venture's repo.

Present this gate explicitly:

> The Logo Design Brief is ready. Before the design system can be established, the logo needs to be created and committed to `/assets/`. Please create the logo using your preferred tool or designer, commit the SVG assets, and confirm when ready to proceed.

Wait for explicit confirmation. Do not continue with placeholder assets.

---

**Step B — Update DESIGN.md with Phase 5 scope**

With logo assets confirmed, extend `DESIGN.md` to cover the full MVP screen inventory. Claude Code's role is to identify gaps between the Phase 3 design system and what the spec requires, then update `DESIGN.md` accordingly.

Prepare:

**Company name and blurb**
[Venture name] — [what it does, who it's for, in 2–3 sentences]

**Fonts, logos and assets**
- Logo assets: `/assets/logo-dark.svg`, `/assets/logo-light.svg` (and mark variants if available)
- Font preferences: [carry forward from Phase 3 concept brief, or note if Claude Design should choose]
- Any other brand assets committed to the repo

**Other notes**
Pull from the Thesis Document and Phase 3 concept screens:
- Target user and their context
- The visual tone and personality established in Phase 3 (or desired direction if Phase 3 was skipped)
- Reference products the design should feel adjacent to
- What the design should NOT look like
- Any specific color direction worth preserving from the Phase 3 concept

---

**Step C — Run Claude Design: Design System setup**

Hand the brief to Claude Design using its Design System setup workflow. Claude Design produces `/docs/brand.html` — a living design system document containing all tokens, component examples, and usage guidance.

Review the `/docs/brand.html` output:
- Does it reflect the brand personality from the brief?
- Are the color tokens, typography, and spacing consistent with the venture's intended feel?
- Does it cover the component types implied by the screen inventory?

Revise with Claude Design until the system is complete. Then commit `/docs/brand.html` to `/docs/brand.html` in the venture's repo. Commit logo and brand assets to `/docs/assets/`. This ensures all brand resources are accessible via GitHub Pages and relative paths in `/docs/brand.html` resolve correctly when served. This is the design source of truth — do not proceed to screen design until it is committed.

### 3. Design by epic

Design the MVP screens epic by epic. Complete all screens for one epic, get founder sign-off, then move to the next. Do not design all epics in one pass — this keeps review sessions manageable and catches misalignments before they compound.

**For each epic:**

*A — Screen designs*
Brief Claude Design on the epic's screens using the screen inventory as scope. For each screen:
- Name and purpose from the inventory
- The user story it serves
- The user journey narrative from Phase 4
- Reference to `/docs/brand.html` as the design system

Ask Claude Design to produce high-fidelity HTML screens. HTML output is the requirement — not wireframes, not static images. Claude Code implements from the HTML directly.

*B — Edge cases for primary flows*
For the primary flow in each epic, design three edge cases:

- **Empty state** — what the user sees before any content exists. Often the first thing a new user encounters; it should drive the next action, not look broken.
- **Error state** — what the user sees when the primary action fails (network error, AI timeout, validation failure). Should communicate what happened and what to do next.
- **Loading state** — for any operation that takes more than ~300ms, what the user sees while waiting.

Design edge cases only for the primary flow of each epic — not exhaustively for every possible failure.

*C — Dependency tracking*
After completing each epic's designs, note any visual patterns introduced that subsequent epics will reuse. Maintain a running **Pattern Register** — a simple named list with a reference to the screen where each pattern was first established. This prevents later epics from inadvertently reinventing or contradicting established patterns.

*D — Responsive notes*
For each epic, note how primary screens adapt across breakpoints. Capture meaningful layout transitions — not every breakpoint, just cases where mobile and desktop layouts differ significantly enough to affect the user journey. Note whether each screen is mobile-first or desktop-first.

*E — Founder sign-off per epic*
Present completed epic designs (screens + edge cases) to the founder. Walk through each screen against its acceptance criteria in the Spec. Ask:
- Does this match the intent of the story?
- Is the edge case handling appropriate?
- Is anything missing from the screen inventory for this epic?

Do not proceed to the next epic without explicit founder sign-off.

### 4. Produce the component inventory

After all epics are designed, compile the **component inventory** — the Phase 6 handoff manifest. This tells Claude Code exactly what to build.

| Component | Epic(s) | Description | States | Reusable |
|---|---|---|---|---|
| [Name] | [Epics] | [What it does] | [default, hover, loading, empty, error] | [Yes/No] |

The component inventory is a manifest, not a specification. The HTML screens are the specification. The inventory prevents components from being built twice or missed.

### 5. Gate: sign-off

Present the complete Phase 5 output to the founder:
- `/docs/brand.html` committed to `/docs/brand.html` ✓/✗
- All screens in the inventory designed ✓/✗
- Edge cases for primary flows ✓/✗
- Component inventory ✓/✗
- Pattern Register ✓/✗

Walk through the screen inventory as a checklist. Every item must be checked before proceeding.

> Are you satisfied that these designs accurately represent the MVP scoped in Phase 4 and are ready to hand to Phase 6 — Build?

On sign-off: note in the Spec Amendment Log that Phase 5 is complete.

> **Session management:** Before starting the next phase, follow the session rules in `venture.md` — `/compact` for phase transitions within a track, new session for track transitions.

---

## Guardrails

**Perspective:** Maintain the stance of a realistic, neutral third party. Designs that look polished but do not serve the OKR are not better designs — they are distractions. Evaluate each screen against what it needs to do, not only how it looks.

**Logo gate is hard.** Do not proceed past Step 2A without logo assets committed to the repo. Placeholder logos produce placeholder design systems.

**DESIGN.md before screens.** `DESIGN.md` must be committed and finalized before any epic screens are designed. Screens generated without a committed design system produce inconsistent output that Claude Code cannot implement reliably.

**HTML output, not static images.** Claude Design produces high-fidelity HTML. This is what Claude Code implements from. Static images are not sufficient for Phase 6.

**The screen inventory is the scope.** Do not design screens outside the inventory without a Phase 4 spec amendment.

**Sign-off per epic, not at the end.** Reviewing all screens at once produces worse feedback than reviewing one epic at a time. Epic-by-epic review catches misalignments at the lowest possible cost.

**Phase 5 produces designs, not implementation.** Claude Design HTML is a reference and specification for Claude Code — it is not deployed as production code.

**Do not proceed to Phase 6 without complete founder sign-off.**
