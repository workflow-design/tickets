---
name: tickets-list
description: Browse open roles on Tickets — a fractional engineering and design jobs list at github.com/workflow-design/tickets. Use whenever the user wants to see what's currently open, search Tickets for a discipline (engineering, design, product) or company, find a role to apply to, or get a quick scan of available work. Read-only — fetches the live list from the Tickets API and prints a concise summary.
---

# List on Tickets

You are showing a candidate (or anyone curious) the **currently open roles** on Tickets. Read-only — never POST, never write files.

## Step 1 — Resolve filters

Ask the user what they want filtered on, if not already obvious from their message. All optional.

- **Discipline** — `engineering`, `design`, or `product`.
- **Company** — they may name one (e.g. "Versey only").
- **Stack/skills keyword** — to narrow further client-side.

If they just said "show me open roles" with no filters, skip the question and fetch all.

## Step 2 — Fetch

```bash
curl -s 'https://tickets-backend-three.vercel.app/api/listings?status=open<&discipline=...>'
```

Response shape:

```json
{
  "ok": true,
  "listings": [
    {
      "id": "<uuid>",
      "slug": "hiring-platform",
      "company_slug": "versey",
      "title": "Automate Versey's Hiring Backend + Outreach",
      "discipline": "Engineering",
      "status": "open",
      "commitment": "Fractional, ~10–20 hrs/wk",
      "location": null,
      "rate": "$200–400/hr",
      "stack": ["typescript", "..."],
      "summary": "...",
      "created_at": "2026-...",
      "companies": { "name": "Versey", "website": "https://versey.ai" }
    }
  ]
}
```

If the user asked for a specific company, filter client-side by `company_slug`. If they gave a stack keyword, filter `listings[].stack` and listings whose `summary` or `title` matches (case-insensitive contains).

If `listings` is empty after filtering: tell them so, suggest dropping a filter, and offer to subscribe via the `tickets-subscribe` skill so they get pinged when something matches.

## Step 3 — Show

Print a compact summary. One block per listing, separator between. Keep it scannable — no walls of text, no marketing copy.

```
{title} — {companies.name}
{discipline} · {commitment ?? "—"} · {rate ?? "rate TBD"}
{summary if present, else first 1–2 sentences of the role file}

Slug: {company_slug}-{slug}
Apply: ask Claude "Apply to {company_slug}-{slug} on Tickets"
Read:  https://github.com/workflow-design/tickets/blob/main/roles/{company_slug}-{slug}.md
```

After the list, offer **one** of these next steps based on what they seem to want:

- "Want me to fetch the full role page for any of these?" → use WebFetch on the public repo URL.
- "Want to apply to one?" → invoke `tickets-apply` with the slug.
- "Want to subscribe to alerts so you don't have to re-check?" → invoke `tickets-subscribe`.

Don't dump all three options — pick the one that fits.

## Tone

- Direct, terse, peer tone. Match the Tickets voice.
- If a listing's title/summary reads like marketing slop, just print it as-is — don't editorialize. The lister will fix their own copy.
- Banned phrases: "exciting opportunities," "great roles," "amazing work."

## Edge cases

- **API down (5xx or timeout):** Tell the user, fall back to the README at `https://raw.githubusercontent.com/workflow-design/tickets/main/README.md` for a static list, and note that it may be stale by minutes.
- **No filters match:** offer subscribe.
- **User wants closed/filled roles:** add `&status=filled` or `&status=closed`. Filled roles can be useful as portfolio examples of what Tickets carries.
- **User wants the raw JSON:** show the response unmodified. Some users will want it for tooling.
