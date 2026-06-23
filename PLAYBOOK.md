# Satsuma Ventures — Operating Playbook

> A family venture studio cultivating ideas worth growing.

This document is the operating model for Satsuma Ventures. It defines how we move from an idea to a validated concept to a shipped product. It serves two purposes simultaneously: a founder's reference for how we work, and a context document for the AI agents (Claude Chat, Claude Design, Claude Code) that power our workflow.

**When working in any Satsuma project, AI agents should treat this document as the source of truth for process, stack, and decision-making principles. Design system guidance for AI agents lives in `DESIGN.md` in each venture's repo. `brand.html` is the human-readable visual rendering of that system, published on the venture's website.**

---

## Principles

These apply across all tracks and all ventures.

**AI leads, humans govern.** AI does the research, structuring, drafting, designing, and building. The founder makes judgment calls at gates. The goal is not to eliminate human judgment — it is to make human judgment the only thing humans are doing.

**The AI-native advantage is real and should be used.** Satsuma operates with a structural advantage over traditional venture studios and founding teams: AI compresses the time and cost of every phase. Research that takes a team weeks takes hours. Designs that take a design firm months take days. Code that takes an engineering team a sprint takes an afternoon. This changes the calculus on right to win, speed to validation, and capital requirements. Do not default to traditional venture timelines or traditional team-size assumptions. The playbook is calibrated for AI-native execution, not for how studios operated before these tools existed.

**Value created, not just captured.** We choose problems where doing the work well makes things genuinely better — not just for the people paying for it, but for people beyond the transaction. Every venture should have a credible answer to the question: "Who benefits from this existing in the world, beyond the paying customer?" This is not a requirement that every venture be a public benefit corporation. It is a requirement that every venture has a net positive impact on the people it touches and, where possible, on society more broadly. This filter is applied at Track 1, not bolted on at the end.

**UX is not a phase — it is a thread.** Design thinking runs through every track. A concept that cannot be visualized is not ready to build. A product that cannot be used intuitively is not ready to ship.

**The stack is a decision already made.** We use a preferred stack across all ventures to compound our learning and speed. Deviation requires explicit justification. See the Stack section.

**Kill early, kill cleanly.** An idea can be killed at any point in any track. The gates are forcing functions for conscious decisions, not hard stops. A clean kill is a good outcome — it frees capacity for something better.

**Specs are contracts.** Once a spec is signed off at a gate, it is the source of truth for the build. Scope changes require a new gate, not a conversation mid-build.

---

## The Four Tracks

Every idea enters **Track 1**. The only output of Track 1 is a binary: commit to Track 2 or kill the idea. Track 2 ships an MVP to test users. Track 3 scales validated ideas to the point where spin-out is the logical next step. Track 4 graduates ventures into independent entities. Tracks 1 and 2 are fully developed here. Tracks 3 and 4 are placeholders pending the first venture reaching those stages.

| Track | Name | Goal | Website status |
|---|---|---|---|
| 1 | Plant the Seed | Commit or kill | Planted |
| 2 | Sprout the Idea | Ship an MVP to test users | Sprouting |
| 3 | Ripen the Fruit | Scale to spin-out readiness | Ripening |
| 4 | Harvest the Fruit | Graduate and spin out | Harvested |

---

## New Venture Setup

Venture repo creation and initial scaffolding are automated. Run this once before beginning Phase 1 — from the VS Code integrated terminal (Claude Code CLI handles the GitHub and file operations):

```bash
./skills/scripts/new-venture.sh [venture-name]
```

This creates the GitHub repo, scaffolds `CLAUDE.md`, `STATUS.md`, `BACKLOG.md`, and `README.md` from the studio template, and makes the initial commit. Open the new venture repo in VS Code. Claude Code reads `CLAUDE.md` on first session start and is oriented to Phase 1 automatically.

There is no manual step in repo creation. Human judgment is reserved for gate decisions, not setup tasks.

