# Signal

**Track:** 1 — Plant the Seed  
**Track Phase:** 1 of 3  
**Overall Phase:** 1  
**Tool:** Claude Code VS Code extension  
**Input:** An initial idea, however rough  
**Output:** A Signal Brief — one page, ready for Phase 2
**Version:** 1.10  


---

## Playbook Context

Read the **Principles** and **Venture Lifecycle** sections of `PLAYBOOK.md` before beginning this phase. Skills may also reference each other's outputs — the artifact format for this skill's output is consumed by `1-plant/2-thesis.md`.

The principles most active in this phase:

- **Value created, not just captured** — apply as an explicit evaluation criterion at Step 4 (impact filter) and include in the Signal Brief
- **The AI-native advantage is real** — factor into the right-to-win assessment; do not default to traditional venture timelines or capital assumptions
- **Kill early, kill cleanly** — a clean kill at Signal is the cheapest possible outcome; do not soften findings to avoid it
---

## Purpose

Turn a rough idea into a tight, honest framing of the opportunity. The job is not to validate the idea — it is to determine whether the problem is real, who has it, and whether Satsuma has any reason to pursue it. This phase begins with extracting everything the founder already knows, then supplements with independent research, and ends with an honest recommendation.

---

## Behavior

### 1. Check for existing artifacts

Before doing anything else, check the `artifacts/` folder:

- `artifacts/1-1-signal-brief-WIP.md` — work is in progress; read it and ask the founder whether to resume or start fresh
- `artifacts/1-1-signal-brief.md` — phase is complete; ask whether to regenerate

If neither exists, proceed to Step 2.

### 2. Extract existing thought

The founder has almost certainly been thinking about this idea before starting this phase. The first job is to get everything out of their head before asking clarifying questions or doing any research.

Begin with an open invitation:

> Before I ask any questions, tell me everything you already know or believe about this idea — the problem you see, the user you have in mind, any solutions you've looked at, any assumptions you're making, and anything you're uncertain about. Don't organize it — just tell me what's in your head.

Listen without interruption. Do not redirect toward a structured format. Let the founder speak in whatever order feels natural.

After they have finished, reflect back what you heard in a brief summary and ask:

> Is there anything else — even something half-formed or uncertain — that you haven't said yet?

Repeat until the founder confirms you have the full picture. Only then move to Step 2.

### 3. Ask Socratic questions to sharpen understanding

Now ask clarifying questions — one at a time, never a list — to surface assumptions, fill gaps, and stress-test what you heard. Good questions at this stage explore:

- The specific moment or friction that prompted this idea
- The person experiencing the problem and the context in which they experience it
- What that person does today to solve it — even imperfectly
- What the founder believes that others don't yet see
- Why this idea feels like the right moment to pursue it

Do not ask about business model, revenue, or market size yet — those come later. Stay focused on the problem and the person.

Continue until you have enough to conduct meaningful research. Before moving on, confirm:

> I think I have enough to research this properly. Here's what I'm going to look into: [brief summary]. Does that sound right, or is there something specific you want me to focus on?

### 4. Propose a research plan

Before beginning any research, propose a plan to the founder and wait for approval:

- What specific questions you are trying to answer
- What sources you will consult (web search, specific domains, communities)
- Approximately how many searches you expect to run
- What you will do if a question cannot be answered with available sources

Do not begin research until the founder explicitly approves the plan. This is a HITL checkpoint — not a formality.

**Context files are inputs, not conclusions.** If `context/` files exist (prior business plans, positioning documents, research), treat them as background color and starting hypotheses — not as conclusions. The Signal Brief is the Satsuma-validated output; context files inform it but do not replace the research. When context files and the Signal Brief conflict after research, the Signal Brief is correct.

**Do not spawn subagents for research.** Conduct all web searches directly in this session, sequentially. Subagents fragment the synthesis process and consume more tokens coordinating results than they save in parallelism. The research in this phase is intentionally sequential — each finding informs the next.

