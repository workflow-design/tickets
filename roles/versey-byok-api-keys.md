# Ship Bring-Your-Own API Keys for the Versey App

**Company:** [Versey](../companies/versey.md)

**Type:** Engineering — Backend Engineering (light frontend)

**Rate:** $150–250/hr (L4 → L5 band)

**Stack:** apps/web — Next.js 16 API routes, React 19, Tailwind 4, Supabase (auth + DB), AI SDK + provider SDKs (Anthropic, OpenAI, Google Gemini, Perplexity already wired in)

**Status:** Open

---

## What you'd build

A bring-your-own-keys feature in the Versey app: users can paste in their own API keys for the providers Versey already integrates (**Anthropic, OpenAI, Google Gemini, Perplexity** — see `@ai-sdk/*` and provider SDKs in `apps/web`), the app validates them, stores them securely, and routes the user's traffic through their keys instead of Versey's. Mostly backend (Next 16 API routes); a small settings UI surface in the existing app.

## The hard part

The hard part: key validation, rotation, and not leaking keys in logs, error messages, telemetry, or stack traces. The threat model isn't a malicious user — it's an honest mistake (`console.log(key)`, an exception bubbling up unmasked, a stale key cached after rotation) that turns a customer's bill into your incident. Plus the small UX wrinkle of telling someone *why* their key is invalid without echoing the key back.

## What's in it for you

- A self-contained backend feature with crisp acceptance criteria.
- Clean greenfield work — no legacy auth to retrofit. _TODO confirm._
- _TODO — anything else?_

## What we're looking for

- Has shipped at least one production secrets/credentials flow. Can name the specific decisions they made (where stored, how scoped, how rotated, how validated).
- Comfortable with _TODO — backend stack: Node/TypeScript? Python? Go? — confirm._
- Strong instinct for what *not* to log.

## First ticket

_TODO — first deliverable. (e.g. "Validation + storage for Anthropic + OpenAI keys, with a runbook for rotation, deployed behind a feature flag.")_

## How to apply

All roles on Tickets use the universal `tickets-apply` skill. Standard install:

```bash
mkdir -p ~/.claude/skills/tickets-apply
curl -fsSL https://raw.githubusercontent.com/workflow-design/tickets/main/skills/tickets-apply/SKILL.md \
  -o ~/.claude/skills/tickets-apply/SKILL.md
```

Then in Claude:

```
Apply to versey-byok-api-keys on Tickets
```
