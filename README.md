# ✍️ AI Novel Writing Workflow Skill

[English Version](README.md) | [中文版](README_zh.md)

> A complete AI novel writing workflow based on a **Four-Layer Instruction Framework**, helping you say goodbye to AI-generated "laundry list" plots and robotic tones, and efficiently produce web novel content with emotional tension.

## 🎯 What is this?

A structured set of **AI novel writing prompt templates + workflow guide** that solves three core problems:

| Pain Point | Cause | Our Solution |
|------|------|------------|
| Reads like a summary | Asking AI directly to write plot outlines | **Emotional Beat Driven**: Define emotions first, then arrange scenes |
| Stereotypical, inconsistent characters | Using abstract tags like "brave and kind" | **Trigger-Mechanism Character Design**: Define personalities through specific scenarios |
| Too much "AI flavor" | Generating full chapters at once | **Six-Stage Layered Generation** + De-AI Review |

## 📐 Four-Layer Instruction Framework

The core methodology of this project:

1. **🎭 Emotional Beats** — Define the emotions for each chapter (curiosity → unease → anger → relief) instead of just plot outlines.
2. **💬 Subtextual Dialogue** — Design a three-layer dialogue structure: "What is said on the surface + What is truly thought + Body language".
3. **📦 Layered Generation** — Step-by-step progression: Concept → Character → Outline → Scene → Draft → Polish.
4. **🧠 Trigger-Mechanism Characters** — Define characters using breakdown points, principle-breaking conditions, and childhood events rather than abstract tags.

## 🔄 Six-Stage Workflow

```
Stage 1: Story Concept  →  Stage 2: Character Design  →  Stage 3: Emotion Outline
                                                                 ↓
Stage 6: Review & Polish  ←  Stage 5: Chapter Generation  ←  Stage 4: Scene & Dialogue
```

| Stage | Prompt / Rule | Output |
|------|-----------|------|
| 0️⃣ Story Blueprint | [`00_story_blueprint.md`](prompts/00_story_blueprint.md) | Arc map, major conflict track, character rollout plan |
| 1️⃣ Story Concept | [`01_story_concept.md`](prompts/01_story_concept.md) | World-building, core conflicts, reader hooks |
| 2️⃣ Character Design | [`02_character_design.md`](prompts/02_character_design.md) | Character profile (including triggers) |
| 3A️⃣ Outline Constraints | [`03a_outline_constraints.md`](prompts/03a_outline_constraints.md) | Volume-level constraint card before outlining |
| 3️⃣ Emotion Outline | [`03_emotion_outline.md`](prompts/03_emotion_outline.md) | Plot-and-emotion beat sheet with continuity checks |
| 4-6️⃣ Drafting, review, tracking | [`rules/`](rules) + [`09_arc_subplot_tracker.md`](prompts/09_arc_subplot_tracker.md) | Chapter drafting rules, review rules, tracking updates, arc checkups |

## 📁 Project Structure

```
skills/ai-novel-writer/
├── SKILL.md                     # 📖 Master workflow guide (Start here)
├── prompts/
│   ├── 00_story_blueprint.md    # Long-form blueprint and arc planning
│   ├── 01_story_concept.md      # Story concept and world-building
│   ├── 02_character_design.md   # Character profile generation
│   ├── 03a_outline_constraints.md # Pre-outline constraint card
│   ├── 03_emotion_outline.md    # Emotion beat outline with plot checks
│   └── 09_arc_subplot_tracker.md # Arc / subplot tracking
├── rules/
│   ├── writing_rules.md         # Scene and draft-generation rules
│   ├── review_rules.md          # Consistency and de-AI review rules
│   ├── tracking_rules.md        # State / fact tracking format
│   └── next_chapter_direction_rules.md # Direction file for the next chapter
└── examples/
    ├── character_example.md     # 🧑 Character profile example
    └── workflow_example.md      # 🔄 Complete workflow example
```

## 🚀 Quick Start

### 1. Read the Workflow Guide
Start with [`SKILL.md`](skills/ai-novel-writer/SKILL.md) to understand the overall logic of the six-stage workflow.

### 2. Use Prompts in Order
For long-form projects, use the templates in this order:
`00` → `01` → `02` → `03a` → `03`.

Then use the files under `rules/` to drive chapter drafting, review, and tracking. Fill in your specific content at the `【】` markers in each template.

### 3. Refer to Examples
- Check [`character_example.md`](skills/ai-novel-writer/examples/character_example.md) to see what a character profile looks like.
- Check [`workflow_example.md`](skills/ai-novel-writer/examples/workflow_example.md) to understand the complete process from concept to chapter.

## 💡 Key Tips

- **Spend 10 minutes setting up the prompt framework, and 80% of the subsequent content will be directly usable.**
- **Do not skip `03a_outline_constraints.md` for long-form work** — it prevents weak plots, continuity gaps, and setting drift before chapter drafting starts.
- **Do not repeatedly regenerate** — This is the least efficient approach. Adjusting your input is much more effective than regenerating blindly.
- **The first generation is always a semi-finished product** — Stage 6 (Review & Polish) cannot be skipped.
- **Keep AI writing proportion under 30%** — Blend in your own expression style to ensure passage of platform AI detectors.
- **Fix the problem at its corresponding layer** — Do not try to fix a Stage 2 problem during Stage 5.

## ⏱️ Efficiency Reference

| Process | Time per Chapter |
|------|---------|
| Material Prep (Stages 1-3, one-time) | ~ 40-60 mins |
| Scene Dialogue + Chapter Gen (Stages 4-5) | ~ 15-25 mins/chapter |
| Review & Polish (Stage 6) | ~ 15-20 mins/chapter |
| **Total Per Chapter** | **~ 30-45 mins** |

> 📊 Based on 2000-3000 words per chapter, you can produce about 6000 words in 2 hours.

## 📄 License

MIT License - Free to use, modify, and distribute.

---

*If this project helps you, please consider giving it a ⭐ Star!*