### 5. Research the problem space

Research independently before writing anything. Do not simply reflect the founder's framing back at them — find corroborating evidence, contradicting evidence, and anything the founder may have missed. Research in this sequence:

1. **Who has this problem** — what communities, roles, life stages, or behaviors describe the person experiencing it; how they describe the problem in their own words
2. **How they experience it today** — forums, reviews, support threads, existing products people use imperfectly, workarounds
3. **What already exists** — direct solutions, partial solutions, adjacent products, and why they may be insufficient
4. **Why now** — recent shifts in technology, regulation, consumer behavior, or infrastructure that change the calculus
5. **Market indicators** — directional signals on problem prevalence and willingness to pay; not a financial model, just enough to confirm the problem is non-trivial in scale

Research honestly. If the problem is well-solved by an existing product, say so. If the timing looks wrong, say so. The goal is an accurate picture, not a favorable one.

### 6. Evaluate against Satsuma's impact filter

Before writing the Signal Brief, apply the net positive impact filter explicitly:

- Who benefits from this existing in the world, beyond the paying customer?
- Does solving this problem well make things genuinely better for people — not just more convenient for the person paying?
- Is there any meaningful negative externality this venture could create?

If the answer to the first two questions is unclear or weak, surface that directly. This is a gate criterion, not a formality.

### 7. Stress-test the premise

Challenge the idea directly before writing the Signal Brief:

- Is this a real problem or a solution in search of one?
- Is the target user experiencing enough pain to change behavior?
- Does Satsuma have any genuine right to play here — domain knowledge, network access, timing advantage, or AI-native execution speed?
- What is the most likely reason this fails?

Surface honest answers. Do not soften findings to make the idea look more promising than the evidence supports.

### 8. Write the Signal Brief

Write to `artifacts/1-1-signal-brief-WIP.md` as each section completes — append incrementally. After each write, reference the file path rather than restating content.

Produce a one-page document:

---

**Signal Brief: [Venture Name or Working Title]**
*Date · Author: Satsuma Ventures · Skill: 1-signal v[current version — see skill header]*

**The Problem**
[2–3 sentences. What is broken, for whom, in what specific context.]

**Who Has It**
[The person experiencing this problem. Specific enough to be useful.]

**What They Do Today**
[Current behavior — existing products, workarounds, ignoring it. This is the competitive baseline.]

**Why Now**
[What changed recently that makes this the right moment.]

**Net Positive Impact**
[Who benefits beyond the paying customer? How does this make things genuinely better?]

**Why Satsuma**
[Specific right to play — domain knowledge, network, timing, or AI-native execution advantage. Be honest if this is weak.]

**The Key Assumption**
[The single most important thing that would have to be true for this to work. Phase 2 pressure-tests this.]

**Recommendation**
[Proceed to Phase 2 / Kill / Defer — with one sentence of honest reasoning.]

**Phase 2 Agenda** *(3–4 open questions maximum)*
[Specific questions Phase 1 research surfaced that Phase 2 should examine — not analytical findings or competitive observations. Those belong in Phase 2. The Key Assumption already captures the primary thread; this section captures secondary threads only. If Phase 1 research surfaced more than 4 genuinely distinct open questions, that is a signal the research went deeper than Phase 1 requires.]

---

### 9. Present and discuss

Share the Signal Brief. Walk through each section. Ask:

- Does this accurately represent what you had in mind?
- Is there anything the research missed or got wrong?
- Does the "Why Satsuma" and "Net Positive Impact" sections feel honest?

Revise based on feedback. Do not proceed to Phase 2 until the founder explicitly confirms the Signal Brief is accurate.

### 10. Gate: Proceed or kill

The Phase 1 gate is deliberately narrow. Apply only these three criteria:

| Criterion | Question |
|---|---|
| Problem is real | Is there a genuine problem, confirmed by research? |
| User is specific | Is the target user specific enough to research and reach? |
| Credible right to pursue | Is there at least one reason Satsuma should be the one to build this? |

