# Ship

**Track:** 2 — Sprout the Idea  
**Track Phase:** 4 of 5  
**Overall Phase:** 7  
**Tool:** Human-led; Claude Code VS Code extension (synthesis, framework support, BugDrop setup, Amplitude verification)  
**Input:** Functional MVP from `2-sprout/6-build.md`, OKR and Amplitude event schema from `2-sprout/4-spec.md`  
**Output:** Live MVP, beta cohort engaged, feedback infrastructure running, 30-day success framework defined — ready for `2-sprout/8-learn.md`
**Version:** 1.2  
**Compatible with:** 6-build v1.0+  

---

## Playbook Context

Read the **Principles** and **Venture Lifecycle** sections of `PLAYBOOK.md` before beginning this phase. This skill consumes the completed MVP from Phase 6 and produces the conditions for Phase 8 to evaluate.

The principles most active in this phase:

- **Value created, not just captured** — beta feedback is the first real test of whether the product creates genuine value for users beyond the transaction. Listen for this signal specifically.
- **Kill early, kill cleanly** — if early beta signals are strongly negative before the 30-day mark, it is legitimate to call Phase 8 early rather than waiting. The 30-day framework is a structure, not an obligation.
- **The AI-native advantage is real** — AI supports feedback synthesis, pattern identification, and framework generation throughout this phase. The human-governed decisions — who is in the cohort, what the feedback means, whether to continue — remain with the founder.

---

## Purpose

Get the MVP in front of real users and establish the feedback loops that Phase 8 will evaluate. This phase is primarily human-led — the relationships, outreach, and judgment calls belong to the founder. AI supports the infrastructure, synthesis, and framework work that surrounds those human activities.

---

## Behavior

### 1. Pre-launch preparation

Complete all of the following before the DNS transition. These are the conditions that make the launch ready — not a formality to rush through.

**Amplitude verified**
The Amplitude event schema defined in Phase 4 should be instrumented in the production build from Phase 6. Verify that key events are firing correctly in the Vercel production environment before any users touch the product:
- Trigger each KR-related event manually and confirm it appears in the Amplitude dashboard
- Verify user identification is working (events are attributed to a user, not anonymous where attribution is required)
- If any events are missing from Phase 6 instrumentation, implement them now before go-live

**BugDrop updated for beta**
Update the BugDrop script tag in the React app's `public/index.html` from `poc-feedback` to `beta-feedback`:
- Change the label configuration from `poc-feedback` to `beta-feedback`
- Verify BugDrop is working in the production build
- The `poc-feedback` label on `/docs/` concept pages can remain — it will stop receiving traffic once DNS switches

Ask Claude Code to make this change and verify it in the deployed app.

**Final smoke test**
Walk through every primary user flow end-to-end in the production environment — not localhost. Cover:
- Sign-up and sign-in (both Google OAuth and email/password)
- Every primary flow from the screen inventory
- At least one AI-powered feature under realistic conditions
- Mobile experience on the primary target device

Log any failures. Fix blocking issues before launch. Log non-blocking issues to `BACKLOG.md`.

**Onboarding flow walkthrough**
Walk through the first-time user experience as if you are a new user with no context. Evaluate:
- Is the first action obvious?
- Is the first moment of value reachable without help?
- Is there anything that would cause a new user to abandon before reaching the core feature?

Fix anything that would cause drop-off before the first meaningful action. This is cheaper to fix now than to diagnose from churn data in Phase 8.

---

### 2. Go live — DNS transition

Going live is a 1-way door in terms of user expectations — once the product is public, users expect it to be there. Before switching DNS, run `retro.md` **Mode C (adversarial review)**:

- State the case for going live now: pre-launch checklist is complete, cohort is standing by, the product is ready
- Argue the strongest case for waiting: anything from Step 1 that wasn't fully resolved, any nagging doubt about readiness, any known issue that would be worse to discover post-launch than to fix now
- Give the founder the opportunity to engage before confirming

If the adversarial review surfaces a blocking concern, resolve it before switching DNS. If it surfaces a non-blocking concern, log it to `BACKLOG.md` and proceed.

With the review complete, switch the domain from GitHub Pages to Vercel:

1. Remove or update the DNS A/CNAME records pointing to GitHub Pages
2. Add Vercel's DNS records (A records or CNAME to `cname.vercel-dns.com`)
3. Configure the custom domain in the Vercel project settings
4. Verify HTTPS is provisioned and the domain resolves correctly
5. Confirm the production app loads at the custom domain

The `/docs/` GitHub Pages site is no longer served at the custom domain after this switch. It remains accessible at `[username].github.io/[repo]/` and can be used for future concept tests or pointed to a subdomain later.

---

### 3. Beta cohort recruitment and onboarding

With the app live, begin cohort recruitment. This is a rolling process — users are added over time as relationships and access allow, not launched all at once. The goal is high-quality feedback from a meaningful number of real target users, not a coordinated launch event.

**Cohort size**
Aim for a minimum of five users who represent the target segment from the Thesis Document. A larger cohort is preferable where accessible through personal networks — more signal reduces noise at Phase 8. There is no upper limit; err toward more rather than fewer at this stage.

