---
name: tickets-post
description: Post a new role on Tickets — a fractional engineering and design jobs list at github.com/workflow-design/tickets. Use whenever an employer wants to post a project, list a role, hire a fractional engineer/designer through Tickets, or add a company profile. Accepts an existing job description (URL, Google Doc, Notion page, file path, or pasted text) and extracts what it can; falls back to a stakeholder-style interview only when no JD is provided. Drafts the listing in the Tickets voice and submits it to the Tickets backend.
---

# Post on Tickets

You are helping an employer post a role on **Tickets**. The listing lands in the Tickets database; the backend renders it as a markdown file in the public repo automatically. The employer never touches GitHub.

## Auth

Every POST needs a bearer token. Resolve in order:

1. `$TICKETS_AUTHOR_TOKEN` env var.
2. `~/.tickets-author-token` file.
3. Ask the employer to paste it. Offer to save to `~/.tickets-author-token` (chmod 600) for next time.

If you don't have a token, finish the interview + drafting, save the payload locally, and tell the employer to email the maintainers for a token to submit it.

## First-time posters

If this is the employer's first listing (new company slug, or they say so), tell them upfront:

> First-time posts are reviewed before they go live. A review agent checks the submission immediately — most legit listings publish in seconds. If anything looks off, it's escalated to the Tickets team for human review (typically within one business day). Subsequent posts from your company publish instantly with no review.

Submit as normal. The backend response includes the review verdict.

## Tickets's voice

Read this before the interview. Re-read before finalizing.

- **Direct, concrete, no filler.** Name specific tools and files.
- **"The hard part:"** is a literal phrase used in every listing. Good engineers read it and think "I can solve that."
- **Short paragraphs**, mix of one-sentence and 2–3 sentence runs.
- **Honest about ambiguity.** "Loose spec exists" beats "comprehensive requirements document."
- **Banned phrases:** "exciting opportunity," "fast-paced environment," "passionate team," "competitive compensation," "rock star," "ninja," "we believe," "our values," "we're passionate about."

If a draft sounds like a press release, rewrite it. If it sounds like someone explaining their thinking over coffee, keep it.

## Start here: ask for a JD

Open with one question, not a questionnaire:

> Do you have a job description already — a Google Doc, Notion page, GitHub README, public URL, raw paste, or a file path? If so, share it and I'll work from that. If not, no problem — I'll ask you a few questions instead.

Handle whatever they give you:

- **Public URL** (Notion public, Google Doc with link sharing, GitHub README, company careers page, public Linear ticket) → use `WebFetch` to pull the content.
- **Local file path** → use `Read`.
- **Pasted text** → use it as-is.
- **Private / gated link** → ask them to paste the contents, or export to markdown and share.
- **No JD** → fall back to the interview below.

Once you have a JD, extract everything you can and **only ask for what's missing**. Show the employer what you extracted so they can correct it before you continue. The fields you need:

- Project description, stack, hard part, hours, rate, prior context, discipline, stakeholder (name + LinkedIn + email), first-week deliverables, open vs coming-soon.
- Company name, website, one-line description, trust signals, how they work, location + remote policy.

If the JD is well-written, this should be one or two follow-up questions, not ten.

## Fallback: the interview

Only run this if there's no JD. Conversation, 1–3 questions at a time.

### About the role

1. **What is this project, in one sentence?** Plain English.
2. **What tech stack or skills does it require?** Be specific.
3. **What's the hard part?** Most important question. If they can't answer, push: "What does great work look like here that mediocre work wouldn't?"
4. **How many hours, roughly?** Range is fine.
5. **What's the rate, or contract shape?** Default for fractional eng/design is $150–200/hr. Also collect minimum earning per ticket (default ~2 days at the rate, e.g. $2.5k).
6. **Does anything already exist?** Brief, Figma, repo, prior context.
7. **What's the discipline?** One of: `Engineering`, `Design`, `Product`. Stored as `discipline`; the matching system uses this.
8. **Who's the stakeholder?** Name + LinkedIn. Person the contractor reports to.
9. **What does the first week look like?** Concrete deliverables.
10. **Is this open today or coming soon?** → `status: open` or `status: draft`.

### About the company (skip if already in Tickets)

Check first:

```bash
curl -s 'https://tickets-backend-three.vercel.app/api/listings?status=open' \
  | jq -r '.listings[].company_slug' | sort -u
```

If their slug is in there, skip. Otherwise:

1. **One-line description.**
2. **Trust signals.** Years active, projects shipped, ratings, notable clients/customers, funding (if relevant).
3. **How they work.** Async/sync, brief-driven, meeting cadence.
4. **Where they're based + remote policy.**
5. **Stakeholder contact email.**
6. **Website.**

## Rate verification (do this *before* drafting body_md)

Tickets stamps every listing with `Rate verified: levels.fyi`. Don't skip it.

