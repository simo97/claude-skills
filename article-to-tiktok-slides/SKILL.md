---
name: article-to-tiktok-slides
description: Transform articles into engaging TikTok slide sequences. Analyzes key points and creates platform-optimized slides with customizable language, slide count, CTA, goals, and tone. Outputs organized by topic with title, summary, and individual slide content.
---

# Article to TikTok Slides Skill

## Overview

This Skill transforms a long-form article into a series of engaging TikTok slides optimized for short-form video content. Each key point becomes a topic cluster with multiple slides. If the user hasn't provided all required parameters upfront, Claude must **collect them interactively before generating output**.

## Step 0 — Collect Required Inputs (Always Run First)

Before doing anything else, check if the user has provided:

1. **The article** (full text or URL)
2. **Language** (English, Spanish, French, German, Portuguese, etc.)
3. **Number of slides** (total expected slides, e.g., 15, 20, 30)
4. **CTA** (Call To Action — "Visit website", "Subscribe", "Download", "Buy now", "Learn more", etc.)
5. **Goals** (Convert / Inform / Lead Generation / Build Intent / Entertain / Educate / Other)
6. **Tone** (Entertaining / Professional / Educational / Motivational / Casual / Witty / Inspirational)
7. **Special instructions** (Optional — any particular style, format, or additional requirements)

If any of these are missing, ask for them **all at once** using a structured message like:

---
> To create your TikTok slide deck, I need a few details:
>
> 1. **Article** — Paste the full text or share a URL
> 2. **Language** — English / Spanish / French / German / Portuguese / Other
> 3. **Number of slides** — How many slides total? (e.g., 15, 20, 30)
> 4. **CTA** — What's the call-to-action? (e.g., "Visit our website", "Subscribe now", "Buy now")
> 5. **Goals** — What's the primary goal? (Convert / Inform / Lead Generation / Build Intent / Entertain / Educate / Other)
> 6. **Tone** — What tone? (Entertaining / Professional / Educational / Motivational / Casual / Witty / Inspirational)
> 7. **Special instructions** — Any particular style, format, or requirements? (Optional)
>
> You can answer all in one message!

---

Do **not** generate any slides until all required inputs are confirmed.

If the user provides partial info, ask only for what's still missing.

---

## Instructions

### 1. Parse Input
- Read and analyze the article thoroughly
- Identify the core thesis and main arguments
- Extract key points, statistics, examples, and actionable insights
- Determine audience level and information density
- Note any compelling quotes or data points

### 2. Identify Key Points
- Group related concepts together
- Typically 3–6 major topics, depending on article length
- Each key point should be substantial enough for 2–4 slides
- Rank by importance and engagement potential

### 3. Structure Slides Per Key Point
- **Slide 1 (Opener):** Hook — a compelling question, stat, or statement
- **Slides 2-N (Body):** Detailed explanations, examples, supporting evidence
- **Final Slide (Closer):** Summary, insight, or transition to CTA

### 4. Adjust for Tone & Goals

**Tone Guidance:**
- **Entertaining** — Use humor, unexpected angles, relatable scenarios
- **Professional** — Maintain credibility, data-backed, formal language
- **Educational** — Clear structure, definitions, step-by-step explanations
- **Motivational** — Inspirational language, call to action, empowerment focus
- **Casual** — Conversational, direct address (you/your), informal language
- **Witty** — Clever observations, wordplay, smart commentary
- **Inspirational** — Uplifting narratives, personal growth, aspirational messaging

**Goals Guidance:**
- **Convert** — Emphasize benefits, urgency, risk reduction, specific outcomes
- **Inform** — Clear facts, explanations, context, educational value
- **Lead Generation** — Build curiosity, offer value, CTA to capture interest
- **Build Intent** — Social proof, use cases, comparisons to alternatives
- **Entertain** — Humor, surprising facts, engaging narratives
- **Educate** — Step-by-step instruction, concepts, frameworks
- **Other** — Align with user's specified objective

### 5. Optimize for TikTok Format
- **Slide length:** 2–4 lines per slide (TikTok scrolling/swiping)
- **Readability:** Short sentences, clear hierarchy
- **Visual cues:** Suggest visual elements in brackets [e.g., *animated arrow*, *graph*, *quote callout*]
- **Pacing:** Balance text-heavy and visual slides
- **Engagement:** Include questions, surprising stats, relatable scenarios

### 6. Apply Language
- Translate/write all content in the specified language
- Maintain tone and messaging consistency across all slides
- Adapt idioms and cultural references appropriately

### 7. Calculate Slide Distribution
- Total slides requested ÷ number of key points = slides per key point (roughly)
- Allocate extra slides to high-impact sections
- Reserve final slides for CTA and call-to-action

### 8. Format Output

Structure output **exactly** as requested:

```
Key point 1: <Title>
summary: <One-sentence summary of this key point>

Slide 1: <Content>
Slide 2: <Content>
Slide 3: <Content>
...

Key point 2: <Title>
summary: <One-sentence summary of this key point>

Slide 1: <Content>
Slide 2: <Content>
...
```

---

## When to Use

Trigger this skill when the user asks to:
- "Create TikTok slides from this article"
- "Convert this article into TikTok slides"
- "Turn this into a TikTok slide deck"
- "Make TikTok content from this article"

Even if parameters aren't fully specified, **activate this skill and collect inputs via Step 0**.

---

## Output Example

```
Key point 1: Why Remote Work Matters
summary: Remote work increases productivity while improving work-life balance.

Slide 1: 💻 Remote work isn't just a trend—it's the future of productivity.
Slide 2: 📊 Studies show remote workers are 35% more productive than office workers.
Slide 3: 🏠 Why? Fewer distractions + personalized workspace = better focus.
Slide 4: ⏰ Plus, you save 2 hours daily on commuting. What would you do with that time?

Key point 2: Challenges Companies Face
summary: Adoption requires overcoming communication, culture, and management barriers.

Slide 1: 🚨 But here's the catch: 63% of remote initiatives fail.
Slide 2: 💬 The biggest challenge? Poor communication across teams.
Slide 3: 🤝 Without in-person touchpoints, culture suffers.
Slide 4: 👨‍💼 Managers struggle with trust and performance metrics.

Key point 3: How to Make Remote Work
summary: Success requires clear tools, processes, and culture-building.

Slide 1: ✅ The solution: intentional systems.
Slide 2: 🛠️ Invest in communication tools (Slack, Zoom, Asana).
Slide 3: 📋 Document everything. Clear processes = clarity.
Slide 4: 🎯 Regular 1:1s and virtual team events build connection.
Slide 5: Ready to transform your workplace? [LINK in bio] #RemoteWork
```

---

## Tips for Success

1. **Hook first:** The first slide of each key point must grab attention.
2. **Data wins:** Back claims with stats, studies, or real examples.
3. **Questions engage:** Rhetorical questions make viewers pause and think.
4. **Visual hints:** Even text-based, suggest where visuals/animations could enhance.
5. **CTA consistency:** Reinforce the call-to-action across final slides.
6. **Emoji strategically:** Use sparingly—one per slide max—to enhance, not clutter.
