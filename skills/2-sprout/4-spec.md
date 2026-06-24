# Spec

**Track:** 2 — Sprout the Idea  
**Track Phase:** 1 of 5  
**Overall Phase:** 4  
**Tool:** Claude Code VS Code extension  
**Input:** Concept Summary from `1-plant/3-concept.md`  
**Output:** A signed-off MVP Spec — the functional source of truth for Phases 5 and 6
**Version:** 1.3  
**Compatible with:** 3-concept v1.0+  

---

## Playbook Context

Read the **Principles**, **Stack**, and **Venture Lifecycle** sections of `PLAYBOOK.md` before beginning this phase. This skill consumes the Concept Summary produced by `1-plant/3-concept.md` and produces the MVP Spec consumed by `2-sprout/5-design.md` and `2-sprout/6-build.md`.

The principles most active in this phase:

- **Specs are contracts** — once signed off, the MVP Spec is the source of truth. Changes require a formal amendment process (see Scope Changes below). Do not let scope expand silently.
- **UX is not a phase — it is a thread** — the Spec must produce a screen inventory that gives Phase 5 everything it needs. UX thinking belongs in story definition, not just in design.
- **The AI-native advantage is real** — agentic delivery compresses the traditional story/task distinction. Epics deliver demonstrable user value; stories are discrete implementation units within them. Size accordingly.
- **Kill early, kill cleanly** — if scoping the MVP reveals the thesis cannot be validated with a reasonable feature set, surface that now rather than after Phase 6.

---

## Purpose

Translate the committed concept into a precise, unambiguous specification that Claude Code can implement and the founder can review. The Spec defines what the MVP does, what it explicitly does not do, how success is measured, and what Phase 5 needs to design. It is a contract — not a wish list, not a roadmap, not a vision document.

---

## Behavior

### 1. Make the repo private

Track 2 begins here. Before anything else, set the venture repo to private:

```bash
gh repo edit satsuma-ventures/[venture-name] --visibility private
```

Track 1 is complete. GitHub Pages is no longer needed. The repo now contains the Signal Brief, Thesis Document, DESIGN.md, and concept screens — strategic content worth protecting before the spec is written.

Update `STATUS.md` to reflect the stage change to Sprouting.

### 2. Orient to the Concept Summary

Confirm you have reviewed the Concept Summary from Phase 3. Identify:

- What the product is and who it is for
- What the MVP must do (the non-negotiables from Track 1)
- What the MVP must not become (the scope boundary from Track 1)
- The open questions flagged for Phase 4 to resolve

If no Concept Summary exists, do not proceed. Ask the founder to complete Track 1 first.

### 3. Define the OKR

Before touching features, establish how success is measured. An MVP exists to validate a thesis — the OKR makes that validation concrete and measurable.

**Objective:** One sentence. The thesis validation statement. Answerable with a meaningful yes/no at 30 days post-launch. Should be ambitious but realistic given the MVP scope.

> *Example: "Validate that wine collectors will use a mobile-first tool to track their cellar and receive AI-powered drinking window recommendations."*

**Key Results:** 2–3 measurable indicators that signal progress toward the Objective. Lead metrics, not lag metrics where possible. Each KR should be specific enough to generate a number.

> *Example KRs: (1) 10 beta users add at least 5 wines within 7 days of onboarding. (2) 60% of active users return within 14 days. (3) At least 3 users explicitly reference AI recommendations in feedback.*

Present the OKR to the founder and confirm before proceeding. Everything in the Spec should connect back to this OKR — if a feature doesn't serve the Objective or a KR, it belongs in the out-of-scope list.

**Measurement plan**
For each Key Result, define the event(s) that will measure it. This is a conceptual mapping — Phase 6 owns the technical implementation. Keep it readable: the goal is to make sure every KR has a clear signal, not to write instrumentation code.

| Key Result | Event(s) | Trigger |
|---|---|---|
| [KR from above] | [event name in snake_case] | [the user action that fires it] |

