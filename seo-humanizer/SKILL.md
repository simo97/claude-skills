---
name: seo-humanizer
description: Rewrites AI-generated or SEO-optimized content to sound genuinely human, stripping detectable AI patterns identified by Wikipedia's WikiProject AI Cleanup guide. Use when user wants to humanize text, remove AI writing signs, make content sound less robotic, avoid AI detection, or polish SEO copy to read naturally.
---

# SEO Humanizer

Transforms AI-generated or over-optimized content into natural, human-sounding writing by systematically removing all known AI writing patterns.

## Quick Start

Paste the text to humanize. The skill will:
1. Diagnose which AI patterns are present
2. Rewrite to eliminate them
3. Return the humanized version with a brief change log

## Workflow

### Step 1 — Diagnose

Scan the text for patterns from the [AI Writing Patterns Reference](REFERENCE.md). Flag each category found:

- [ ] AI vocabulary ("delve", "tapestry", "underscore", "foster", "pivotal"…)
- [ ] Structural tells (rule of threes, false ranges, compulsive summaries)
- [ ] Transition overuse ("Furthermore", "Additionally", "In conclusion"…)
- [ ] Promotional inflation ("stands as a testament to", "rich cultural heritage"…)
- [ ] Formatting overkill (excessive bold, bullet everything, emoji headers)
- [ ] Em dash overuse or corrective antithesis ("Not X. But Y.")
- [ ] Gift-wrapped endings (summary + "moving forward" / "going forward")
- [ ] Hedge clusters ("might", "could", "perhaps", "generally" stacked)
- [ ] Faux-conversational openers ("Let's dive in", "In today's fast-paced world…")
- [ ] Passive voice dominance
- [ ] Perfect parallelism / cookie-cutter paragraph lengths

### Step 2 — Rewrite Rules

Apply these fixes during rewriting:

**Vocabulary**
- Replace flagged AI words with plain, specific alternatives
- Prefer concrete verbs over abstract ones ("shows" not "underscores")
- Cut qualifiers that add nothing ("very", "quite", "essentially")

**Structure**
- Break the rule of threes — use 2 or 4+ items instead
- Replace "Not X. But Y." with a direct statement
- Vary paragraph length deliberately — short, long, short is fine
- Delete compulsive summaries unless the piece is long-form

**Tone**
- Remove all promotional language unless it's ad copy
- Drop tourism-brochure adjectives ("breathtaking", "nestled within")
- Replace passive voice with active where it sounds natural
- Kill the gift-wrapped ending — stop before the recap

**Flow**
- Cut faux-conversational pivots ("But here's the thing…")
- Replace formulaic transitions with contextual ones or none at all
- Allow one-sentence paragraphs and natural fragments where appropriate
- Vary sentence rhythm: mix short punchy sentences with longer ones

**SEO Specifics**
- Keep target keywords but weave them in naturally — never keyword-stack
- Replace keyword-stuffed headers with questions or statements people actually say
- Rewrite meta descriptions to sound like a human wrote a tweet, not a tag

### Step 3 — Deliver

Return:
1. **Humanized text** (clean, no markup unless original had it)
2. **Change log** — 3-5 bullet points naming what was removed and why

## Tips

- For long texts, process section by section and confirm tone before continuing
- If the user wants a specific voice (casual, authoritative, witty), ask before rewriting
- Do not add new content — only transform what exists
- When in doubt, remove rather than replace: shorter is more human

## Reference

Full pattern lists, vocabulary blacklists, and structural anti-patterns:
→ [REFERENCE.md](REFERENCE.md)
