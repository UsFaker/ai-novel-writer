# ✍️ AI 小说创作工作流 Skill

[English Version](README.md) | [中文版](README_zh.md)

> 基于**四层指令框架**的 AI 小说创作完整工作流，帮你告别 AI 流水账和机器腔调，高效产出有情感张力的网文内容。

## 🎯 这是什么？

一套结构化的 **AI 小说创作提示词模板 + 工作流指南**，解决三个核心问题：

| 痛点 | 原因 | 本项目的解法 |
|------|------|------------|
| 内容像流水账 | 直接让 AI 写剧情大纲 | **情绪节拍驱动**，先定情绪再排场景 |
| 角色标签化、前后矛盾 | 用"勇敢善良"等抽象标签 | **触发机制式角色设计**，用具体场景定义性格 |
| AI 味过重 | 一次性生成完整章节 | **六阶段分层生成** + 去 AI 化审查 |

## 📐 四层指令框架

本项目的核心方法论：

1. **🎭 情绪节拍** — 给每章定情绪（好奇→不安→愤怒→释怀），而非剧情大纲
2. **💬 潜台词对话** — 设计"表面说什么 + 心里想什么 + 身体语言"三层对话结构
3. **📦 分层生成** — 概念→角色→大纲→场景→正文→润色，逐层递进
4. **🧠 触发机制角色** — 用崩溃点、违背点、童年事件定义角色，而非抽象标签

## 🔄 六阶段工作流

```
阶段1 故事概念  →  阶段2 角色设计  →  阶段3 情绪大纲
                                          ↓
阶段6 审查润色  ←  阶段5 章节生成  ←  阶段4 场景对话
```

| 阶段 | 提示词模板 | 产出 |
|------|-----------|------|
| 1️⃣ 故事概念 | [`01_story_concept.md`](.agents/skills/ai-novel-writing/prompts/01_story_concept.md) | 世界观、核心冲突、读者钩子 |
| 2️⃣ 角色设计 | [`02_character_design.md`](.agents/skills/ai-novel-writing/prompts/02_character_design.md) | 角色性格档案（含触发机制） |
| 3️⃣ 情绪大纲 | [`03_emotion_outline.md`](.agents/skills/ai-novel-writing/prompts/03_emotion_outline.md) | 章节情绪节拍表 |
| 4️⃣ 场景对话 | [`04_scene_dialogue.md`](.agents/skills/ai-novel-writing/prompts/04_scene_dialogue.md) | 潜台词对话 + 氛围描写 |
| 5️⃣ 章节生成 | [`05_chapter_generation.md`](.agents/skills/ai-novel-writing/prompts/05_chapter_generation.md) | 章节初稿 |
| 6️⃣ 审查润色 | [`06_review_polish.md`](.agents/skills/ai-novel-writing/prompts/06_review_polish.md) | 一致性检查 + 质量润色 + 去AI化 |

## 📁 项目结构

```
.agents/skills/ai-novel-writing/
├── SKILL.md                     # 📖 工作流总指南（从这里开始）
├── prompts/
│   ├── 01_story_concept.md      # 故事概念与世界观设定
│   ├── 02_character_design.md   # 角色性格档案生成
│   ├── 03_emotion_outline.md    # 情绪节拍大纲
│   ├── 04_scene_dialogue.md     # 场景描写与潜台词对话
│   ├── 05_chapter_generation.md # 章节正文生成
│   └── 06_review_polish.md      # 审查与润色（三轮）
└── examples/
    ├── character_example.md     # 🧑 角色档案示例（刑警林深）
    └── workflow_example.md      # 🔄 完整工作流示例
```

## 🚀 快速开始

### 1. 阅读工作流指南

从 [`SKILL.md`](.agents/skills/ai-novel-writing/SKILL.md) 开始，了解六阶段工作流的整体逻辑。

### 2. 按顺序使用提示词

打开 `prompts/` 目录下的模板，按 `01` → `06` 的顺序依次使用。每个模板中的 `【】` 标记处填入你的具体内容。

### 3. 参考示例

- 看 [`character_example.md`](.agents/skills/ai-novel-writing/examples/character_example.md) 了解角色档案长什么样
- 看 [`workflow_example.md`](.agents/skills/ai-novel-writing/examples/workflow_example.md) 了解从概念到章节的完整流程

## 💡 关键提示

- **花 10 分钟搭好指令框架，后面 80% 的内容可以直接用**
- **不要反复重新生成** — 效率最低的做法，调整输入比重新生成有效得多
- **第一遍生成永远是半成品** — 阶段 6 的审查润色不可省略
- **AI 创作比例控制在 30% 以下** — 融入自己的表达方式，确保通过平台检测
- **问题出在哪一层，就回到哪一层修改** — 不要在第5层修第2层的问题

## ⏱️ 效率参考

| 环节 | 每章耗时 |
|------|---------|
| 素材准备（阶段 1-3，前期一次性） | 约 40-60 分钟 |
| 场景对话 + 章节生成（阶段 4-5） | 约 15-25 分钟/章 |
| 审查润色（阶段 6） | 约 15-20 分钟/章 |
| **单章总计** | **约 30-45 分钟** |

> 📊 按每章 2000-3000 字计算，2 小时可产出约 6000 字。

## 📄 License

MIT License - 自由使用、修改和分发。

---

*如果这个项目对你有帮助，欢迎 ⭐ Star 支持！*
