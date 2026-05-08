---
name: tickets-manage
description: Manage existing roles on Tickets — list, edit, pause, close, or reopen — using the per-company manage token. Use whenever an employer wants to update an existing listing, pause/close a role, reopen one, or just see what they currently have live. Posting a brand-new role is handled by tickets-post.
---

# Manage Tickets listings

You are helping an employer manage roles they've already posted on **Tickets**. This is the right skill when they say things like "pause my role", "close the X listing", "edit the rate", "reopen", or "what's still open under <company>". For posting a fresh role, hand off to `tickets-post`.

Every action requires the per-company manage token (`tckts_…`). It was emailed to the company `contact_email` on the very first listing post under that company.

## Resolve the token

In order:

1. `$TICKETS_MANAGE_TOKEN` env var.
2. `~/.tickets-manage-token` — a `slug=token` map, one per line. Look up the entry for the company slug.
3. Ask the employer to paste it from the original confirmation email. Offer to append to `~/.tickets-manage-token` (chmod 600) for next time.

If they've lost it:

```bash
curl -sS -X POST https://app.tckts.work/api/companies/recover \
  -H "Content-Type: application/json" \
  -d '{"slug":"<company-slug>"}'
```

A fresh token is emailed to the company `contact_email`. The previous token is invalidated. Rate-limited to one rotation per 5 minutes.

## List the company's roles

Always start here unless the employer already named the exact slug. The token alone identifies the company — no slug needed in the URL:

```bash
curl -sS https://app.tckts.work/api/companies/listings \
  -H "Authorization: Bearer $TOKEN"
```

Response:

```json
{
  "ok": true,
  "company": { "slug": "...", "name": "..." },
  "listings": [
    { "id": "...", "slug": "...", "role_slug": "...", "title": "...", "status": "open", "rate": "...", "summary": "...", "updated_at": "..." }
  ]
}
```

Show the employer a compact table — title, status, rate, last updated — and ask which one they want to act on.

## Edit a field

Re-POST to `/api/listings` with the **same** `company.slug` + role `slug`. POST is upsert; only the fields you include get written, but the backend wants the full payload, so fetch the current listing first:

```bash
curl -sS 'https://app.tckts.work/api/listings?status=<current_status>' \
  | jq '.listings[] | select(.role_slug=="<company>-<slug>")'
```

(Listings only appear in the public GET when they're `open` or whatever status you query for. For non-open statuses, fetch via `/api/companies/listings` above and use those fields directly.)

Then POST with the merged payload:

```bash
curl -sS -X POST https://app.tckts.work/api/listings \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TOKEN" \
  -d @payload.json
```

Show the employer the diff before submitting. Ask "Save these changes? (yes / cancel)" and wait for an explicit yes.

## Pause, close, or reopen

Same endpoint, just change `status`:

- `status: paused` → role hidden from the public repo and listing index. No new applications.
- `status: closed` → permanent. Same effect as paused for visibility, but signals the search is over.
- `status: open` → reopen a paused or closed role.
- `status: filled` → role found a hire. Visibility same as open.

Pausing or closing removes the markdown file from the public `workflow-design/tickets` repo automatically. Reopening puts it back.

You still need the full payload (title, discipline, body_md, etc.) — fetch from `/api/companies/listings` first, change `status`, POST.

## Close

After a successful change, tell the employer:

- **What changed** — confirm the new state ("`<title>` is now paused, no longer in the public repo").
- **What it means** — for pause/close: candidates can't apply. For edit: changes are live; subscribers won't be re-alerted.
- **Reverse** — "Tell me when you want to reopen / edit again" so they know it's reversible.

## Edge cases

- **Unauthorized (401):** missing or wrong token. Run the recovery curl, have them paste the new token from their email, and try again.
- **Listing not found:** the employer named a slug that doesn't exist under this company. Re-run the list step and show options.
- **Backend error (500):** show the error, retry once, then save the payload locally and email the maintainers.
- **Employer wants to change `contact_email`:** the manage token deliberately can't do this — it would let a stolen token redirect application notifications. Tell them to email maintainers; for now this is a manual change.
