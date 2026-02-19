---
name: article-to-social-post-optimizer
description: Transform long articles into social media posts optimized for specific platforms and tones. Use when the user wants to create a social post from an article, even if they haven't specified a platform or tone yet — the skill will collect missing info interactively.
---

# Article to Social Post Optimizer Skill

## Overview

This Skill transforms an article into a platform-optimized social media post. If the user hasn't provided the article, platform, or tone upfront, Claude must **collect them interactively before generating output**.

## Step 0 — Collect Required Inputs (Always Run First)

Before doing anything else, check if the user has provided:

1. **The article** (full text or URL)
2. **Target platform** (LinkedIn, X, Instagram, Facebook, Threads, Newsletter)
3. **Tone** (Institutional, Academic, Marketing Direct, Conversational, Technical)

If any of these are missing, ask for them **all at once** using a structured message like:

---
> To create your social post, I need a few details:
>
> 1. **Article** — Paste the full text or share a URL
> 2. **Platform** — LinkedIn / X / Instagram / Facebook / Threads / Newsletter
> 3. **Tone** — Institutional / Academic / Marketing Direct / Conversational / Technical
>
> You can answer all three in one message!
---

Do **not** generate any post until all three inputs are confirmed.

If the user provides partial info (e.g., only the article), ask only for what's still missing — don't re-ask for things already provided.

---

## Instructions

### 1. Parse Input
- Identify the core topic and thesis of the article.
- Extract key points, subheadings, and actionable insights.
- Determine the intended audience and complexity level.

### 2. Determine Output Structure Based on Platform

- **LinkedIn** — Strong hook (1–2 lines), short paragraphs, optional bullets, CTA at end.
- **X (Twitter)** — Thread of 5–10 tweets, one idea per tweet, hook on tweet 1, CTA on last tweet.
- **Instagram** — Short lines, emotional resonance, line breaks for readability, optional hashtags.
- **Facebook** — Narrative format, engaging opening, balance info and readability.
- **Threads** — Conversational tone, numbered steps or bullet fragments.
- **Newsletter** — Slightly longer, section headings, summary, CTA.

### 3. Adjust for Tone

- **Institutional** — Neutral, professional, evidence-backed.
- **Academic** — Formal terminology, methodology/framework references.
- **Marketing Direct** — Problem → Solution → CTA, benefits-focused, urgent.
- **Conversational** — Direct address (you/your), rhetorical questions, light sentences.
- **Technical** — Preserve accuracy, include terms and definitions.

### 4. Craft Hook
Tailor to platform norms: shock stat, question, bold claim, or relatable problem.

### 5. Summarize Key Points
Select 3–5 core insights, formatted for the target platform.

### 6. Include CTA
End with a relevant prompt: "Read more", "Comment below", "Share if…", link, etc.

### 7. Format Final Post
Match spacing, length, and punctuation to platform expectations. Paraphrase — don't copy verbatim. Add hashtags only if requested or appropriate.

---

## When to Use

Trigger this skill when the user asks to:
- "create a social media post from an article"
- "adapt this article for LinkedIn / Instagram / X / etc."
- "rewrite this as a short post"
- "turn this into a thread"

Even if no platform or tone is specified yet, **activate this skill and collect inputs via Step 0**.
