# Concept

**Track:** 1 — Plant the Seed  
**Track Phase:** 3 of 3  
**Overall Phase:** 3  
**Tool:** Claude Code VS Code extension  
**Input:** A confirmed Thesis Document from Phase 2  
**Output:** `DESIGN.md` (machine-readable design system, at repo root), `brand.html` (visual design system validation), concept screens (3–5), `artifacts/1-3-gate-brief.md`, and a Commit/Kill/Defer decision
**Version:** 1.6  
**Compatible with:** 2-thesis v1.0+  


---

## Playbook Context

Read the **Principles**, **Stack**, and **Venture Lifecycle** sections of `PLAYBOOK.md` before beginning this phase. This skill consumes the Thesis Document produced by `1-plant/2-thesis.md` and produces the Concept Summary consumed by `2-sprout/4-spec.md`.

The principles most active in this phase:

- **UX is not a phase — it is a thread** — the concept is the first moment design thinking becomes visible; it should reflect the product's core experience, not just its surface
- **The AI-native advantage is real** — Claude Code + Claude Design compresses concept production from weeks to hours; use the speed to explore more interpretations, not to ship the first draft
- **Kill early, kill cleanly** — a concept that does not compel commitment is a valid kill signal; cheaper to end here than after a spec has been written
---

## Purpose

Translate the Thesis Document into something the founder can see and react to. The job is not to design a product — it is to produce enough visual fidelity to make the Commit or Kill decision with confidence. Everything before this phase was research and reasoning. This phase produces something real.

This is the most important human gate in Track 1.

---

## Behavior

### 1. Check for existing artifacts

Before beginning, check whether any Phase 3 artifacts already exist:
- `DESIGN.md` at repo root
- `artifacts/1-3-gate-brief-WIP.md` — if found, work is in progress; ask whether to resume
- `artifacts/1-3-gate-brief.md` — if found, phase is complete; ask whether to regenerate

Never silently overwrite a signed-off artifact. Never silently overwrite a signed-off artifact.

### 2. Orient to the Thesis Document

Confirm you have reviewed the Thesis Document from Phase 2. Identify:

- The core user and their primary need
- The gap the venture fills
- What the product must do at minimum to validate the thesis
- What the product must *not* become (scope boundary)
- The net positive impact framing

If no Thesis Document exists, do not proceed. Ask the founder to complete Phase 2 first.

### 3. Define the core user journey

Before involving Claude Design, define the product concept at the journey level. Ask the founder:

- What is the single most important thing the user comes to this product to do?
- What does success look like for that user in the first five minutes?
- What is the one moment where this product is most different from anything that exists today?

From these answers, map 1–2 primary user flows as simple narrative sequences — not wireframes, not specs. "The user arrives → does X → sees Y → achieves Z." This gives Claude Design the right orientation before producing visuals.

Do not over-specify. Leave room for design interpretation.

### 4. Generate DESIGN.md, brand.html, and concept screens

Phase 3 produces three sequential outputs: the machine-readable design system (`DESIGN.md`), its human-readable validation (`brand.html`), and concept screens anchored to the approved system.

**Step A — Generate DESIGN.md**

Claude Code translates the Thesis Document into a venture-specific design system POV and writes `DESIGN.md` to the venture repo. This file becomes the design source of truth for all subsequent phases. At minimum it should define: color palette, typography, spacing scale, component tone, and visual personality.

Commit `DESIGN.md` before proceeding. Do not move to brand.html generation until it is in the repo.

**Step B — Generate brand.html via `/design`**

`DESIGN.md` is machine-readable markdown — the founder cannot meaningfully validate it visually. Run `/design` now to generate `brand.html`: the human-readable visual rendering of the design system.

Brief Claude Design on the venture context (name, personality, target user) and ask it to produce `brand.html` from `DESIGN.md`. Claude Design reads the repo and applies `DESIGN.md` automatically.

Commit `brand.html` to the repo (optionally to `/docs/brand.html` if GitHub Pages is being used).

**Step C — HITL checkpoint: review brand.html before generating screens**

Present `brand.html` to the founder. This is the meaningful design direction review — the visual palette, typographic system, and component tone are all visible here.

Questions to ask:
- Does the visual direction match the intended brand personality?
- Is there anything tonally wrong before screens are generated?
- Are there specific adjustments to make before proceeding?

If the direction needs adjustment, update `DESIGN.md`, regenerate `brand.html`, and review again. This is the cheapest moment to change direction — before any screens exist.

Confirm founder approval before proceeding to concept screens.

**Step D — Generate concept screens via `/design`**

Run `/design` again with a brief on the screens to generate (from Step 4 below). Claude Design applies the now-approved `DESIGN.md` and produces 3–5 concept screens.

