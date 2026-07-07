# ✍️ AI Novel Writing Workflow Skill

[English Version](README.md) | [中文版](README_zh.md)

> Give the AI a novelist's way of working — not a stack of approval forms.
> **Control lives in the structure; freedom lives in the sentences.** Planning files lock down facts, causality, and secret-reveal schedules; every sentence of prose regrows from inside the POV character.

## 🎯 Problems it solves

| Pain point | Root cause | The fix in this workflow |
|------|------|------------|
| Emotional pacing drifts in long serials — climaxes feel flat, chapters read mechanical | Pacing driven by "intensity numbers": volume rises, stakes don't | **Tension waveform + raise-the-stakes rule + breather chapters + emotional debts**: emotion follows the character's situation; every reader grievance must be repaid on schedule |
| Chapters connect poorly, each reads like a standalone short story | Outlines generated cell-by-cell, no causality between cells | **Causal beat cards + relay card + chain-read check**: every chapter must pick up exactly what the previous chapter "left for the next" |
| The book has no spine — map after map, villain after villain | Event lists without a thesis or a price | **Story Core (ultimate question + false belief) + volume table ("what is lost forever") + trump-card ledger**: fate tightens volume by volume |
| Every fix made the system messier | Each symptom got a new control layer; rules duplicated and fought each other | **Five artifacts, hard cap**: one fact lives in one place; the test script gives every file a line budget |

## 📦 The five artifacts (a novel project's entire paperwork)

```
故事核.md        Why this book is worth finishing: ultimate question, false belief, trump cards
characters/      One file per character: trigger mechanisms, dialogue voice, knowledge boundary
outlines/
├── 全书结构.md  Volume table (fate progression) + arc cards (8-25 chapter causal loops)
├── 节拍_弧X.md  Per-chapter beat cards: inherit → choice → surprise → consequence → hand-off
└── 账本.md      Hard facts (append-only) / character now / threads & emotional debts / relay card
```

The chapter loop: **load → three questions before drafting → writer's draft → revision (facts → chain → humanity) → bookkeeping → brief**.
At arc end: chain-read check + next arc's beats. At volume end: the three volume questions + revise future volume rows.

## 🧭 The four working principles

1. **Plot is causality, not a list** — adjacent chapters must connect with "therefore/but"; anywhere only "and then" fits is a broken link
2. **Emotion is the reader's heartbeat over the stakes** — to tighten: raise stakes, cut time, remove exits; to release: cash in a small win. Never fake emotion with adjectives
3. **Secrets are debts owed to the reader** — a trump card has three states: buried → cracked open → played, and every reveal must cost something
4. **Control in structure, freedom in sentences** — planning language never enters prose

## 📂 Repository layout

```
skills/ai-novel-writer/
├── SKILL.md                     # 📖 The engine: routing, chapter loop, init, checkpoints (start here)
├── prompts/
│   ├── 01_story_core.md         # Story core: ultimate question, false belief, trump cards
│   ├── 02_character_design.md   # Trigger-mechanism character profiles
│   ├── 03_book_structure.md     # Capacity budget, volume table, arc cards, reveal schedule
│   └── 04_arc_beats.md          # Causal beat cards, tension waveform, chain-read check
├── rules/
│   ├── craft_rules.md           # The writer's handbook: POV, dialogue, chapter relay, de-AI diagnosis
│   ├── ledger_rules.md          # The ledger: single tracking file + relay card
│   └── research_rules.md        # Fact-checking against real-world/professional sources
├── examples/                    # Full workflow example + character profile example
└── test-prompts.json            # 13 evaluation scenarios
tests/
├── skill_quality_checks.ps1     # Quality checks (ASCII-only logic)
└── checks.json                  # Check config: key mechanisms + line budgets (anti-bloat)
```

## 🚀 Quick start

1. Start with [`skills/ai-novel-writer/SKILL.md`](skills/ai-novel-writer/SKILL.md) for the routing and the chapter loop.
2. New project: run `prompts/01 → 02 → 03 → 04` in order, create the ledger, then ask the AI to "write the next chapter".
3. A million-word serial does not need more file types — only more volumes and arc cards (see the capacity budget in `03_book_structure.md`).
4. Legacy projects (story constitution / asset library / batch context packs): the "migration" section in SKILL.md merges them into the five artifacts.

## 💡 Key tips

- **Generate beats one arc at a time** (8-25 chapters); detail near, sketch far.
- **The ledger is the only file updated every chapter**; the relay card replaces all "next chapter direction" documents.
- **The AI stops only for two reasons**: missing artifacts, or a conflict with established facts. Everything else is judgment plus a note in the brief — no constant stalling.
- **Run the tests when editing this skill**: `powershell -File tests/skill_quality_checks.ps1`. Over budget? Cut before you add.

## 📄 License

MIT License
