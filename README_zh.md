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

| 阶段 | 提示词 / 规则 | 产出 |
|------|-----------|------|
| 0️⃣ 全书蓝图 | [`00_story_blueprint.md`](prompts/00_story_blueprint.md) | 容量预算、宏观阶段/篇、核心冲突分布、角色出场计划 |
| 0A️⃣ 长篇结构索引 | [`00a_longform_structure_index.md`](prompts/00a_longform_structure_index.md) | 卷、剧情单元/小弧、章段批次、故事线事件规划 |
| 1️⃣ 故事概念 | [`01_story_concept.md`](prompts/01_story_concept.md) | 世界观、核心冲突、读者钩子 |
| 2️⃣ 角色设计 | [`02_character_design.md`](prompts/02_character_design.md) | 角色性格档案（含触发机制） |
| 3A️⃣ 大纲约束卡 | [`03a_outline_constraints.md`](prompts/03a_outline_constraints.md) | 生成大纲前的卷级约束卡 |
| 3️⃣ 情绪大纲 | [`03_emotion_outline.md`](prompts/03_emotion_outline.md) | 带剧情承接检查的章节节拍表 |
| 4-6️⃣ 起草、审查、追踪 | [`rules/`](rules) + [`09_arc_subplot_tracker.md`](prompts/09_arc_subplot_tracker.md) | 写作规则、审查规则、状态追踪、弧线检查 |

## 📁 项目结构

```
skills/ai-novel-writer/
├── SKILL.md                     # 📖 工作流总指南（从这里开始）
├── prompts/
│   ├── 00_story_blueprint.md    # 长篇蓝图与弧线规划
│   ├── 00a_longform_structure_index.md # 长篇结构索引
│   ├── 01_story_concept.md      # 故事概念与世界观设定
│   ├── 02_character_design.md   # 角色性格档案生成
│   ├── 03a_outline_constraints.md # 生成大纲前的约束卡
│   ├── 03_emotion_outline.md    # 带剧情约束的情绪节拍大纲
│   └── 09_arc_subplot_tracker.md # 弧线 / 支线追踪
├── rules/
│   ├── writing_rules.md         # 场景与正文生成规则
│   ├── review_rules.md          # 一致性与去AI化审查规则
│   ├── tracking_rules.md        # 状态 / 事实追踪格式
│   └── next_chapter_direction_rules.md # 下一章方向文档规则
└── examples/
    ├── character_example.md     # 🧑 角色档案示例（刑警林深）
    └── workflow_example.md      # 🔄 完整工作流示例
```

## 🚀 快速开始

### 1. 阅读工作流指南

从 [`SKILL.md`](skills/ai-novel-writer/SKILL.md) 开始，了解六阶段工作流的整体逻辑。

### 2. 按顺序使用提示词

长篇项目建议按 `01` → `00` → `00a` → `02` → `03a` → `03` 的顺序使用 `prompts/` 下的模板。

然后再使用 `rules/` 目录下的规则文件驱动章节起草、审查和追踪。每个模板中的 `【】` 标记处填入你的具体内容。

### 3. 参考示例

- 看 [`character_example.md`](skills/ai-novel-writer/examples/character_example.md) 了解角色档案长什么样
- 看 [`workflow_example.md`](skills/ai-novel-writer/examples/workflow_example.md) 了解从概念到章节的完整流程

## 💡 关键提示

- **花 10 分钟搭好指令框架，后面 80% 的内容可以直接用**
- **百万字级长篇不要跳过 `00a_longform_structure_index.md`** — 先把全书拆成卷、剧情单元/小弧和章段批次，避免用几个全书大弧冒充长期剧情规划。
- **长篇不要跳过 `03a_outline_constraints.md`** — 先钉死约束，再排情绪大纲，能明显减少“剧情很烂”“脱设定”“章节接不上”的返工。
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
