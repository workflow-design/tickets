---
name: tickets-profile
description: Manage the local Tickets profile — name, email, disciplines, stack, links, availability — stored at ~/.claude/skills/tickets-profile/profile.json. Used by tickets-list to filter to matching roles, by tickets-apply to pre-fill applications, and by tickets-subscribe to pre-fill alerts. Use when the user wants to set up, view, edit, or clear their Tickets profile, or asks "what's in my profile".
---

# Tickets profile

You manage the candidate's local Tickets profile. The file is a single JSON document at:

```
~/.claude/skills/tickets-profile/profile.json
```

It is local-only — never POSTed anywhere by this skill. Other Tickets skills read it to filter listings and pre-fill forms. Treat it as the candidate's personal record.

## Schema (v1)

```jsonc
{
  "schema_version": 1,
  "name": "string",                       // full name
  "email": "string",                      // contact email
  "disciplines": ["engineering"],         // any of: engineering | design | product | founding-operator
  "stack": "TypeScript, React, Astro",    // freeform comma-separated string (matches subscriptions API shape)
  "github": "https://github.com/...",     // optional
  "linkedin": "https://linkedin.com/...", // optional
  "portfolio": "https://...",             // optional (personal site, X, Figma, Dribbble, etc.)
  "cv_url": "https://...",                // optional public link to CV (Drive/Dropbox/site)
  "min_rate": "$150/hr",                  // optional
  "availability": "Now, ~15 hrs/wk",      // optional
  "current_title": "EM at scaleup",       // optional one-liner about current role
  "skip_companies": [],                   // optional company_slugs to hide from tickets-list
  "applied_roles": [                      // appended by tickets-apply on success
    { "slug": "versey-alerts-smoke-test", "applied_at": "2026-05-02T...", "application_id": "..." }
  ]
}
```

`name`, `email`, and `disciplines` are the minimum useful set. Everything else is opportunistic.

## Commands (via skill args)

- (no args) → if file missing, **interview** to create it; if present, show it and offer to edit.
- `show` → print the JSON contents (no prompts).
- `set <field>=<value>` → patch a single field. For arrays, accept comma-separated (`set disciplines=engineering,design`).
- `clear` → delete the file. Confirm first ("This wipes your local profile, including apply history. Type 'yes' to confirm.").
- `add-applied <slug> <application_id>` → append to `applied_roles` (used internally by `tickets-apply`).

## Step 1 — File handling

Always read/write at the absolute path above. Create the parent directory if needed (it should already exist since the skill itself lives there). Use atomic write: write to `profile.json.tmp` then rename, so a crashed write doesn't corrupt the file.

If the file exists but doesn't parse: tell the user, show the bad contents, and ask whether to start over or edit by hand.

If `schema_version` is missing or older than current, fill it in. Future migrations live here.

## Step 2 — Interview (first run)

Ask in 2–3 messages, not a form. Tone matches Tickets: terse, peer-level, no filler.

Required:
- name
- email
- disciplines (multi-select from engineering / design / product / founding-operator)

Strongly encouraged (in one batch):
- stack (freeform — tell them to be specific, "frontend" alone is too vague)
- github / linkedin / portfolio (any one)
- availability

Optional (offer once, don't push):
- cv_url, min_rate, current_title, skip_companies

Show the assembled JSON before writing. Ask verbatim: **"Save this profile? (yes / edit / cancel)"**. Wait for explicit yes.

## Step 3 — Show

Print the JSON in a fenced code block. Beneath it, a one-line "stored at: ~/.claude/skills/tickets-profile/profile.json" footer.

## Step 4 — Set

`set <field>=<value>` patches one field, validates the shape, writes, and confirms. Reject unknown fields with a list of valid ones.

For `disciplines` and `skip_companies`, comma-separated input becomes an array.

## Step 5 — Clear

Delete the file after explicit confirmation. Mention that apply history is local-only and cannot be recovered.

## Tone

- Direct, terse, peer-level. Match Tickets voice.
- Banned phrases: "exciting opportunity," "let's get you set up," "great to have you."
- Keep the interview short. Three messages max from start to written file.

## Edge cases

- **File exists but the user said "create profile":** show what's there, ask if they want to overwrite.
- **User pastes a CV link or LinkedIn URL during the interview:** offer to fetch it and pre-fill `stack`, `current_title`, and links.
- **User wants to share the profile across machines:** tell them to copy the JSON file. Server-side sync is not part of v1.
- **Invoked from inside another skill (e.g. tickets-apply needs to record an apply):** silently use the `add-applied` subcommand. No interview.
