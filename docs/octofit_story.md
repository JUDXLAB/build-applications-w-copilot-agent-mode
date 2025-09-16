# 使用 GitHub Copilot agent mode 为 Mergington 高中构建健身应用

## Mergington 高中 OctoFit Tracker 应用故事

Paul Octo 是 Mergington 高中的一名体育老师，任教已超过 8 年。尽管他对体育课充满热情且富有创意，但他越来越担心学生们一离开校园就很少进行体育锻炼。许多学生坦言，除了必修的体育课外，他们几乎不运动。
在参加了一场关于“体育教育中的技术融合”的专业发展会议后，Paul 受到启发，想要创造一个解决方案。他希望这个方案能够：

1. 让健身追踪变得有趣且有吸引力
2. 通过友好的竞争营造积极的同伴压力
3. 让他能够远程监控学生进展
4. 根据个人体能水平提供个性化指导

## OctoFit Tracker 的诞生

Paul 最初在午休时把自己的想法画在了笔记本上。他设想有一个应用，学生可以记录锻炼、获得成就徽章，并参与每月健身挑战。但作为一名体育老师，他的编程知识有限，技术实现让他感到望而生畏。
这时，他找到了 Mergington 高中 IT 部门负责人 Jessica Cat。Jessica 建议以 Mona 高中开发的 Monafit Tracker 为基础，该项目已在 `docs/mona-high-school-fitness-tracker.md` 有详细文档。她认为可以将 Monafit Tracker 的结构和功能适配到 Mergington 高中的需求。

### 技术规划阶段

在开发前，Paul 和 Jessica 仔细阅读了 Monafit Tracker 的仓库和文档。这为 OctoFit Tracker 奠定了坚实基础，确保技术规范合规，并借鉴了成熟的设计模式。
Paul 和 IT 团队共同确定了 OctoFit Tracker 的关键需求：

### 用户体验目标

- 针对青少年设计的简单直观界面
- 快速记录活动，减少操作阻力
- 兼顾学生隐私的社交功能
- 游戏化元素，持续激发参与热情

### 技术规范

- 移动响应式 Web 应用（可在学校 Chromebook 和个人设备访问）
- 基于 Monafit Tracker 实现的安全认证
- 活动验证系统，防止作弊

## 当前开发进展

Paul 和 Jessica 已搭建好 GitHub Codespace 开发环境，并借助 GitHub Copilot agent mode 取得了显著进展。通过适配 Monafit Tracker 的结构，OctoFit Tracker 原型已具备：

- 完整的用户注册系统
- 跑步、步行和力量训练的基础活动记录
- 团队竞赛的初步框架
- 展示学生进展的简易仪表盘

## Paul 的下一步计划

基础架构就绪后，Paul 现在专注于：

1. 开发一个能公平比较不同活动类型的积分系统
2. 创建能吸引不同学生兴趣的激励挑战
3. 构建鼓励持续锻炼但不打扰的通知系统
4. 设计报告，帮助他识别需要额外支持或激励的学生

IT 部门对 GitHub Copilot agent mode 加速开发印象深刻，让 Paul 能专注于教育本身，而 AI 负责大部分技术实现。Jessica Cat 尤其满意 OctoFit Tracker 能在 Monafit Tracker 基础上满足 Mergington 高中的独特需求。

### 工作坊概览

在本次工作坊中，你将：

1. 使用 **GitHub Codespaces** 搭建开发环境
2. 利用 **GitHub Copilot** 加速多技术栈开发
3. 借助 Copilot agent mode 构建 **OctoFit Tracker** 应用核心组件
4. 学习与 **GitHub Copilot agent mode** 协作的最佳实践与提示技巧

### 应用功能

**OctoFit Tracker** 将包含：

- 用户个人资料
- 活动记录与追踪
- 团队创建与管理
- 竞赛排行榜
- 个性化锻炼建议

### GitHub Copilot Chat

以下是当前支持的 GitHub Copilot Chat 模型：

- Claude Sonnet 3.5（预览版）
- Claude Sonnet 3.7（预览版）
- Claude Sonnet 3.7 Thinking（预览版）
- Gemini 2.0 Flash（预览版）
- GPT-4o
- o1（预览版）
- o3-mini（预览版）

#### [LLM 模型说明](https://docs.github.com/en/copilot/using-github-copilot/ai-models/changing-the-ai-model-for-copilot-chat#ai-models-for-copilot-chat-1)

![GitHub Copilot Chat models](https://github.com/user-attachments/assets/f2f8d0bd-366b-4ecf-b88d-d092ae7b8b10)

#### 提示工程

- [GitHub 官方文档：提示工程](https://docs.github.com/en/copilot/using-github-copilot/prompt-engineering-for-github-copilot)
- [如何使用 GitHub Copilot：提示、技巧与用例](https://github.blog/2023-06-20-how-to-write-better-prompts-for-github-copilot/)
- [在 IDE 中使用 GitHub Copilot：技巧与最佳实践](https://github.blog/2024-03-25-how-to-use-github-copilot-in-your-ide-tips-tricks-and-best-practices/)
- [开发者的提示工程与 LLM 指南](https://docs.github.com/en/copilot/using-github-copilot/prompt-engineering-for-github-copilot#:~:text=A%20developer%E2%80%99s%20guide%20to%20prompt%20engineering%20and%20LLMs)
- [GitHub Copilot：智能体觉醒](https://github.blog/news-insights/product-news/github-copilot-the-agent-awakens/#agent-mode-available-in-preview-%f0%9f%a4%96)

### OctoFit Tracker 健身应用技术栈

我们将使用现代 Web 应用技术栈：

- **前端**：React.js
- **后端**：Python + Django REST Framework
- **数据库**：MongoDB
- **开发环境**：GitHub Codespaces

### 工作坊结构

1. **介绍**
   - OctoFit Tracker 应用概念概览
   - GitHub Copilot Chat 模型

2. **准备工作**
   - 配置 GitHub Codespaces
   - 确保 GitHub Copilot 及 Copilot Chat 扩展为最新版本

3. **使用 GitHub Copilot agent mode 快速原型开发**
   - 创建项目结构
   - 生成样板代码
   - 实现基础模型、序列化器、URL 和视图

4. **核心功能开发**
   - 活动记录 API
   - 团队管理
   - 排行榜功能

5. **前后端开发**
   - 配置 React 组件
   - 实现响应式 UI
   - 连接后端 API
   - Python Django 业务逻辑
   - MongoDB 数据层
