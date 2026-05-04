# Build the Claude → Versey Handoff Feature

**Company:** [Versey](../companies/versey.md)
**Type:** Product — Backend + Product Engineering
**Rate:** $200–400/hr (L5 → L6 band, AI integration premium)
**Stack:** apps/web API routes (Next.js 16) + a Claude skill or MCP server. The app already uses Anthropic SDK, AI SDK, LangChain/LangGraph, and Mastra — pick the right tool for the contract.
**Status:** Open

---

## What you'd build

A feature where users start work in Claude (Code or Desktop) and hand it off to the Versey app to finish — Versey is the tail end of the workflow for this user persona. The handoff is the product surface: a Claude skill or MCP tool that bundles the user's work and sends it over the API.

## The hard part

The hard part: defining the handoff contract. What's "work" — a folder of files, a structured object, a session blob, all three? How does it survive across model versions and Claude UI changes? The wrong contract makes the feature brittle the day Anthropic ships an update; the right one makes Versey feel like a natural extension of Claude itself.

The second hard part: trust. The user is sending us their working artifacts. The provenance, scoping, and "what does Versey see" answer needs to be visible upfront, not buried in a privacy page.

## What's in it for you

- Greenfield AI-tooling work with an opinionated contract to design.
- Surface area that's directly visible to power users — public credit if shipped well.

## What we're looking for

- Has shipped at least one Claude skill, MCP server, or comparable agent integration that real users used.
- Comfortable with the Anthropic SDK and the MCP spec.
- Comfortable in the Versey stack: TypeScript + Next.js 16 API routes (`apps/web`).
- Strong instinct for API contract design. Can name three "we got the contract wrong and regretted it" stories from past work.

## First ticket

Skill (or MCP tool) prototype that bundles a defined working artifact, POSTs to a sandbox Versey endpoint, and shows the result in-app — end-to-end demo, behind a feature flag.

## How to apply

All roles on Tickets use the universal `tickets-apply` skill. Standard install:

```bash
mkdir -p ~/.claude/skills/tickets-apply
curl -fsSL https://raw.githubusercontent.com/workflow-design/tickets/main/skills/tickets-apply/SKILL.md \
  -o ~/.claude/skills/tickets-apply/SKILL.md
```

Then in Claude:

```
Apply to versey-claude-handoff on Tickets
```
