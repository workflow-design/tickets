---
name: tickets-list
description: Browse open roles on Tickets — a fractional engineering and design jobs list at github.com/workflow-design/tickets. Use whenever the user wants to see what's currently open, search Tickets for a discipline (engineering, design, product) or company, find a role to apply to, or get a quick scan of available work. Read-only — fetches the live list from the Tickets API and prints a concise summary. Filters by the local Tickets profile (~/.claude/skills/tickets-profile/profile.json) when present.
---

# List on Tickets

You are showing a candidate (or anyone curious) the **currently open roles** on Tickets. Read-only — never POST, never write files.

## Step 0 — Load profile

Look for `~/.claude/skills/tickets-profile/profile.json`. If it exists and parses, hold it as `profile`. If not, set `profile = null`.

The profile drives default filtering. Bypass it only if the user passes `--all` as the skill arg, or explicitly says "show all roles".

If `profile` is null and the user did not specify any filter, fetch all and at the end of the listing offer to set up a profile (`tickets-profile`) so they don't have to re-filter every time.

## Step 1 — Resolve filters

If the user passed explicit filters in the prompt, those win over the profile.

Filters, in priority order:
1. **Explicit user filters** (this turn): discipline, company, stack keyword.
2. **Profile filters** (if `profile` and not `--all`): `profile.disciplines`, `profile.stack` (split on commas → keywords), `profile.skip_companies`.
3. **None**: fetch all.

## Step 2 — Fetch

```bash
curl -s 'https://app.tckts.work/api/listings?status=open<&discipline=...>'
```

If filtering by a single discipline, pass it as a query param (the API supports it). For multi-discipline profiles, fetch all and filter client-side.

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

## Step 3 — Filter + rank

Apply in order:

1. **Discipline match.** Drop listings whose `discipline` (lowercased) isn't in the active discipline set.
2. **Company skip.** Drop listings whose `company_slug` is in `profile.skip_companies`.
3. **Already applied.** Drop listings whose `${company_slug}-${slug}` is in `profile.applied_roles[].slug`. (Strict — matches-only mode.)
4. **Stack rank.** If a stack-keyword set is in play (from profile or explicit user filter), score each remaining listing by the count of keywords (case-insensitive) found in `stack[]`, `title`, and `summary`. Sort descending by score.

If everything filters out: tell them so, suggest dropping a filter, and offer to subscribe via `tickets-subscribe`.

## Step 4 — Show

Header line summarizes filtering:
- With profile + matches: `Filtered by your profile (3/9 match). Pass --all to see everything.`
- With explicit filters only: `Filtered by: engineering, react (4/9 match).`
- No filters: omit header.

One block per listing, separator between. Keep it scannable.

```
{title} — {companies.name}
{discipline} · {commitment ?? "—"} · {rate ?? "rate TBD"}
{summary if present}

Slug: {company_slug}-{slug}
Apply: ask Claude "Apply to {company_slug}-{slug} on Tickets"
Read:  https://github.com/workflow-design/tickets/blob/main/roles/{company_slug}-{slug}.md
```

After the list, offer **one** next step based on what they seem to want:

- "Want me to fetch the full role page for any of these?" → use WebFetch on the public repo URL.
- "Want to apply to one?" → invoke `tickets-apply` with the slug.
- "Want to subscribe to alerts so you don't have to re-check?" → invoke `tickets-subscribe`.
- If `profile` is null: "Want to set up a profile so I only show matching roles next time?" → invoke `tickets-profile`.

Don't dump all of them — pick the one that fits.

## Tone

- Direct, terse, peer tone.
- If a listing's title/summary reads like marketing slop, print it as-is — don't editorialize.
- Banned phrases: "exciting opportunities," "great roles," "amazing work."

## Edge cases

- **`--all` arg:** skip steps 1–3 except the explicit-filter pass; show everything.
- **API down (5xx or timeout):** Tell the user, fall back to `https://raw.githubusercontent.com/workflow-design/tickets/main/README.md` for a static list, note it may be stale.
- **No filters match:** offer subscribe.
- **User wants closed/filled roles:** add `&status=filled` or `&status=closed`. Filled roles can be useful as portfolio examples.
- **User wants the raw JSON:** show the response unmodified (post-filter). Some users will want it for tooling.
- **Profile parse error:** print a short warning ("profile failed to parse, showing all"), then proceed unfiltered.