Include this table in the MVP Spec. Phase 6 instruments these events using the Amplitude SDK; Phase 7 verifies they are firing correctly in production before the beta cohort is onboarded.

### 4. Assess technical design requirements

Before defining epics and stories, assess whether this venture introduces technical problems not previously solved in the Satsuma stack.

**Skip technical design if** the implementation approach is well-understood from existing ventures — standard auth flows, CRUD operations, Supabase edge functions calling an AI model, Vercel deployment, basic PWA patterns. Use established playbook patterns and proceed.

**Conduct technical design if** the venture introduces:
- A novel data model with non-obvious relational complexity
- A real-time or event-driven component (websockets, live collaboration, push-triggered workflows)
- An unusual AI integration pattern (multi-model pipelines, streaming responses, vector search, agentic loops)
- A performance-sensitive feature (high-volume queries, media processing, sub-second UX requirements)
- A third-party integration with meaningful complexity or reliability risk
- Anything where Claude Code would need to make architectural decisions mid-build

**If technical design is required:**
- Define the specific technical problems to solve before writing stories
- Propose an approach for each and confirm with the founder
- Document decisions as a Technical Design section in the Spec
- Flag any technical risks introduced by the approach

**Either way:** document the assessment explicitly in the Spec. Downstream phases need to know whether a Technical Design exists and where to find it.

### 5. Define epics

Structure the MVP as a set of epics. Each epic must:

- Deliver a self-contained, demonstrable slice of user value — not a technical increment
- Be reviewable as working software by the founder at completion
- Map directly to one or more user needs from the Concept Summary

**The agentic delivery model:** In Satsuma's AI-native build approach, delivery is compressed. An epic is the unit of human review — Claude Code delivers a working epic, and the founder reviews working software, not code. Size epics accordingly: each should take a session or two to implement, not a week.

Name epics from the user's perspective:
- ✓ "User can add and track wines in their cellar"
- ✗ "Build wine data model and CRUD endpoints"

Present the epic list to the founder. Confirm the set is complete and correctly scoped before writing stories.

### 6. Sketch user journeys per epic

For each epic, write a plain-language user journey — not a prototype, not a wireframe, just a narrative sequence:

> *User arrives at [entry point] → [does action] → [sees/experiences result] → [achieves outcome]*

One to three sentences per epic. This gives Phase 5 the orientation it needs to design the right screens, and it surfaces UX assumptions before they become built-in constraints.

If a journey sketch reveals an assumption that contradicts the Concept Summary, surface it now.

### 7. Define stories with acceptance criteria

For each epic, define the stories that implement it. A story is a discrete unit of Claude Code's work — specific enough to have unambiguous acceptance criteria.

**Story format:**

> **As a** [user], **I want to** [action], **so that** [outcome].
>
> **Acceptance criteria:**
> - [ ] [Specific, testable condition]
> - [ ] [Specific, testable condition]
> - [ ] [Specific, testable condition]

Acceptance criteria are non-negotiable. Claude Code uses them to know when a story is done without asking. Vague criteria produce vague output.

**Sizing guidance:** In the agentic model, stories are closer to what traditional agile calls subtasks. A story should be completable in a single focused Claude Code session. If a story is too large to complete in one session, split it.

### 8. Build the screen inventory

From the epics, stories, and journey sketches, produce a flat list of every distinct screen the MVP requires. This is the handoff to Phase 5.

For each screen:
- **Name:** What the screen is called
- **Epic:** Which epic it belongs to
- **Purpose:** One sentence — what the user is doing on this screen
- **Key elements:** The 2–3 most important things that must appear or happen

Do not design the screens here. The screen inventory tells Phase 5 what to design — it does not tell it how.

### 9. Define out-of-scope

Explicitly list what is not in the MVP. Be specific — "nice to have features" is not a list. Items should be concrete enough that a reasonable person could not argue they are in scope.

