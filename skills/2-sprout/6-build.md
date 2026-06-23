# Build

**Track:** 2 — Sprout the Idea  
**Track Phase:** 3 of 5  
**Overall Phase:** 6  
**Tool:** Claude Code VS Code extension (primary) + Amplitude MCP (Step 5)  
**Input:** Signed-off MVP Spec (`2-sprout/4-spec.md`), signed-off designs from `2-sprout/5-design.md` (`DESIGN.md` + HTML screens), Concept Summary from `1-plant/3-concept.md`  
**Output:** Functional MVP on the Satsuma default stack, deployed to Vercel, ready for Phase 7
**Version:** 1.1  
**Compatible with:** 4-spec v1.0+, 5-design v1.0+  

---

## Playbook Context

Read the **Principles**, **Stack**, and **Mobile Strategy** sections of `PLAYBOOK.md` before beginning this phase. This skill consumes all prior signed-off artifacts and produces the working MVP consumed by `2-sprout/7-ship.md`.

The principles most active in this phase:

- **Specs are contracts** — the signed-off MVP Spec is the functional source of truth; the signed-off designs are the UX source of truth. Claude Code implements from both. Deviations require a formal amendment, not an in-build decision.
- **The AI-native advantage is real** — agentic development compresses implementation time significantly. Use that speed to implement cleanly and thoroughly, not to skip verification steps.
- **Kill early, kill cleanly** — if implementation reveals a fundamental flaw in the spec or a story that cannot be built as written, surface it immediately rather than working around it.

---

## Purpose

Build the signed-off MVP. Claude Code implements from the Spec and designs — it does not interpret, expand, or redesign. Every ambiguity is surfaced before implementation, not resolved mid-build. Every epic is reviewed as working software before the next one begins.

---

## Behavior

### 1. Orient to all artifacts

Before writing any code, confirm the following are available and signed off:

- MVP Spec (`spec-v[n].md`) — including OKR, epics, stories, acceptance criteria, screen inventory, out-of-scope list, and technical design (if one was produced in Phase 4)
- `DESIGN.md` — committed to the venture's repo
- HTML screen designs — one file per screen or a linked multi-screen flow, committed to the venture's repo
- Component inventory from Phase 5

If any of these are missing or unsigned, do not begin implementation. Identify what is missing and ask the founder to resolve it.

### 2. Plan the build

Before scaffolding or writing code, produce a **Build Plan** — a brief document that makes sequencing and approach decisions explicit before any implementation begins.

The Build Plan covers:

**Task decomposition**
Decompose `spec.md` into a numbered task list. Surface the full list for human review and approval before any implementation begins. The task list is the implementation contract — changes require a new gate, not a mid-build conversation.

**Epic implementation order**
Analyze technical dependencies across epics. Some epics must land before others can start:
- Auth and user model before any personalized or user-specific features
- Core data model before any CRUD operations or AI-augmented features
- Shared components (navigation, layout shell) before screen-level epics that depend on them

Propose an implementation order. Flag any ordering constraints that were noted in the Spec and confirm they are respected.

**Supabase schema plan**
From the Spec's data model and stories, define:
- Tables and their columns
- Relationships and foreign keys
- Row-level security (RLS) policy approach per table
- Auth configuration (Google OAuth + email/password per playbook default)
- Edge functions needed (AI calls, complex operations that must be server-side)

Write these as SQL migration files (`supabase/migrations/[timestamp]_[description].sql`) for founder review before any Supabase resources are created. Do not apply migrations directly — the founder reviews and applies them via the Supabase CLI or dashboard.

**On the Supabase MCP**
Enable the Supabase MCP for read operations during build. It is useful for checking table structure, querying data, verifying RLS behavior, and inspecting edge function logs. Do not use it for schema writes or RLS policy changes — those go through migration files reviewed by the founder. Configure the MCP with read-only credentials where possible.

**Environment variables**
List every environment variable the project will need:
- `VITE_SUPABASE_URL`
- `VITE_SUPABASE_ANON_KEY`
- `ANTHROPIC_API_KEY` (server-side only — Edge Functions)
- `GEMINI_API_KEY` (server-side only — Edge Functions, if search grounding is required)
- Any venture-specific variables

**Flag ambiguities before building**
Review every story's acceptance criteria against the design screens. If any criteria are ambiguous, contradictory, or not covered by a design, surface them now:

> Story [X] has acceptance criterion [Y] but the design for screen [Z] does not show how [Y] is handled. Please clarify before I implement this story.

