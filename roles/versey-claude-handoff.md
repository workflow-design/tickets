# Build the Claude → Versey Handoff Feature

**Company:** [Versey](../companies/versey.md)
**Type:** Backend + Product Engineering
**Stakeholder:** [Will Taylor, CEO](https://www.linkedin.com/in/wrftaylor/)
**Rate:** $200–400/hr (L5 → L6 band, AI integration premium)
**Minimum earning per ticket:** $4k (~2 days at the L5 floor)
**Seniority:** Senior to Staff (L5–L6) — match the candidate to the work
**Rate verified:** levels.fyi · Software Engineer (AI / ML) · SF Bay Area · L5–L6 · P50 · fetched 2026-04-27 · [levels.fyi/t/software-engineer/focus/ai-ml/locations/san-francisco-bay-area](https://www.levels.fyi/t/software-engineer/focus/ai-ml/locations/san-francisco-bay-area)
**Stack:** `apps/web` API routes (Next.js 16) + a Claude skill or MCP server. The app already uses Anthropic SDK, AI SDK, LangChain/LangGraph, and Mastra — pick the right tool for the contract.
**Estimated hours:** _TODO_
**Status:** Coming soon

---

## What you'd build

A feature where users start work in Claude (Code or Desktop) and hand it off to the Versey app to finish — Versey is the tail end of the workflow for this user persona. The handoff is the product surface: a Claude skill or MCP tool that bundles the user's work and sends it over the API.

## The hard part

The hard part: defining the handoff contract. What's "work" — a folder of files, a structured object, a session blob, all three? How does it survive across model versions and Claude UI changes? The wrong contract makes the feature brittle the day Anthropic ships an update; the right one makes Versey feel like a natural extension of Claude itself.

The second hard part: trust. The user is sending us their working artifacts. The provenance, scoping, and "what does Versey see" answer needs to be visible upfront, not buried in a privacy page.

## What's in it for you

- Greenfield AI-tooling work with an opinionated contract to design.
- Surface area that's directly visible to power users — public credit if shipped well.
- _TODO — anything else?_

## What we're looking for

- Has shipped at least one Claude skill, MCP server, or comparable agent integration that real users used.
- Comfortable with the Anthropic SDK and the MCP spec.
- _TODO — backend stack the Versey app uses._
- Strong instinct for API contract design. Can name three "we got the contract wrong and regretted it" stories from past work.

## First ticket

_TODO — first deliverable. (e.g. "Skill prototype that bundles a defined working artifact and POSTs to a sandbox endpoint, with an end-to-end demo.")_

## How to apply

### Apply in Claude

```bash
mkdir -p ~/.claude/skills/tickets-apply
curl -fsSL https://raw.githubusercontent.com/workflow-design/tickets/main/skills/tickets-apply/SKILL.md \
  -o ~/.claude/skills/tickets-apply/SKILL.md
```

Then in Claude:

```
Apply to versey-claude-handoff on Tickets
```
