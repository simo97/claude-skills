# Claude Skills Repository

A collection of custom Claude Code skills for content creation and optimization.

## Available Skills

### article-to-tiktok-slides
Transform articles into engaging TikTok slide sequences. Analyzes key points and creates platform-optimized slides with customizable language, slide count, CTA, goals, and tone.

**Features:**
- Automatically identifies key points from articles
- Generates multiple slides per topic
- Customizable language (any language)
- Adjustable slide count and pacing
- Multiple goal types: Convert, Inform, Lead Generation, Build Intent, Entertain, Educate
- Tone options: Entertaining, Professional, Educational, Motivational, Casual, Witty, Inspirational
- Structured output organized by key points with summaries

**Usage:** See `article-to-tiktok-slides/SKILL.md` for detailed instructions.

### article-to-social-post-optimizer
Transform long articles into social media posts optimized for specific platforms and tones.

**Supported platforms:**
- LinkedIn
- X (Twitter)
- Instagram
- Facebook
- Threads
- Newsletter

**Usage:** See `article-to-social-post-optimizer/SKILL.md` for detailed instructions.

---

## Installation

### Quick Install Single Skill

```bash
./install-skill.sh article-to-tiktok-slides
```

### Install All Skills

```bash
for skill in */; do
  skill_name="${skill%/}"
  if [ "$skill_name" != ".git" ]; then
    ./install-skill.sh "$skill_name"
  fi
done
```

### Manual Installation

Copy any skill directory to your Claude Code skills directory:

```bash
cp -r article-to-tiktok-slides ~/.claude/skills/
```

---

## Using Installed Skills in Claude Code

Once installed, invoke any skill by name in Claude Code:

```
/article-to-tiktok-slides
```

Or reference the skill in your request:
```
"Create TikTok slides from this article..."
```

Claude will automatically detect and use the installed skill.

---

## Skill Structure

Each skill is organized as follows:

```
skill-name/
├── SKILL.md          # Complete skill documentation and instructions
└── (optional additional files)
```

The `SKILL.md` file contains:
- YAML frontmatter with name and description
- Overview and step-by-step instructions
- When to use the skill
- Output examples and best practices

---

## Creating New Skills

To create a new skill:

1. Create a directory: `mkdir my-new-skill`
2. Create `SKILL.md` with:
   - YAML frontmatter (name, description)
   - Clear instructions and steps
   - Examples and use cases
3. Install: `./install-skill.sh my-new-skill`

See existing skills for templates and formatting guidelines.

---

## Requirements

- Claude Code CLI installed and configured
- Bash shell
- Write permissions to `~/.claude/skills/`

---

## Troubleshooting

### Skill not appearing in Claude

1. Verify installation: `ls ~/.claude/skills/article-to-tiktok-slides/`
2. Check file permissions: `ls -la ~/.claude/skills/article-to-tiktok-slides/SKILL.md`
3. Restart Claude Code if already running
4. Run installation script again: `./install-skill.sh article-to-tiktok-slides`

### Script permissions error

Make the script executable:
```bash
chmod +x install-skill.sh
```

### Path issues

Run from the repository root directory:
```bash
cd /path/to/claude-skills
./install-skill.sh article-to-tiktok-slides
```

---

## Contributing

To add new skills to this repository:

1. Create a skill directory with proper `SKILL.md`
2. Test locally with `./install-skill.sh`
3. Document clearly with examples
4. Commit to git

---

## License

These skills are provided as-is for use with Claude Code.
