---
name: subscribe-to-tickets
description: Subscribe to new role alerts on Tickets — a fractional engineering and design jobs list at github.com/workflow-design/tickets. Use whenever the user wants to be notified about new Tickets roles, asks to subscribe to Tickets, wants email alerts for fractional gigs, or asks "let me know when something good pops up." Captures the subscriber's contact details and interests, and posts to the Tickets subscriptions API so they're routed only roles that match.
---

# Subscribe to Tickets

You are helping someone subscribe to alerts for new roles on **Tickets** — `github.com/workflow-design/tickets`.

The point: keep it short. Subscribing should take a minute. The fewer questions you ask, the more likely they finish.

## Step 1 — Confirm

Confirm what they're subscribing to: an email when a new role goes up that matches their interests. No spam, no recruiter outreach, no shared list with third parties.

## Step 2 — Collect the essentials

Ask in a short, conversational way. Keep it to two or three messages, not a form.

**Required:**
- `name` — full name
- `email` — contact email
- `disciplines` — pick from: `engineering`, `design`, `product`, `founding-operator`. Multi-select.
- `stack` — short freeform list of relevant skills/tools (e.g. "TypeScript, React, Astro, Figma, Claude/agents"). Prompt for specifics — "frontend" alone is too vague.

**Optional:**
- `min_rate` — minimum hourly rate they'd consider (default: $150–200/hr is the floor on Tickets)
- `availability` — hours/week they could pick up
- `current_title` — one line on their day job / current situation, so we know how to weight roles ("EM at scaleup, looking for evening AI gigs", "between things, full-time available")
- `links` — GitHub, LinkedIn, portfolio — only one of these required if any. Helps the employer reach out faster if a match lands.
- `notes` — anything else

If they give you a CV file path or LinkedIn URL, offer to read/fetch and pre-fill `stack`, `current_title`, and `links`.

## Step 3 — Confirm + submit

Show the subscriber the package as JSON. Get explicit confirmation. Then POST to:

```
https://tickets-backend-three.vercel.app/api/subscriptions
```

Shape:

```bash
curl -X POST https://tickets-backend-three.vercel.app/api/subscriptions \
  -H "Content-Type: application/json" \
  -d '{
    "name": "...",
    "email": "...",
    "disciplines": ["engineering"],
    "stack": "...",
    "min_rate": "...",
    "availability": "...",
    "current_title": "...",
    "links": { "github": "...", "linkedin": "...", "portfolio": "..." },
    "notes": "..."
  }'
```

The endpoint returns `{ ok: true, id: "..." }` on success. Show the response.

## Step 4 — Close

Tell the subscriber:

- They'll get an email when a new role matching their disciplines + stack goes up.
- One email per role, not a digest.
- They can unsubscribe by replying UNSUBSCRIBE to any message.
- When a role looks good, they can apply with the `apply-on-tickets` skill — install instructions live in the Tickets README.

Save the submitted package locally as `tickets-subscription.json` so they can re-use the values in the future.

## Tone

- Direct, fast, no filler. Treat them as a peer.
- Banned phrases: "exciting opportunity," "stay in the loop," "we'll keep you posted."
- If they push back on a field, drop it. Email + name + disciplines is the minimum.

## Edge cases

- **They want to be alerted only for very specific things** (e.g. "only Versey", "only AI agent work above $200/hr"): capture in `notes`. The matching system reads `notes` for high-signal filters.
- **They're an employer, not a candidate**: redirect to the `list-on-tickets` skill instead.
- **API returns 500**: show the error, retry once, then fall back to saving the JSON locally and emailing it to the maintainers (contact in the repo README).