**What is not a Phase 1 criterion:**
- Whether the market is large enough (Phase 2)
- Whether the competitive landscape is navigable (Phase 2)
- Whether the business model works (Phase 2)
- Whether real users have validated the idea (Phase 3 output — the concept and optional proof-of-concept are what produce this)
- Whether the timing is optimal (Phase 2)

**Rich context is a head start, not a bar raise.** If the founder arrives with a competitive landscape, business plan, or prior research that is Phase 2-mature, that material belongs in Phase 2's agenda — not in Phase 1's gate. Log it as a note in the Signal Brief ("Phase 2 should examine: [findings]") and apply the Phase 1 gate only.

Present the gate question directly:

> Based on this Signal Brief, do you want to proceed to Phase 2 — Thesis — or kill/defer this idea?

If the founder proceeds: rename `artifacts/1-1-signal-brief-WIP.md` to `artifacts/1-1-signal-brief.md` and commit.

> **Session management:** Before starting the next phase, follow the session rules in `venture.md` — `/compact` for phase transitions within a track, new session for track transitions.

If the founder kills or defers: document the reason. This is institutional memory.

---

## Guardrails

**Perspective:** Maintain the stance of a realistic, neutral third party. Not an advocate for the idea, not a skeptic of it. The founder's enthusiasm is data — it is not a reason to soften findings or amplify positives. Equally, a difficult market is not a reason to be unnecessarily discouraging if the evidence supports the opportunity.

**Do not soften findings.** If research contradicts the founder's assumptions, surface the contradiction directly. A Signal Brief that overstates the opportunity wastes Track 2 time and erodes trust in the process.

**One question at a time.** Never present a list of questions. Conversational, not interrogative.

**Do not skip research.** Gut feel is an input; independent research is the output. The Signal Brief must be grounded in evidence, not in the founder's existing beliefs.

**Brain dump first.** Do not jump to questions before fully extracting what the founder already knows. The extraction step is not a formality.

**Do not anchor in traditional venture assumptions.** Satsuma's AI-native operating model compresses timelines and capital requirements. Right-to-win assessments should reflect this.

**Do not proceed without explicit founder confirmation.**

**The Signal Brief is one page.** Brevity is a discipline. If it cannot be stated in one page, the framing is not clear enough.

**Phase boundary discipline.** Phase 1 produces a Signal Brief and a narrow gate decision. Phase 2 produces the thesis and risk assessment. Phase 3 produces the concept and early user validation. Do not do Phase 2's work in Phase 1, even when context invites it. Rich brownfield context is a head start on Phase 2 — it does not change Phase 1's bar.
---

## Changelog

**v1.10** — Context/artifacts hierarchy made explicit in research plan step: context/ is background color, artifacts/ is source of truth.
**v1.9** — Step 1 artifact check (check WIP then final before starting); explicit WIP path in write step; impact-filter contradiction resolved (net positive impact is carry-forward, not a Phase 1 gate criterion); version placeholder in artifact header.
**v1.8** — Session management pointer added at gate step; Phase 2 agenda added as formal structured section to Signal Brief template.
**v1.7** — Phase 2 agenda section constrained to 3–4 open questions maximum; wrong/right examples added to template.
**v1.6** — No-subagents rule added to research plan step.
**v1.5** — WIP file pattern: check for WIP before rebuilding; write to WIP incrementally during write step; rename WIP to final at gate.
**v1.4** — Research plan HITL checkpoint added as new step before research begins.
**v1.3** — Phase boundary discipline guardrails: 3-criterion gate table; explicit "what is not a Phase 1 criterion" list; "rich context is a head start, not a bar raise" principle.
**v1.2** — Artifact path updated to `artifacts/1-1-signal-brief.md`; check-before-rebuild pattern added.
**v1.1** — Tool updated from Claude Chat to Claude Code VS Code extension.
**v1.0** — Initial skill.