Out-of-scope items fall into two categories:
- **Deferred to v2:** Features that may belong in a future iteration
- **Out of scope entirely:** Features that are outside the venture's thesis

Both categories matter. A feature deferred to v2 has a different implication than one that was considered and rejected.

### 10. Write the MVP Spec

Produce the full Spec document:

---

**MVP Spec: [Venture Name]**
*Version 1.0 · Date · Author: Satsuma Ventures · Skill: 4-spec v1.0*

**OKR**
Objective: [thesis validation statement]
Key Results:
1. [KR1]
2. [KR2]
3. [KR3 if applicable]

**Technical Design**
[Required / Not required — rationale]
[If required: summary of technical decisions and link to Technical Design section]

**Epics and Stories**

*Epic 1: [Name]*
Journey: [plain-language narrative]
- Story 1.1: [user story + acceptance criteria]
- Story 1.2: [user story + acceptance criteria]

*Epic 2: [Name]*
[same structure]

[Continue for all epics]

**Screen Inventory**
| Screen | Epic | Purpose | Key Elements |
|---|---|---|---|
| [Name] | [Epic] | [One sentence] | [2–3 elements] |

**Out of Scope**
Deferred to v2:
- [Item]
- [Item]

Out of scope entirely:
- [Item]
- [Item]

**Amendment Log**
[Empty at v1.0 — updated as amendments are approved]

---

### 11. Present and confirm

Share the MVP Spec with the founder. Walk through:

- OKR — does the Objective accurately represent thesis validation? Are the KRs the right signals?
- Epics — is the set complete? Is anything missing or included that shouldn't be?
- Stories — are the acceptance criteria specific enough to be testable?
- Screen inventory — does this match what the founder imagined?
- Out of scope — is anything incorrectly excluded?

Revise based on feedback. Do not proceed to Phase 5 until the founder explicitly signs off.

### 12. Gate: Sign-off

Present the gate directly:

> This Spec is now a contract. Changes after sign-off require a formal amendment. Are you ready to sign off and proceed to Phase 5 — Design?

On sign-off: save the MVP Spec as `spec-v1.0.md` in the venture's project folder. This is the source of truth for Phases 5 and 6.

---

## Scope Changes

Three tiers of change, each with a different process:

**Clarification** — a story needs more detail, acceptance criteria needs sharpening, a term needs defining. No scope impact. Update in place, log the change in the Amendment Log with a note.

**Minor amendment** — a story changes in nature but does not affect the OKR, other epics, or the screen inventory. Founder acknowledges the change explicitly. Log in the Amendment Log with version bump (v1.1, v1.2).

**Scope change** — adding or removing an epic, changing the OKR, adding screens to the inventory, or a story that touches multiple epics. Return to the Phase 4 gate. Produce a new Spec version (v2.0). Phase 5 and Phase 6 work pauses until the new version is signed off.

When in doubt about which tier a change falls into, treat it as the more significant tier.

---

## Guardrails

**Perspective:** Maintain the stance of a realistic, neutral third party. The Spec is not an advocacy document for the idea — it is a precise definition of what will be built. If scoping reveals the thesis cannot be validated with a reasonable feature set, surface that finding directly.

**OKR first.** Do not define epics before the OKR is confirmed. Features that do not serve the Objective or a KR belong in the out-of-scope list.

**Acceptance criteria are not optional.** Every story must have specific, testable acceptance criteria. "Works correctly" is not a criterion.

**Epics deliver user value, not technical increments.** If an epic name describes infrastructure rather than user outcome, rename or restructure it.

**Technical design is conditional, not skipped.** Assess explicitly. Document the decision either way.

**The screen inventory is a Phase 5 contract.** Do not design screens here. Do not omit screens that are implied by stories.

**Do not proceed to Phase 5 without explicit founder sign-off.**

**Out of scope is as important as in scope.** An explicit out-of-scope list prevents scope creep during Phase 6 more effectively than any other single artifact.