---

## Track 1 — Plant the Seed

**Website label:** Planted

**Goal:** Enough conviction to commit, or a clean kill.

**The right tool:** Claude Code VS Code extension for all phases in Track 1. Web search is available as a built-in capability — no MCP required for general research. All Track 1 artifacts are written to the venture repo by Claude Code at the close of each phase.

**What this track produces:** A tight concept brief and a visual concept ready to react to. Nothing more.

---

### Phase 1 — Signal

**What it is:** AI-led research and opportunity framing.

**The question being answered:** Is there a real problem here, and is there a reason we're the right people to solve it?

**What Claude does:**
- Research the problem space — who has the problem, how they experience it, what they're doing about it today
- Frame the opportunity — size, timing, why now
- Stress-test the premise — what would have to be true for this to work?

**Output:** A Signal Brief. One page. Problem, who has it, why now, why Satsuma. No business plan. No financial model. Just enough to decide whether to go deeper.

Artifact: `signal-brief.md`. Written to the venture repo root by Claude Code at phase close.

**Human input:** You provide the initial idea and any domain knowledge. You react to the Signal Brief and decide whether to continue to Phase 2.

**Gate:** Proceed to Phase 2 only if the problem is real, the target user is specific enough to research, and there is at least one credible reason Satsuma should pursue it. If any of those conditions are weak, kill or defer now — Phase 2 requires more investment.

---

### Phase 2 — Thesis

**What it is:** AI-led competitive and market landscape synthesis.

**The question being answered:** What exists, what's missing, and where is the wedge?

**What Claude does:**
- Map the competitive landscape — direct and indirect alternatives
- Identify the gap the idea occupies
- Draft a one-page investment thesis: what we believe, why the timing is right, what the venture needs to be true to succeed
- Surface the top three risks

**Output:** A Thesis Document. One page. Landscape, gap, belief, risks. Written as if you were making the case to yourself for why this is worth the next six months.

Artifact: `thesis.md`. Written to the venture repo root by Claude Code at phase close.

**Human input:** React to the thesis. Refine the framing. Decide whether the gap is real and the risks are acceptable.

**Gate:** Proceed to Phase 3 only if the gap is specific and defensible, the top risks are known and survivable, and the thesis passes the net positive impact filter. Phase 3 produces a design system and concept screens — a real investment of time. A weak thesis is cheaper to kill here than after Phase 3.

---

### Phase 3 — Concept

**What it is:** Visual concept generation and initial design system definition.

**The question being answered:** Does this feel like a real product? Is this worth building?

**What Claude Code does:**
- Translate the Thesis Document into a venture-specific design system POV — colors, typography, spatial language, component tone
- Generate `DESIGN.md` in the venture repo: the machine-readable design system that all subsequent phases consume
- Generate concept screens and `brand.html` via the `/design` command in Claude Code (see Design Tooling section). HITL checkpoint before screen generation: founder reviews and approves `DESIGN.md` before `/design` runs.
- Produce a Gate Brief: a structured one-page decision document surfacing the three key signals, three risk flags, and a go/no-go recommendation

**Output:**
- `DESIGN.md` in venture repo — the venture's design system, committed at phase close
- Concept screens (3–5) — may optionally be deployed to GitHub Pages for early user validation before the commit gate (see 3-concept.md Step 7); otherwise serve as reference material for the gate decision
- `gate-brief-t1.md` — structured decision document for the Commit or Kill gate

**Human input:** Review the gate brief. This is the most important human judgment in Track 1. You are not approving a design — you are deciding whether the concept is compelling enough to commit to building. If yes, the idea moves to Track 2.

---

### Gate — Commit or Kill

A conscious, explicit decision. Not drifting forward because momentum feels good.

**To commit:** The Signal Brief holds up. The Thesis Document is believable. The visual concept is compelling. You are willing to invest the time Track 2 requires.

**To kill:** Any of those conditions fails. Document why — this is institutional memory that will inform future ideas.