Do not resolve ambiguities independently. Wait for founder direction.

Present the Build Plan to the founder and confirm before proceeding.

### 3. Project scaffold

Set up the project following the Satsuma default stack. For an existing repo (brownfield), skip steps that are already in place and note what was found.

**Standard scaffold:**
- React + Vite project structure
- Tailwind CSS configured with tokens from `DESIGN.md` imported as CSS custom properties — never hardcode design values; always reference tokens
- Supabase client configured with environment variables
- `venture repo assets directory` contains logo SVGs and brand assets from Phase 5; configure Vite `resolve.alias` or `publicDir` to reference `venture repo assets directory` so the React app can import brand assets without duplicating files
- Vercel project connected to the GitHub repo, auto-deploy from `main` configured
- PWA manifest (per playbook Mobile Strategy — Stage 1 default)
- `/docs/` directory retained from Phase 3 (do not remove — it is the GitHub Pages proof-of-concept served via the registered domain; DNS switches to Vercel at Phase 7)
For mobile: if Capacitor was flagged as required in the Phase 4 Spec, configure it now before implementation begins. Do not add it mid-build.

Commit the scaffold with a clear initial commit message before proceeding to epic implementation.

### 4. Implement by epic

Work through epics in the order defined in the Build Plan. Complete one epic fully before beginning the next.

**For each epic:**

*A — Review before building*
Before writing any code for the epic:
- Re-read the epic's stories and acceptance criteria
- Review the design screens for this epic's screens
- Review the component inventory entries for this epic's components
- Confirm any dependencies from prior epics are in place

*B — Implement stories in logical order*
Within an epic, implement stories in dependency order — foundation before features, data layer before UI. For each story:
- Implement to the acceptance criteria in the Spec
- Match the design screens precisely — if the design shows a specific layout, color, or interaction, implement it as shown
- Use `DESIGN.md` tokens for all design values — colors, typography, spacing
- Implement the edge cases designed in Phase 5 (empty states, error states, loading states)

*C — Flag, don't guess*
If any of the following occur during implementation, stop and surface the issue:
- A story's acceptance criteria cannot be met as written
- The design and the spec contradict each other for a specific screen
- An implementation decision would require choosing between two valid interpretations of the spec
- A technical constraint makes a story significantly harder than anticipated

Do not resolve these independently. Bring them to the founder with a clear description of the issue and the options available.

*D — New or missing components*
If implementation requires a component not in the Phase 5 component inventory or `DESIGN.md`:

- **Minor variant of an existing component** (new button size, card variant, etc.): implement using `DESIGN.md` tokens, then update `DESIGN.md` to document the variant. No approval needed — log the addition in the build commit message.
- **Genuinely new component** not in the inventory: stop. Surface it to the founder as a Phase 5 minor amendment before implementing. Do not invent new components without sign-off — new components affect the design system and may require design work.

*E — Backlog items*
If implementation surfaces ideas, improvements, or edge cases that are clearly out of scope for the current spec, log them to `BACKLOG.md` in the venture's repo. Format each item as:

```
## [Short title]
**Source:** Phase 6 implementation — [story/epic reference]
**Description:** [What was observed and why it might be worth pursuing]
**Category:** Deferred to v2 / Enhancement / Bug prevention
```

Do not implement backlog items. Log and continue.

*F — Milestone demo*
At epic completion, demo the working software to the founder. This is a working software review, not a code review. The founder evaluates:
- Does the epic behave as the stories describe?
- Do the screens match the signed-off designs?
- Are edge cases handled appropriately?

If issues are found: fix them before moving to the next epic. Log any out-of-scope findings to `BACKLOG.md`.

If the epic passes: explicitly confirm with the founder before beginning the next epic.

### 5. Amplitude instrumentation

With the core epics implemented, run the Amplitude wizard. The wizard reads your codebase to propose events — it works best when meaningful app code exists to analyse.

