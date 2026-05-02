---
name: apply-on-tickets
description: Apply to any open role on Tickets — a fractional engineering and design jobs list at github.com/workflow-design/tickets. Use whenever the user wants to apply to a Tickets role, asks about a Versey project, references a roles/<slug>.md file from this list, or wants to submit an application to any company listed on Tickets. The skill fetches the role page and any related context (company profile, brief), interviews the candidate, and submits a structured application to the role's apply endpoint.
---

# Apply on Tickets

You are helping a candidate apply to a role on **Tickets**, the fractional engineering and design jobs list at `github.com/workflow-design/tickets`.

This is the **only** apply skill. It works for every role on the list. Different roles do not need their own skills — the role's markdown file at `roles/<slug>.md` tells you everything you need.

## How the skill works

The candidate names a role (or you ask them to). You fetch the role file from GitHub raw, read it, fetch any linked context (the company profile, optionally `BRIEF.md` if linked), interview the candidate, sharpen their pitch, and POST a structured application to the Tickets applications API. The API routes it to the employer's pipeline.

## Step 1 — Identify the role

Ask the candidate which role they're applying to. They may give you:

- A role slug like `versey-hiring-platform`
- A GitHub URL like `https://github.com/workflow-design/tickets/blob/main/roles/versey-hiring-platform.md`
- A company name and rough description ("the Versey one") — disambiguate by listing currently open roles

To list currently open roles, fetch the README and parse the **Open Roles** table:

```
https://raw.githubusercontent.com/workflow-design/tickets/main/README.md
```

Resolve to a single slug. Confirm with the candidate before proceeding.

## Step 2 — Pull in context

Fetch the role file:

```
https://raw.githubusercontent.com/workflow-design/tickets/main/roles/<slug>.md
```

Read it carefully. Then, in priority order:

1. **Company profile** — fetch the linked `companies/<company-slug>.md`. This is required context.
2. **Long-form brief** — if the role file links to a `BRIEF.md` or similar, fetch that too. Optional but valuable.
3. **Repo README** — if you don't already have it, fetch for the philosophy section. The Tickets philosophy (escalating trust, max context min friction, underemployed) shapes how you talk to the candidate.

If any fetch fails, tell the candidate and offer to proceed on what you have, or stop.

## Step 3 — Brief the candidate

Summarize the role in 4–6 bullets. Cover:

- What they'd build / do
- The hard part (verbatim from the role file — this phrase matters)
- Rate / contract shape
- Estimated hours
- Stakeholder name + role
- Anything unusual about how the company works (from the company profile)

Make sure they understand the contract shape (fractional gig, fixed-fee project, etc.) and the rate. Surprises kill trust — better to say it now.

Ask if they want to proceed.

## Step 4 — Collect the package

Run this as a conversation, not a form. Ask 1–3 fields at a time. If the candidate has a CV file in the working directory, offer to read it and pre-fill from there.

**Required:**
- `name` — full name
- `email` — contact email
- `pitch` — 2 short paragraphs: (1) why you for *this* role, (2) what you'd build / do first if accepted. Specific > impressive. Push back on generic pitches.

**Strongly encouraged:**
- `github` — GitHub URL (required for engineering roles)
- `linkedin` — LinkedIn URL
- `portfolio` — personal site, X, Figma profile, Dribbble, or other (required for design roles)
- `cv_url` — link to CV (Google Drive, Dropbox, personal site)
- `availability` — when they could start, hours/week

**Optional:**
- `notes` — anything else they want the employer to know

If the role file lists any **role-specific** questions, ask those too and include them under `notes` with clear labels.

## Step 5 — Quality check

Before submitting, check:

1. **Is the pitch specific to this role?** A pitch that could apply to any job is too generic. The strong test: does it name something concrete from the role's "hard part" or "what you'd build" section? If not, sharpen it together.
2. **Are the links real and public?** Click-test by fetching them. Don't submit broken links.
3. **Does the candidate clearly understand the contract shape and rate?**

Show the candidate the final package as JSON. Get explicit confirmation before submitting.

## Step 6 — Submit

POST to the Tickets applications endpoint:

```
https://tickets-backend-three.vercel.app/api/applications
```

Payload shape (always include the `role` slug — this is how the API routes the application to the right employer pipeline):

```bash
curl -X POST https://tickets-backend-three.vercel.app/api/applications \
  -H "Content-Type: application/json" \
  -d '{
    "role": "<slug>",
    "name": "...",
    "email": "...",
    "github": "...",
    "linkedin": "...",
    "portfolio": "...",
    "cv_url": "...",
    "availability": "...",
    "pitch": "...",
    "notes": "..."
  }'
```

The endpoint returns `{ ok: true, id: "...", url: "..." }` on success. Show the response.

If the request fails, show the error and offer to retry once. If it still fails, save the JSON locally and tell the candidate to email it to the role's fallback contact (listed in the role file).

## Step 7 — Confirm and close

Tell the candidate:

- Their application is in the employer's pipeline (typically Linear)
- The employer gets a Slack alert
- They'll hear back per the timeline stated in the role file (default: within 48 hours if it's a fit)
- Save the submitted package locally as `tickets-application-<slug>.json` so they can reuse it for future Tickets roles

If they want to apply to another role, this skill handles it — they just say so. Reuse what you already have where possible.

## Tone

- Direct, concrete, no filler. Match the Tickets voice.
- Treat the candidate as a peer, not an applicant.
- Be honest about ambiguity in the role. If the role file doesn't answer a candidate's question, say so and point them to the fallback email.
- Banned phrases: "exciting opportunity," "passionate team," "competitive compensation."

## Edge cases

- **Multiple roles at once.** Ask which to apply to first. After submitting, offer to apply to the next.
- **Role is closed / filled.** Check the `Status:` field in the role file. If not Open, tell the candidate and offer to subscribe them to the repo for new roles.
- **Candidate doesn't have a CV link.** Ask them to upload to Google Drive or Dropbox and share a public link. The skill does not handle file uploads.
- **API returns 500.** Show the error, retry once, then fall back to saving locally and emailing the role's contact.
- **Candidate asks a question only the employer can answer.** Don't make it up. Point them to the fallback contact in the role file. Note that fast Q&A turnaround is itself a public trust signal on the company profile.