**To defer:** The idea is real but the timing is wrong. Park it with the Signal Brief and Thesis Document intact. Revisit when conditions change.

**Gate brief:** Claude Code produces a structured `gate-brief-t1.md` at the close of Phase 3. It contains: what was found, the three strongest signals, the three highest risks, and a go/no-go recommendation. The human decision is made against this brief, not the raw artifacts. Target review time: 15 minutes.

**Track 1 terminal gate — higher bar:** This gate commits the venture to Track 2. Run `retro.md` Mode C (adversarial review) before confirming. Track 2 requires meaningful investment of time across six phases; committing to it lightly is the most common source of wasted studio capacity.

---

## Track 2 — Sprout the Idea

**Website label:** Sprouting

**Goal:** Something real test users can touch and react to.

**The right tools:** Claude Code VS Code extension for all Track 2 phases. The extension provides a conversational interface, full filesystem access, CLAUDE.md context, and SKILL.md routing — all within VS Code. claude.ai is not required in Track 2.

**What this track produces:** A shipped MVP with real users providing feedback.

---

### Phase 4 — Spec

**What it is:** AI-led product specification.

**The question being answered:** What does the MVP do, and — explicitly — what does it not do?

**What Claude Code does:**
- Translate the Thesis Document and visual concept into a structured product spec
- Write user stories in plain language — for humans, not for developers
- Define the MVP scope with ruthless discipline: only what is required to validate the core thesis
- Explicitly list what is out of scope for v1
- Identify the single metric that will determine whether the MVP is working

**Output:** An MVP Spec. Structured document. User stories, scope, out-of-scope, success metric. This becomes the source of truth for Phases 5 and 6.

Artifact: `spec.md`. Written to the venture repo root. This is the functional source of truth for Phase 6. Sign-off is recorded in `STATUS.md`.

**Human input:** Review and sign off on scope. This is a contract — changes after sign-off require returning to this gate.

**Gate:** Sign off on `spec.md` only when every story has clear acceptance criteria, the OKR is measurable, and the out-of-scope list is explicit. An ambiguous spec produces an ambiguous build. Sign-off is recorded in `STATUS.md`.

---

### Phase 5 — Design

**What it is:** Full UX design from the signed-off spec, producing a finalized design system and screen designs for every user story.

**The question being answered:** Is this product usable and on-brand before we write a line of implementation code?

**What Claude Code does:**
- Extend `DESIGN.md` from the signed-off spec context — the Phase 3 DESIGN.md is the foundation; Phase 5 adds the components and patterns implied by the full screen inventory
- Generate screen designs for every user story via the `/design` command in Claude Code (see Design Tooling section)
- Screens are reference material for Phase 6, not shipped code
- Produce a Phase 5 gate brief for design sign-off

**Output:**
- Extended `DESIGN.md` in venture repo — this is the UX source of truth for Phase 6. Committed and treated as a contract.
- Screen designs covering all user stories in the signed-off spec

**Human input:** Review screen designs against the spec. Sign off on `DESIGN.md` before Phase 6 begins. Flag anything that contradicts the spec — it is cheaper to fix here than in code.

**Gate:** Every screen in the inventory must be designed. Every primary flow must have an empty state and error state. Sign off is recorded in `STATUS.md`. Phase 6 does not start until this gate is confirmed.

---

### Phase 6 — Build

**What it is:** Claude Code-led implementation using the preferred stack.

**The question being answered:** Can we build this cleanly on the preferred stack from the spec and designs?