Concept screens are committed to the repo. They can optionally be deployed to `/docs/` as part of the GitHub Pages proof-of-concept (Step 7).

Claude Design is available on Pro and Max plans; no additional account or cost required.

### 5. Define the screens to design

List 3–5 screens that together tell the product story. Prioritize screens that:

- Show the core value proposition in action (not a marketing landing page)
- Illustrate the key differentiation from existing solutions
- Include at least one moment that would be meaningfully different from a competitor's equivalent screen

Do not list infrastructure screens (settings, account management, password reset). Design the product, not the plumbing.

For each screen, write a one-sentence brief: what it is, what the user is doing, and what the screen needs to communicate.

### 6. Brief for screen generation

Combine the concept brief from Step 3 with the screen definitions from Step 4 into a single handoff:

---

**[Venture Name] — Concept Brief**

*Product context*
[Name, what it does, who it's for, how it should feel — from Step 3]

*Font and visual direction*
[From Step 3 — font preferences if any, tone adjectives, references, what to avoid]

*User journey*
[1–2 sentence narrative of the primary user flow from Step 2]

*Screens to design*
1. [Screen name] — [what it is, what the user is doing, what it must communicate]
2. [Screen name] — [same]
3. [Screen name] — [same]
[4–5 if applicable]

*These are concept screens for a commit-or-kill decision, not production designs. Pass this brief to Claude Design via `/design` in Step 3D.*

---

### 7. Generate screens and iterate

Pass the brief to Claude Design via `/design` (Step 3D). After receiving the initial output:

- Review for concept clarity first, aesthetic second. Does each screen communicate what it needs to communicate?
- Ask for at least one alternative interpretation before finalizing. The first concept is rarely the best one.
- If something does not feel right, diagnose whether the problem is in the brief or execution before revising.

### 8. Optional — Proof-of-concept on GitHub Pages

Before presenting the concept to the founder for the commit decision, consider whether early signal from real target users would improve the quality of that decision.

**When to use this step:**
- The founder has limited direct access to the target user and wants external signal before committing
- The concept involves an unfamiliar user behavior and a real URL test would surface reactions that a static review would not
- The founder wants to pressure-test a specific screen or flow before committing Track 2 time

**When to skip it:**
- The founder has strong direct knowledge of the target user and high confidence in the concept
- Speed to commit matters more than additional signal at this stage
- The concept involves sensitive or proprietary ideas where sharing a URL introduces risk

---

**How to execute**

*Step A — Register the domain*
Register the venture's domain now. A real URL makes the concept feel credible to users and takes five minutes to configure with GitHub Pages. Naming conventions: prefer `.com` where available; `.co`, `.app`, or `.io` are acceptable alternatives.

*Step B — Export and publish the concept*
1. Ask Claude Design to export the concept screens as self-contained HTML files — one file per screen, or a linked multi-screen flow
2. Push the HTML to the venture's GitHub repo under `/docs/`
3. Enable GitHub Pages on the repo (Settings → Pages → Deploy from branch → `main` → `/docs/`) and configure the registered domain — GitHub Pages natively supports `/docs/` as a source folder; no GitHub Action required
4. The concept is live at the registered domain within minutes

*Step C — Add BugDrop feedback widget*
BugDrop creates annotated screenshot feedback directly as GitHub Issues — no token, no backend, no separate account required beyond the GitHub App installation.

1. Install the BugDrop GitHub App on the venture's repo from the GitHub Marketplace (bugdrop.dev → Install) — one step, done
2. Ask Claude Code to:
   - Fetch the current BugDrop script tag format from bugdrop.dev
   - Inject it into every HTML file in `/docs/` before `</body>`
   - Configure it with the venture's repo owner/name, label `poc-feedback`, and the venture's primary color (or Grove `#2E5428` if not yet established)
   - Commit the changes

No credentials appear in the HTML. Authentication is handled entirely by the GitHub App. Feedback from users appears automatically as labeled GitHub Issues in the venture's repo.

*Step D — Share and synthesize*
Share the URL with 3–5 target users. Give them no framing about what the product is meant to do — unprimed reactions are the most valuable signal. Ask them to use the feedback button for any reaction, question, or confusion as they explore.

Review the GitHub Issues before the founder session in Step 8. Synthesize the headline reactions — what users thought it was, what confused them, what they wanted to do.

**What this produces:** A domain, a shareable proof-of-concept URL, and annotated screenshot feedback as GitHub Issues. The same BugDrop setup — GitHub App installation plus script tag — carries forward into Phase 7 beta testing with a label change and no additional infrastructure work.

**Add to the Concept Summary if used:** Note that a proof-of-concept was run, how many users responded, and what the headline reaction was.
---

### 9. Evaluate with the founder

Present the concept screens with context:

- Walk through each screen and explain what it is trying to communicate
- Ask the founder to react before explaining — first impressions are the most valuable data
- Focus the discussion on three questions:
  1. Does this feel like a product worth building?
  2. Does it accurately reflect the thesis — the gap, the user, the differentiation?
  3. Is there anything here that makes you more or less confident in the commit decision?

Do not defend the designs. The founder's reaction is the data. If the reaction is negative, diagnose whether it is a concept problem or a visual problem — they require different responses.

### 10. Assess concept readiness

Before presenting the gate, assess whether the concept is strong enough to support a commit decision:

**Ready to commit if:**
- The core user journey is legible from the screens without extended explanation
- The key differentiation from existing products is visible in at least one screen
- The founder can articulate what they are committing to build

**Revise if:**
- The screens feel generic — they could belong to any product in this category
- The thesis is not visible in the design
- The founder cannot identify the differentiation without extended explanation

If revision is needed, identify the specific problem and update the Claude Design brief. Focus on concept-level clarity, not aesthetic preferences.

### 11. Gate: Commit, Kill, or Defer

This is a 1-way-door decision — committing to Track 2 is a significant investment of time and focus. Before presenting the gate question, run `retro.md` **Mode C (adversarial review)**:

- State the case for committing: what the Signal Brief, Thesis Document, and concept together support
- Argue the strongest case against committing: what would have to be wrong for this to be a mistake
- Give the founder the opportunity to engage with the adversarial argument before confirming

Once the adversarial review is complete, present the gate:

> Based on this concept, are you ready to commit to Track 2 — or would you kill or defer this idea?

Walk through the commit criteria from the Playbook:

- The Signal Brief holds up ✓/✗
- The Thesis Document is believable ✓/✗
- The visual concept is compelling ✓/✗
- You are willing to invest the time Track 2 requires ✓/✗

**To commit:** All four criteria are met. Document the commit decision and move to Track 2.

**To kill:** One or more criteria fails. Document why. A clean kill is a good outcome — it frees capacity for something better.

**To defer:** The idea is real but a specific dependency is unresolved or timing is wrong. Park all artifacts intact with a revisit condition stated explicitly.

### 12. Prepare handoff to Track 2

If committed, produce a Concept Summary:

---

**Concept Summary: [Venture Name]**
*Committed: [Date] · Skill: 3-concept v1.0*

**What we are building**
[One sentence — the product, for whom, doing what.]

**What we validated in Track 1**
[The gap, the user, the timing argument — carried forward from the Thesis Document.]

**Design system established**
[Brief summary of the visual identity established for this venture.]

**The concept screens**
[Reference or attach the Claude Design output.]

**What the MVP must do**
[2–3 non-negotiable capabilities implied by the concept — the minimum needed to validate the core thesis.]

**What the MVP must not become**
[The scope boundary — what was deliberately excluded.]

**Open questions for Phase 4 (Spec)**
[Anything the concept raised that the spec needs to resolve.]

**Gate brief**
Commit `artifacts/1-3-gate-brief.md` to the venture repo at phase close. Structure:

```markdown
# Gate Brief — Track 1 / Phase 3
*Date · Venture: [Name] · Skill: 3-concept v1.4*

## What we found
[2–3 sentences summarising the concept and design system output]

## Three strongest signals
1. [Signal]
2. [Signal]
3. [Signal]

## Three highest risks
1. [Risk]
2. [Risk]
3. [Risk]

## Recommendation
[Go / No-go — one sentence of honest reasoning]
```

---

## Guardrails

**Perspective:** Maintain the stance of a realistic, neutral third party. A visually strong concept does not mean the business is sound. A visually weak concept does not mean the business is not. Evaluate the concept on whether it serves the commit decision — nothing more.

**Journey before screens.** Do not brief Claude Design before the user journey is defined. Screens without a journey are decoration.

**Design system before screens.** Do not brief Claude Design on screens before the design system is established. Screens without a design system are exercises in style, not product thinking.

**Aesthetic feedback ≠ conceptual feedback.** If the founder dislikes the visual style but the concept communicates clearly, the concept is working. Redirect aesthetic feedback to the design system brief, not the concept evaluation.

**Do not defend designs.** The founder's reaction is the data. If they react negatively, diagnose — do not explain why the design is actually good.

**Fidelity serves the decision.** These are commit-or-kill screens, not production designs. Do not over-invest in visual polish at the expense of concept speed.

**Do not proceed to Track 2 without explicit founder confirmation.**

**A Defer is not a Kill.** Preserve all artifacts. Document the specific condition that would trigger revisiting.

> **Session management:** Before starting the next phase, follow the session rules in `venture.md` — `/compact` for phase transitions within a track, new session for track transitions.
