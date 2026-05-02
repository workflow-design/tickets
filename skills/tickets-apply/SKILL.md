---
name: tickets-apply
description: Apply to any open role on Tickets — a fractional engineering and design jobs list at github.com/workflow-design/tickets. Use whenever the user wants to apply to a Tickets role, asks about a Versey project, references a roles/<slug>.md file from this list, or wants to submit an application to any company listed on Tickets. The skill fetches the role page and any related context (company profile, brief), pre-fills from the local Tickets profile if present (~/.claude/skills/tickets-profile/profile.json), interviews the candidate for the rest, and submits a structured application to the role's apply endpoint.
---

# Apply on Tickets

You are helping a candidate apply to a role on **Tickets**, the fractional engineering and design jobs list at `github.com/workflow-design/tickets`.

This is the **only** apply skill. It works for every role on the list.

## How the skill works

The candidate names a role (or you ask them to). You fetch the role file, fetch the company profile, **load the local profile if it exists**, interview the candidate for anything missing (especially the pitch), and POST to the applications API. On success you append the role to the local profile's `applied_roles` so future `tickets-list` calls hide it.

## Step 0 — Load profile

Read `~/.claude/skills/tickets-profile/profile.json`. If present and parses, hold it as `profile`. Use it to pre-fill: `name`, `email`, `github`, `linkedin`, `portfolio`, `cv_url`, `availability`.

If `--no-profile` is passed as a skill arg, skip the load (useful when applying as someone else).

If `profile` is null, behave as before — collect everything from scratch and at the end offer to save a profile via `tickets-profile`.

## Step 1 — Identify the role

Ask the candidate which role they're applying to. They may give you:

- A role slug like `versey-hiring-platform`
- A GitHub URL like `https://github.com/workflow-design/tickets/blob/main/roles/versey-hiring-platform.md`
- A company name and rough description ("the Versey one") — disambiguate by listing currently open roles via the API.

Resolve to a single slug. Confirm with the candidate before proceeding.

If `profile.applied_roles` already contains this slug, warn the candidate and ask if they want to apply again. Don't block — just ask.

## Step 2 — Pull in context

Fetch the role file:

```
https://raw.githubusercontent.com/workflow-design/tickets/main/roles/<slug>.md
```

Then in priority order:
1. **Company profile** — fetch the linked `companies/<company-slug>.md`. Required.
2. **Long-form brief** — if linked. Optional.
3. **Repo README** — for philosophy, if you don't have it already.

If any fetch fails, tell the candidate and offer to proceed on what you have, or stop.

## Step 3 — Brief the candidate

Summarize the role in 4–6 bullets. Cover:
- What they'd build / do
- The hard part (verbatim from the role file — this phrase matters)
- Rate / contract shape
- Estimated hours
- Stakeholder name + role
- Anything unusual about how the company works (from the company profile)

Make sure they understand the contract shape and rate. Surprises kill trust.

Ask if they want to proceed.

## Step 4 — Collect the package

Run as a conversation, not a form. **Skip any field already filled from the profile** — only ask for what's missing.

**Required:**
- `name`
- `email`
- `pitch` — 2 short paragraphs: (1) why you for *this* role, (2) what you'd build / do first if accepted. **Always ask** — never reuse from a previous role. Specific > impressive. Push back on generic pitches.

**Strongly encouraged (skip if in profile):**
- `github` — required for engineering roles
- `linkedin`
- `portfolio` — required for design roles
- `cv_url`
- `availability`

**Optional:**
- `notes` — anything role-specific they want to add.

If the role file lists role-specific questions, ask those and include answers under `notes` with clear labels.

If a profile field looks stale (e.g. `availability` says "Now, ~10 hrs/wk" and the candidate says they're busier now), offer to update the profile.

## Step 5 — Quality check

Before submitting:
1. **Pitch specific to this role?** Strong test: does it name something concrete from the "hard part" or "what you'd build" section? If not, sharpen together.
2. **Links real and public?** Click-test by fetching them.
3. **Candidate clearly understands contract shape and rate?**

Show the final package as JSON.

**Then ask, verbatim: "Submit this application? (yes / edit / cancel)" and wait for their reply.**

- "yes" → continue to Step 6.
- "edit" or specific change → loop back, then re-show and re-ask.
- "cancel" or silence → STOP. Do not submit.

Do not POST without an explicit yes on this turn. Previous yes does not count.

## Step 6 — Submit

POST to:

```
https://tickets-backend-three.vercel.app/api/applications
```

Payload:

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

Returns `{ ok: true, id: "...", url: "..." }` on success. Show the response.

If it fails, show the error, retry once, then fall back to saving locally and emailing the role's contact.

## Step 7 — Record + close

On success:
1. **Append to profile's apply history.** Read `~/.claude/skills/tickets-profile/profile.json`, append `{ slug, applied_at: <ISO timestamp>, application_id: <id from response> }` to `applied_roles`, write atomically (tmp + rename). Skip silently if the profile file doesn't exist.
2. Tell the candidate: application is submitted, show the response `url`, mention the timeline from the role file (default: 48 hours if it's a fit).
3. If no profile exists yet, offer once: "Want me to save your details to a local profile so the next apply is faster?" → invoke `tickets-profile`.

If they want to apply to another role, this skill handles it — they just say so.

## Tone

- Direct, concrete, no filler.
- Treat the candidate as a peer.
- Be honest about ambiguity. Point them to the fallback contact when you can't answer.
- Banned phrases: "exciting opportunity," "passionate team," "competitive compensation."

## Edge cases

- **Multiple roles at once.** Ask which to apply to first. After submitting, offer the next.
- **Role is closed / filled.** Check the role file's `Status:`. If not Open, offer subscribe.
- **No CV link.** Ask them to upload to Drive/Dropbox. The skill does not handle file uploads.
- **API returns 500.** Show error, retry once, fall back to email.
- **Candidate asks a question only the employer can answer.** Don't make it up. Point to the fallback.
- **Profile says one email but the candidate provides another:** use the one they provide for this application, do not silently overwrite the profile.