Run from the project directory (or from within Claude Code's terminal):

```bash
npx @amplitude/wizard
```

The wizard walks through four steps:
1. **Authenticate** — sign in to the Amplitude account (or create one if needed)
2. **Detect framework** — auto-detects React and selects the appropriate SDK
3. **Propose and instrument events** — reads the codebase, proposes tracking events based on actual routes, pages, and flows; waits for approval before writing any code
4. **Verify data flow** — confirms events are reaching the Amplitude project before exiting

**Review proposals against the Phase 4 measurement plan**
The wizard proposes events based on what it finds in the codebase. Before approving, verify each proposed event against the measurement plan in the spec — every KR should have at least one corresponding event. Add any events the wizard missed. Remove or rename any that don't match the measurement plan's naming conventions.

**Amplitude MCP**
When the wizard offers to install the Amplitude MCP server, accept it. This enables plain-English queries against analytics data in Phase 7 and Phase 8 synthesis work.

**Autocapture**
Accept Autocapture configuration — it instruments sessions, clicks, page views, and form interactions automatically. These provide useful baseline data without additional event definitions.

After the wizard completes, trigger each KR-mapped event manually in the local or staging environment and confirm it appears in the Amplitude Debugger before proceeding.

### 6. Integration verification

After all epics are implemented, verify the full MVP end-to-end:

- Walk through every primary user flow from entry to completion
- Verify auth flows (sign up, sign in, sign out, protected routes)
- Verify RLS — confirm that users can only access their own data
- Verify all AI integrations (Supabase Edge Functions calling Anthropic/Gemini) work under realistic conditions
- Verify error states render correctly when services fail
- Verify the app works on mobile (PWA, primary target device types)

Log any integration failures to `BACKLOG.md` if they are out of scope, or fix them if they are acceptance criteria failures.

### 7. Performance baseline

Run Lighthouse on the primary screens and record the scores. These are the baseline for the product — not a gate, but a reference point for future iterations.

Target minimums for MVP:
- Performance: 80+
- Accessibility: 90+
- Best practices: 90+
- SEO: 80+ (if public-facing screens exist)

If any score is significantly below target, surface it to the founder as a finding. Do not delay Phase 7 for performance optimization unless a score is critically low — log it to `BACKLOG.md` and continue.

### 8. Final review gate

Present the completed MVP to the founder for final review before Phase 7:

- All epics implemented and milestone-reviewed ✓/✗
- Integration verification complete ✓/✗
- Lighthouse baseline recorded ✓/✗
- `BACKLOG.md` populated with any out-of-scope findings ✓/✗
- Deployed to Vercel and accessible at the registered domain ✓/✗

> The MVP is implemented. Before moving to Phase 7 — Ship, please confirm you are satisfied that the build meets the signed-off spec and designs.

On sign-off: note in the Spec Amendment Log that Phase 6 is complete.

---

## Scope control

The three-tier amendment process from Phase 4 applies throughout Phase 6:

**Clarification** — an acceptance criterion needs interpretation, wording is ambiguous. No scope impact. Resolve with founder, log the resolution, continue.

**Minor amendment** — a story changes in nature but does not affect the OKR, other epics, or the screen inventory. Founder acknowledges explicitly. Log in the Spec Amendment Log with version bump.

**Scope change** — adding or removing a story, changing the OKR, adding screens, or a change that touches multiple epics. Implementation pauses. Return to Phase 4 gate. Produce a new Spec version. Resume only after the new version is signed off.

When in doubt about which tier a change falls into, treat it as the more significant tier.

---

## Guardrails

**Perspective:** Maintain the stance of a realistic, neutral implementer. The Spec and designs are the authority — not Claude Code's judgment about what would be better, easier, or more elegant. Surface disagreements explicitly rather than resolving them silently.

**Spec and designs are the source of truth.** The signed-off Spec is the functional source of truth. The signed-off designs are the UX source of truth. Both must be satisfied. When they conflict, surface the conflict rather than choosing one.

**Flag before building, not after.** Ambiguities resolved mid-build are scope changes in disguise. Every ambiguity identified before implementation is cheaper to resolve than one discovered after.

**Never hardcode design values.** Every color, font, spacing value must come from `DESIGN.md` tokens. Hardcoded values create maintenance debt and break design system coherence.

**Read `CLAUDE.md` at session start.** Every Claude Code session in a venture repo must start by reading `CLAUDE.md`. It references `DESIGN.md`, `spec.md`, and the current skill. If `CLAUDE.md` is incomplete, update it before proceeding.

**Supabase schema changes go through migration files.** Do not modify the database schema directly. Generate SQL migrations, founder reviews, founder applies.

**The Supabase MCP is read-only in practice.** Use it to inspect and query. Do not use it to write schema or modify RLS policies.

**Backlog, don't implement.** Out-of-scope ideas discovered during build go to `BACKLOG.md`. They do not get built.

**Epic by epic, gate by gate.** Do not begin a new epic until the founder has reviewed and approved the previous one as working software.

**Do not proceed to Phase 7 without explicit founder sign-off.**