**What Claude Code does:**
- Make the venture repo private before any other action: `gh repo edit satsuma-ventures/[venture-name] --visibility private`. Track 1 is complete; GitHub Pages is no longer needed and the repo now contains strategic content worth protecting.
- At phase start, decompose `spec.md` into a numbered task list and surface it for human review before executing. The task list is the implementation contract — changes require a new gate.
- Read `CLAUDE.md` on every session start. CLAUDE.md references `DESIGN.md`, `spec.md`, and the current SKILL.md. Claude Code should never need to be re-oriented mid-build.
- Implement the MVP from the signed-off Spec and Design outputs
- Use the preferred Satsuma stack (see Stack section below)
- Treat `spec.md` as the functional source of truth and `DESIGN.md` as the UX source of truth
- Flag any spec ambiguities before implementing, not after

**Human gates during build:**
- Task list approval before implementation begins (see "What Claude Code does" above)
- Milestone demos at epic completion — working software review, not code review
- Final review gate before Phase 7: all epics complete, Amplitude verified, Lighthouse baseline recorded, `BACKLOG.md` updated

**What Claude Code does not do:**
- Expand scope beyond the signed-off spec
- Make UX decisions that contradict the signed-off designs
- Choose a different stack without explicit human approval

---

### Phase 7 — Ship

**What it is:** Beta user onboarding and feedback loop establishment.

**The question being answered:** Do real users find value in this?

**What this phase produces:**
- A defined beta cohort (minimum: five users who will provide structured feedback)
- A feedback collection mechanism
- A decision framework: what does success look like at 30 days, and what are the three possible outcomes (continue, pivot, kill)?

**Human input:** This phase is primarily human-led. AI supports feedback synthesis and helps identify patterns, but the relationships with beta users and the judgment calls on what the feedback means are yours.

**Output of Track 2:** A shipped MVP, real user feedback, and a decision on whether to continue building, pivot the approach, or spin out into Track 3.

**Track 2 terminal gate — higher bar:** The Iterate/Pivot/Graduate/Kill decision commits the venture to a materially different trajectory. Run `retro.md` Mode C (adversarial review) against the recommendation before confirming any outcome. Graduating to Track 3 implies scaling investment; killing ends the venture; pivoting resets the thesis. None of these are reversible without significant cost.

---

## Track 3 — Ripen the Fruit

**Website label:** Ripening

**Status:** Placeholder. To be developed when the first venture reaches this stage.

**What this track will cover:** Scaling from test users to a broader validated user base, iterating on the core thesis, proving the business model, and building to the point where spin-out is the logical next step.

---

## Track 4 — Harvest the Fruit

**Website label:** Harvested

**Status:** Placeholder. To be developed when the first venture reaches this stage.

**What this track will cover:** Full graduation and spin-out of successful ventures into independent entities. Satsuma retains its ownership stake. The venture receives its own leadership team, playbook, and an agentic workflow ecosystem calibrated for growth and scale.

---

## The Preferred Stack

Consistency across ventures compounds our speed. We use the same stack unless there is a specific, documented reason not to. The goal is that every new venture benefits from the accumulated knowledge of every previous one.

### Default Stack

| Layer | Default | Notes |
|---|---|---|
| Frontend | React + Vite | Web-first. PWA by default. See Mobile Strategy section. |
| Styling | Tailwind CSS + CSS custom properties | Tailwind for layout/spacing; venture-specific component class system for brand patterns |
| Backend | Supabase | Auth (Google OAuth + email/password), Postgres with row-level security, Edge Functions |
| Deployment | Vercel | Auto-deploy from main branch. Single branch workflow unless complexity warrants otherwise. |
| AI — search/grounding | Google Gemini | Where real-time web search grounding is required |
| AI — enrichment/reasoning | Anthropic Claude | Content generation, structured data, reasoning. Current model selection documented per venture. |
| Auth model | Action-gated | Public content accessible without login. Auth required for user actions. |
| Implementation tool | Claude Code VS Code extension | Primary interface for all Track 2 phases. Claude Code CLI available in the VS Code integrated terminal for scripting, automation, and new venture scaffolding. |
| Analytics | Amplitude | Integrated at MVP launch, not before |
| SSR | Deferred | Start with React + Vite. Migrate to Next.js only when public editorial content justifies it. |
| Typography | Google Fonts | Default for all ventures. Custom font evaluation deferred to Track 3. |
| Prototyping | GitHub Pages + BugDrop | GitHub Pages for static HTML concept hosting. BugDrop for annotated screenshot feedback → GitHub Issues. Both carry forward from Phase 3 proof-of-concept through Phase 7 beta testing. |

