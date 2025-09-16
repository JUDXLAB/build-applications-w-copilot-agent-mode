## 步骤 1：你好，GitHub Copilot agent mode

欢迎来到你的 **“使用 GitHub Copilot agent mode 构建应用程序”** 练习！:robot:

在本练习中，你将使用 GitHub Copilot agent mode 构建一个用于跟踪你的健身目标和进展的应用程序。🏋️‍♂️🏃‍♀️💪

### 什么是 GitHub Copilot agent mode？

Copilot agent mode 可以从零创建应用、跨多个文件进行重构、编写和运行测试、将遗留代码迁移到现代框架。它还能自动生成文档、集成新库，或帮助解答复杂代码库的问题。Copilot agent mode 让你拥有一个理解工作区的 AI 合作者，极大提升开发效率。它能协同你的开发流程，同时让你始终掌控全局。

Copilot agent mode 以更自主和动态的方式运作，以实现预期目标。为处理请求，Copilot 会循环执行以下步骤，并根据需要多次迭代：

- 自动确定相关上下文和需要编辑的文件。
- 提供代码更改和终端命令来完成任务。例如，Copilot 可能会编译代码、安装依赖、运行测试等。
- 监控代码编辑和终端命令输出的正确性，并迭代修复问题。

> 💡 **提示：** 你可以在 [使用 agent mode 文档](https://code.visualstudio.com/docs/copilot/copilot-edits#_use-agent-mode-preview) 中了解更多关于 GitHub Copilot agent mode 的信息。

### :keyboard: 活动：了解你的 GitHub Copilot agent mode 开发环境

1. 右键点击下方按钮，在新标签页打开 **创建 Codespace** 页面。

   [![在 GitHub Codespaces 中打开](https://github.com/codespaces/badge.svg)](https://codespaces.new/{{full_repo_name}}?quickstart=1)

   - 所有 GitHub 账户自带的 Codespaces 免费额度已足够，前提是你还有剩余分钟数。
   - 默认的 Codespace 设置即可。

1. 确认 **Repository** 字段是你自己的练习副本，而不是原始仓库，然后点击绿色的 **Create Codespace** 按钮。

   - ✅ 你的副本：`/{{{full_repo_name}}}`
   - ❌ 原始仓库：`/skills/build-applications-w-copilot-agent-mode`

1. 等待 Visual Studio Code 加载片刻。
    1. 你可能需要在 codespace 中切换到 VS Code Insiders 版本，因为 agent mode 从 4/4 开始分阶段发布。
   <img width="323" alt="vscode-insiders-light" src="https://github.com/user-attachments/assets/8ff8868b-9120-4055-8449-175e85552ba2" />

1. 在继续之前，先熟悉一下项目文件夹。

   - 左侧导航栏可访问文件资源管理器、调试器和搜索功能。
   - 下方面板（Ctrl+J）显示调试输出，可运行终端命令，并可配置 Web 服务端口。
   - docs 文件夹中包含另一个示例应用仓库，将为 Copilot agent mode 构建你的应用提供上下文。后续步骤会详细介绍！

1. 在 VS Code 顶部，找到并点击 Copilot 图标，打开 Copilot Chat 面板。

   <img width="150" alt="image" src="https://github.com/user-attachments/assets/5e64db46-95cb-415d-badc-b6b8677f10c1" />

1. 如果你是第一次使用 GitHub Copilot，需要接受使用条款才能继续。
    - 点击 **Accept** 按钮继续。
    - 如果你是第一次使用 Copilot Chat，也需要接受使用条款。
    - 点击 **Accept** 按钮继续。

### :keyboard: 活动：使用 Copilot agent mode 创建并发布分支 🙋

干得好！现在我们已经熟悉了应用，也知道它可以正常工作，让我们请 Copilot 帮助我们新建一个分支，进行一些自定义。

1. 如果还没回到 VS Code，请切换回去。

1. 打开 GitHub Copilot Chat 窗口（如果还未打开）。
2. 复制并粘贴以下提示到 GitHub Copilot Chat，并在下拉菜单中选择 **Agent**，而不是 **Ask** 或 **Edit**。

   <img src="https://github.com/user-attachments/assets/e172f5c0-bc2a-45a9-a301-9af8bfbd6a2e" width=30% height=30%>

> 🪧 **注意：** 
- 不要将模型从 GPT-4o 切换为其他模型，这将在课程最后作为可选活动。
- 请记住，Copilot agent mode 是对话式的，它可能会向你提问，你也可以向它提问。
- 等待 Copilot 响应，并点击继续按钮以执行 Copilot agent mode 提供的命令。

1. 让我们请 Copilot agent mode 帮我们记住命令，并创建名为 `build-octofit-app` 的新 Git 分支并发布它

   > ![Static Badge](https://img.shields.io/badge/-Prompt-text?style=flat-square&logo=github%20copilot&labelColor=512a97&color=ecd8ff)
   >
   > ```prompt
   > Hey copilot, how can I create and publish a new Git branch called build-octofit-app?
   > ```

   Copilot agent mode 会响应，并询问你是否允许它运行该命令。请回复 **Yes**</br>

   <img src=https://github.com/user-attachments/assets/8dafaa5f-80db-41ea-a189-b5d603c11d63 width=40% height=40%>

1. 确认命令无误后，点击 `Continue` 按钮，让 Copilot agent mode 为你运行命令。无需手动复制粘贴！

1. 片刻后，在 VS Code 左下角状态栏查看当前分支。应显示为 `build-octofit-app`，如果是这样，你就完成了本步骤！

1. 现在你的分支已推送到 GitHub，Mona 应该已经在检查你的工作。请稍等片刻，关注评论区。你会看到她回复进度信息和下一课内容。

<details>
<summary>遇到问题？🤷</summary><br/>

如果没有收到反馈，请检查以下事项：

- 确认你创建的分支名称为 `build-octofit-app`，没有前缀或后缀。
- 确认分支已成功推送到你的仓库。

</details>
- Make sure the branch was indeed published to your repository.

</details>
