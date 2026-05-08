# Automate Tickets' Hiring Backend + Outreach

**Company:** [Tickets](../companies/tickets.md)

**Type:** Engineering — Fractional AI Engineering · ongoing, ~10–20 hrs/week

**Rate:** $200–400/hr (L5 → L6 band)

**Status:** Open

---

## What you'd build

The candidate-side frontend already ships. [Tickets](https://github.com/workflow-design/tickets) is live, the `tickets-apply` and `tickets-subscribe` skills work, applications flow into Linear, Slack pings on submit. **You are not building that.**

You'd own the two pieces around it:

**1. Hiring backend automation.** Once a role lands in Linear, the rest runs itself — subscriber matching + email dispatch on new listings, candidate enrichment from public profiles (LinkedIn, X, GitHub), Calendly scheduling on shortlist, contract + IP send, provisioning (Slack invite, scoped GitHub access, Figma seat) on hire, monthly invoice ingestion, offboarding sweep. Most of it is LLM-orchestrated agents calling Linear / Slack / Calendly / GitHub APIs with a strict human-in-the-loop escape hatch.

**2. Outreach engine.** Source candidates from X, LinkedIn, GitHub, Reddit, HN. Score against open Linear tickets. Send first-touch messages that don't read like recruiter slop. Parse replies, route warm ones into the funnel, drop cold ones cleanly. The eval loop is the work, not a side quest.

Tickets is **not** asking you to rebuild the candidate side or the platform.

## The hard part

The hard part: **outreach that doesn't feel like outreach.** LinkedIn and X inboxes are saturated with LLM-generated cold pitches. The bar is "would *I* reply to this?" answered by someone who already gets ten of these a day. You'll iterate on prompts, exemplars, and reply-rate measurement — the eval is the deliverable, not just the agent.

Second hard part: orchestration glue is easy; **observable** glue is the work. Every step needs traces, retries, idempotency, and a human-in-the-loop escape. A black-box agent that silently drops an applicant or sends a contract to the wrong person costs more than the whole pipeline saves.

## Stack we're running

- **Runtime:** TypeScript on Vercel today. Pick what fits for new pieces — Python for scrapers is fine.
- **Models:** Anthropic SDK. Claude Sonnet 4.6 for cheap tool calling, Opus 4.7 for harder reasoning, prompt caching on. Default to thinking off; turn it on where it earns its keep.
- **Tools:** MCP servers for Linear, Slack, GitHub where they exist; raw API where they don't.
- **State:** Linear is the system of record. Postgres or Vercel KV for anything Linear can't model.
- **Outreach plumbing:** Playwright for LinkedIn (with accounts we provision), X API, GitHub search API, Reddit/HN scraping, Resend for email.
- **Evals:** Lightweight LLM-judge harness + reply-rate dashboards. We're an Anthropic shop; bring your own opinions.

Defaults, not commandments. If you'd ship faster with a different choice, justify it in the PR.

## What's in it for you

- **Real product, paid work routed weekly.** The pipeline you're automating is in production from day one. Mistakes hit real people; so do wins.
- **Agent work with no committee.** One stakeholder, one PR, ship it. Decisions in Slack, not in design review.
- **SF rates, no agency cut.** $150–200/hr, paid monthly on an itemized invoice. $2.5k minimum per ticket.
- **Escalating scope.** Start with one ticket. If it ships well, the next is bigger. We escalate trust the same way we ask employers to.
- **Write-up rights.** Outreach playbook, eval methodology, what worked — yours to publish with our blessing.

## What we're looking for

- Shipped at least one production agent — LLM-orchestrated, multi-step, real users. Not a demo or a hackathon.
- LLM evals as part of your dev loop, not a postscript. You can talk about precision/recall on a real task you ran.
- Strong taste for prompt vs. function vs. workflow. You don't reach for an agent when a switch statement would do.
- Production TypeScript. Python OK for outreach scrapers.
- Read APIs cleanly. First PR within week one.

YC-alumni-caliber. Underemployed. Looking for work that uses what you can actually do.

## First ticket

**Subscriber → role matching and dispatch.** When a new role lands in Linear, find subscribers whose `disciplines` and `stack` fields match, send each a personal-feeling email with the role link, log dispatch state on the role's Linear issue, and ship a short eval (precision/recall against a hand-labelled set Will provides).

End-to-end, including the eval harness. ~$2.5k. If it ships well, ticket two is the outreach engine.

## How to apply

All roles on Tickets use the universal `tickets-apply` skill. Standard install:

```bash
mkdir -p ~/.claude/skills/tickets-apply
curl -fsSL https://raw.githubusercontent.com/workflow-design/tickets/main/skills/tickets-apply/SKILL.md \
  -o ~/.claude/skills/tickets-apply/SKILL.md
```

Then in Claude:

```
Apply to tickets-hiring-platform on Tickets
```

## How to apply

All roles on Tickets use the universal `tickets-apply` skill. Standard install:

```bash
mkdir -p ~/.claude/skills/tickets-apply
curl -fsSL https://raw.githubusercontent.com/workflow-design/tickets/main/skills/tickets-apply/SKILL.md \
  -o ~/.claude/skills/tickets-apply/SKILL.md
```

Then in Claude:

```
Apply to tickets-hiring-platform on Tickets
```