### Design Tooling

Design work in Satsuma follows a two-artifact model:

**`DESIGN.md`** — The machine-readable design system. Lives in the venture repo root. Generated in Phase 3, extended in Phase 5. Referenced in `CLAUDE.md` so Claude Code applies it automatically on every session from Phase 3 onwards. This is the design source of truth for AI agents.

**`brand.html`** — The human-readable visual rendering of the design system. Published on the venture's website. Generated via the `/design` command in Claude Code after Phase 3 `DESIGN.md` is committed (see Phase 3). Not a repo artifact consumed by AI agents in subsequent phases.

**Screen generation — Claude Design:**

Use the `/design` command from the Claude Code CLI in the integrated terminal. Claude Design reads the venture's GitHub repo and applies `DESIGN.md` automatically. Available on Pro and Max plans; no additional account or cost required. Produces `DESIGN.md`-anchored screens for both Phase 3 concept validation and Phase 5 full UX.

### Stack for Cellarbook

Cellarbook is the reference implementation of the default stack above. Refer to the Cellarbook project for implementation-level details.

### Future Considerations

The following tools have been evaluated but deferred. They may be revisited as the studio scales or as the tools mature.

**Stitch (Google Labs)** — A higher-fidelity screen generation tool that connects via MCP (`npx @_davideast/stitch-mcp init`). Evaluated as a Path B alternative to Claude Design for screen generation. Deferred due to: no SLA, sunset risk as a Google Labs product, daily credit limits with no paid override, and the additional per-venture setup overhead. The `DESIGN.md` artifact is portable if Stitch is revisited. Potential fit when multi-screen visual consistency at a higher fidelity level becomes the deciding factor at a Phase 3 or Phase 5 gate.

**Cursor** — A VS Code-compatible IDE with strong AI coding features. Compatible with the Claude Code VS Code extension. Deferred in favour of VS Code as the standard reference environment for playbook documentation. Individual founders may use Cursor — the Claude Code extension and CLI function identically in Cursor. If adopted, no playbook changes are required.


### Stack deviation

If a venture genuinely requires a different stack, document the reason in the venture's own spec. The bar for deviation is: the default stack cannot support the core product requirement, not that a different stack would be marginally better.

---

### Mobile Strategy

We follow a three-stage mobile progression. Each stage is a deliberate decision made at a gate, not a default assumption.

**Stage 1 — PWA (default)**

All ventures launch as Progressive Web Apps. A PWA runs in the browser, can be added to the home screen, and covers the vast majority of MVP use cases without native overhead.

What works in a PWA today:
- Camera access (`getUserMedia`) — works on iOS 13.4+ and Android
- Photo capture — reliable on both platforms
- Barcode/QR scanning — use a WebAssembly-based library (e.g. ZXing-WASM) on iOS where the native Barcode Detection API is not yet supported; works natively on Android/Chrome
- Push notifications — iOS 16.4+ outside the EU; full support on Android
- Offline capability via service workers — works on both platforms with tighter storage quotas on iOS

Known iOS constraints worth monitoring:
- Apple moves slowly on web APIs; Safari on iOS remains the binding constraint
- EU users on iOS 17.4+ may not get full standalone PWA behavior due to DMA compliance changes
- Storage quotas are tighter on iOS than Android

**Stage 2 — Capacitor (when App Store distribution is needed)**

When a venture needs App Store distribution, background device access, or native plugin capabilities that a PWA cannot provide, wrap the existing React + Vite app with Capacitor. This adds iOS and Android distribution without rewriting the application. The web codebase remains the source of truth.