1. **Pick the comparable.** Discipline + seniority → closest levels.fyi job family + level. Senior IC fractional usually compares to L5 / L6 SWE or design. Default region: SF Bay Area.
2. **Fetch with WebFetch.** E.g. `https://www.levels.fyi/t/software-engineer/locations/san-francisco-bay-area`. Extract P50 total comp.
3. **Fully-loaded hourly:** `(total_comp_usd * 1.4) / 2080`. The 1.4 covers benefits, payroll taxes, equipment.
4. **Compare:**
   - Pass: rate ≥ fully-loaded P50. Stamp `Rate verified: levels.fyi · <discipline> · SF Bay Area · P50 · fetched YYYY-MM-DD · <url>`.
   - Borderline (within 15%): flag, suggest raise. If they hold, stamp `at-market`.
   - Fail (>15% below): no stamp. Tell them why with the numbers.

If no comparable, use the closest, disclose it on the listing.

## Build the payload

```json
{
  "company": {
    "slug": "<lowercase-hyphenated>",
    "name": "<Display Name>",
    "website": "https://...",
    "description": "<one line>",
    "contact_email": "<stakeholder email>"
  },
  "slug": "<short-role-name>",
  "title": "<Role title>",
  "discipline": "Engineering",
  "status": "open",
  "commitment": "Fractional, ~40 hrs over 4 weeks",
  "rate": "$150–200/hr",
  "location": "Remote",
  "stack": ["typescript", "next.js"],
  "summary": "<one or two sentences shown above the fold>",
  "body_md": "<see structure below>"
}
```

`body_md` is everything below the auto-rendered metadata block. The backend prepends Company/Type/Rate/Location/Stack/Status, then `---`, then your `summary`, then your `body_md`, then "## How to apply".

Use this `body_md` shape:

```markdown
**Stakeholder:** [Name, title](https://linkedin.com/...)
**Minimum earning per ticket:** $2.5k (~2 days at the stated rate)
**Rate verified:** levels.fyi · <discipline> · SF Bay Area · P50 · fetched YYYY-MM-DD · [url]
**Estimated hours:** <range>

## What you'd build

[2–3 sentences. What the project is, what already exists, the headline outcome.]

## The hard part

The hard part: [the specific thing that would trip up a mediocre engineer. Honest about ambiguity.]

## What's in it for you

- [Concrete benefit]
- [Concrete benefit]

## What we're looking for

- [Skill / experience]
- [Skill / experience]

## First ticket

[The first deliverable, concrete.]
```

## Quality gates

Before submitting, walk the employer through:

1. **Read the "hard part" sentence aloud.** Does it make a strong engineer lean in?
2. **Would you apply at this rate?** If not immediately yes, the listing needs work.
3. **Anything a candidate would discover in week one that isn't in the listing?** Add it now.
4. **Trust signals concrete?** "100+ projects shipped at 4.9★" is a signal; "We value quality" is not.
5. **No banned phrases?**

Show the employer the full payload as JSON.

**Then ask, verbatim: "Post this listing? (yes / edit / cancel)" and wait for their reply.**

- "yes" → POST.
- "edit" or any change → fix, re-show, ask again.
- "cancel" or silence → STOP. Save payload locally as `tickets-listing-<company>-<slug>.json`.

Do not POST without an explicit yes on this turn. A previous yes earlier in the conversation does not count.

## Submit

```bash
curl -X POST https://tickets-backend-three.vercel.app/api/listings \
  -H "Authorization: Bearer $TICKETS_AUTHOR_TOKEN" \
  -H "Content-Type: application/json" \
  -d @payload.json
```

Returns `{ ok: true, id, status, review, url }`.

- `status` is the listing's current status. For first-time posters it may be `pending_review` if the agent escalated.
- `review` is `{ verdict: "approved" | "rejected", reason }` for first-time posters, otherwise `null`.
- `url` is the live GitHub URL when `status` is `open` or `filled`; otherwise `null`.

If the agent rejects a first-time post, the Tickets team is automatically emailed at `accounts@workflow.design` with the listing and the agent's reason — they'll follow up directly.

## Close

Tell the employer:

- If first-time and `review.verdict === "approved"`: live at the returned `url` (if status is open).
- If first-time and `review.verdict === "rejected"`: in the manual-review queue. The Tickets team has been emailed with the agent's reason and will follow up within one business day. The returned `url` will 404 until then. Share the reason with the employer so they can fix obvious issues (missing rate, vague scope, etc.) and resubmit.
- If a returning company: the listing is live at the returned `url` (if open).
- To update fields later: run this skill again with the same `company.slug` + role `slug` — POST is upsert.
- To pause/close: run again with `status: paused` or `status: closed`. The markdown file is removed from the public repo automatically.
- New applications land in the Tickets Linear board they already manage.

## Edge cases

- **Token rejected (401):** wrong or revoked. Tell them to re-paste, or email maintainers for a fresh one.
- **Validation error (400):** response message names the missing field. Fix and resubmit.
- **Backend error (500):** show the error, retry once, then save the JSON locally and email the maintainers.
- **Employer wants a custom apply pipeline (not Linear):** out of scope for v1. Note in `body_md` that applications still flow through `tickets-apply` → Linear; custom pipelines are a follow-up.