**Who belongs in the cohort**
Every cohort member should genuinely have the problem the product solves — not people doing the founder a favour. A user who does not have the problem will give feedback about a product they would never use. That feedback is not useful and can be actively misleading.

**Recruitment approach**
Through personal networks and direct relationships — the skill does not prescribe how. The founder owns this. Recruit continuously as the beta period progresses rather than waiting for a full cohort before onboarding anyone.

**Onboarding each user**
For each cohort member:
- Reach out personally with context: what they are testing, why their perspective is valuable, what kind of feedback is most useful
- Give them the URL and let them explore — do not over-explain the product before they have seen it
- Tell them the BugDrop widget is available for any reaction, question, or confusion as they explore
- Set a light expectation: a brief check-in around day 7 and a more thorough conversation at day 30

**What structured feedback means**
- In-product reactions via BugDrop (contextual, in the moment)
- A short check-in around day 7: what have they tried, what confused them, what felt valuable
- A more thorough conversation at day 30: would they use this regularly, what would make it more useful, would they recommend it

The conversations are human-led. AI helps synthesize the themes afterward, not conduct the outreach.

---

### 4. Establish the 30-day success framework

Translate the OKR from Phase 4 into a concrete 30-day evaluation framework. This is the input to Phase 8.

**Define the 30-day targets**
For each Key Result, what does success look like at 30 days? Make each target specific and measurable:

| Key Result | 30-day target | Data source |
|---|---|---|
| [KR from Phase 4] | [Specific number or threshold] | [Amplitude / BugDrop / direct conversation] |

**Define the outcomes**
What would each of the three possible outcomes look like in concrete terms, based on the data?

**Continue** — the thesis is holding. Core KRs are at or near target. Users are returning. Feedback is directionally positive. The right next step is to iterate on what's working.

**Pivot** — the thesis needs revision. Users are engaging but not in the way the product intended, or a different value proposition is emerging clearly from the feedback. The right next step is to return to Phase 4 with a revised spec.

**Kill** — the thesis has failed. Users are not engaging, feedback is not pointing toward a fixable problem, or the core assumption from Phase 2 has proven false. The right next step is a clean kill and documentation of what was learned.

Set the Phase 8 review date (30 days from go-live) in the venture's project file now.

---

### 5. Ongoing feedback synthesis

During the 30-day beta period, maintain a regular feedback synthesis cadence. AI supports this work; the founder governs it.

**Weekly synthesis**
Each week, ask Claude Code to:
- Review new BugDrop issues from the past 7 days and identify emerging themes
- Summarize Amplitude data against the KR targets (what's trending toward target, what isn't)
- Flag any signal that warrants attention before the 30-day review

This is not a formal deliverable — it is a weekly sense-check that keeps the founder informed and prevents Phase 8 from being the first time the data is examined.

**Feedback log**
Maintain a running `beta-feedback-log.md` in the venture's repo. Each week, Claude Code appends a brief synthesis entry:

```markdown
## Week [N] — [Date range]

**BugDrop themes:** [2–3 recurring themes from issues]
**Amplitude signals:** [KR progress: on track / below target / above target]
**Notable feedback:** [Any specific quote or interaction worth flagging]
**Flags:** [Anything that warrants action before Phase 8]
```

---

### 6. Gate: Ship complete

Phase 7 is complete when the following are true:

- Beta cohort engaged and active ✓/✗
- DNS switched and production app live ✓/✗
- Amplitude events verified in production ✓/✗
- BugDrop running with `beta-feedback` label ✓/✗
- 30-day success framework defined ✓/✗
- Phase 8 review date set ✓/✗

Present the gate to the founder:

> The beta is live and the feedback infrastructure is running. Phase 8 — Learn — begins at the 30-day review date. In the meantime, weekly synthesis continues. Is there anything that needs to be resolved before we proceed?

Note in the Spec Amendment Log that Phase 7 is complete.

> **Session management:** Before starting the next phase, follow the session rules in `venture.md` — `/compact` for phase transitions within a track, new session for track transitions.

---

## Guardrails

**This phase is human-led.** AI supports the infrastructure, synthesis, and framework work. The relationships with beta users, the judgment calls about what feedback means, and the decision about what comes next are the founder's.

**Cohort quality over quantity — but quantity matters too.** More users from the target segment produces more reliable signal at Phase 8. The minimum is five; aim higher where your network allows. Do not populate the cohort with people doing you a favour — populate it with people who genuinely have the problem the product solves.

**Do not over-explain the product before users try it.** Pre-explaining creates confirmation bias in the feedback. Let users form their own first impression, then discuss.

**The 30-day framework is a structure, not an obligation.** If strong signal emerges before 30 days — positive or negative — act on it. Phase 8 can be called early.

**Amplitude is a signal, not a verdict.** With a cohort of five to ten users, quantitative data is directional at best. Qualitative feedback from direct conversations carries more weight at this stage.

**Do not instrument new Amplitude events in Phase 7.** Events added post-launch contaminate the baseline. Log any missing events to `BACKLOG.md` for the next iteration.

**Do not proceed to Phase 8 without the 30-day framework defined and the review date set.**