When to evaluate Capacitor:
- The venture needs App Store presence for distribution or trust reasons
- A specific native API is required (e.g. persistent camera permissions, Bluetooth, NFC, background processing)
- The PWA is validated and the product warrants the additional overhead

Capacitor evaluation happens at Phase 4 (Spec) for any venture where mobile is a primary user context from the start, and at Phase 7 (Ship) for ventures where the need emerges post-validation.

**Stage 3 — Native Mobile (Track 3 decision)**

Full native mobile evaluation is deferred to Track 3 and treated as a venture-level leadership decision. Framework choice — React Native, Flutter, or otherwise — belongs to the team that takes the venture forward. This is not a Satsuma studio default.

The bar for Stage 3: native capabilities are core to the product experience in a way that Capacitor cannot adequately serve, and the product has enough validation to justify the investment.

---

## Venture Lifecycle

Every venture at Satsuma has one of four statuses, which correspond to the four tracks:

**Planted** — Track 1 complete. The idea has been through Signal, Thesis, and Concept. A commit decision has been made.

**Sprouting** — In Track 2. Actively being built toward an MVP for test users.

**Ripening** — In Track 3. MVP shipped, test users engaged, iterating toward scale and spin-out readiness.

**Harvested** — Track 4 complete. Graduated and spun out as an independent entity.

These statuses appear directly on the Satsuma website alongside each venture name.

Current ventures:

| Venture | Status |
|---|---|
| Cellarbook | Sprouting |
| CareerChief | Sprouting |
| Corner Street Commerce | Planted |
| Zavari | Planted |
| Weeknight Supper Club | Planted |


---

## Working with AI Agents

### Tool routing by phase

| Phase | Tool | Reason |
|---|---|---|
| Phase 1 — Signal | Claude Code VS Code extension | Built-in web search, conversational research, writes signal-brief.md to repo |
| Phase 2 — Thesis | Claude Code VS Code extension | Built-in web search, competitive synthesis, writes thesis.md to repo |
| Phase 3 — Concept | Claude Code VS Code extension | File system access, DESIGN.md generation, brand.html and screen design via /design |
| Phase 4 — Spec | Claude Code VS Code extension | Reads Track 1 artifacts from repo, writes spec.md |
| Phase 5 — Design | Claude Code VS Code extension | Finalizes DESIGN.md, generates screen designs |
| Phase 6 — Build | Claude Code VS Code extension | Reads CLAUDE.md, spec.md, DESIGN.md; executes task list |
| Phase 7 — Ship | Human-led; Claude Code for synthesis | Relationships and judgment calls are irreducibly human |
| Phase 8 — Learn | Claude Code VS Code extension | Retro synthesis, gate brief, outcome recommendation |

### CLAUDE.md — the per-venture context file

Every venture repo contains a `CLAUDE.md` at its root. Claude Code reads it on every session start. It references:
- `PLAYBOOK.md` (via studio repo path)
- `STATUS.md` (current phase, blockers, last gate)
- `spec.md` (when signed off)
- `DESIGN.md` (when generated)
- The current phase SKILL.md

Claude Code should never need to be manually re-oriented to the current state of a venture. If it does, CLAUDE.md is incomplete.

### How to use this document with Claude Code

Claude Code should treat `spec.md` as the functional source of truth and `DESIGN.md` as the UX source of truth. PLAYBOOK.md provides stack guidance, phase sequencing, and scope guardrails. Claude Code should flag conflicts between these documents before acting, not after.

### General guidance for all AI agents

- Do not expand scope beyond what is signed off at the relevant gate
- Surface ambiguities and conflicts to the human before resolving them independently
- Gate briefs are decision documents, not status reports — they must surface a recommendation, not just a summary
- A clean kill is a good outcome — do not advocate for continuing an idea that isn't working

---

*This is a living document. Update it as the studio learns. The playbook should reflect how we actually work, not how we planned to work.*
