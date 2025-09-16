## 步骤 2：应用程序初始设置：目录结构、Python 依赖和 MongoDB

在本步骤中，我们将完成以下内容：

- 创建 octofit-tracker 应用程序的目录结构。
- 创建 octofit-tracker/backend 和 octofit-tracker/frontend 目录。
- 创建 octofit-tracker/backend/requirements.txt 文件。

1. 打开 `docs` 文件夹下的所有文件，并在整个练习过程中保持本文件在编辑器中打开。
    1. agent mode 会使用 `mona-high-school-fitness-tracker.md` 和 `octofit_story.md` 作为参考来创建应用程序。
2. 将以下提示复制粘贴到 GitHub Copilot Chat，并在下拉菜单中选择 “Agent”，而不是 “Ask” 或 “Edit”。

<img src="https://github.com/user-attachments/assets/e172f5c0-bc2a-45a9-a301-9af8bfbd6a2e" width=40% height=40%>

> 🪧 **注意：** 
- 不要将模型从 GPT-4o 切换为其他模型，这将在课程最后作为可选活动。
- 请记住，Copilot agent mode 是对话式的，它可能会向你提问，你也可以向它提问。
- 等待 Copilot 响应，并点击继续按钮以执行 Copilot agent mode 提供的命令。
- 在 Copilot agent mode 完成前，请保留其创建和更新的文件。
- agent mode 能够评估你的代码库、执行命令，并自动添加/重构/删除代码库中的部分内容，如有错误还能自动修复。

### :keyboard: 活动：提示 GitHub Copilot agent mode 开始创建我们的应用程序

> ![Static Badge](https://img.shields.io/badge/-Prompt-text?style=flat-square&logo=github%20copilot&labelColor=512a97&color=ecd8ff)
>
> ```prompt
> 让我们一步一步来，按以下顺序生成指令并执行命令。
> 使用 docs/mona-high-school-fitness-tracker.md 作为项目结构和需求的参考。
>
> 1. 理解 docs/octofit_story.md 文件中创建健身应用的故事。
> 2. 为 octofit-tracker 应用创建初始目录结构 octofit-tracker/backend, octofit-tracker/frontend。
> 3. 设置后端 python 虚拟环境，octofit-tracker/backend/requirements.txt 基于 docs/mona-high-school-fitness-tracker.md，并安装所需依赖包。
>
> 在所有这些步骤完成前不要进行下一个活动。
>```
>

> ❕ **重要提示：** 上述活动安装完所有依赖包后，再进行下一个活动。

### :keyboard: 活动：让我们安装 MongoDB

> ![Static Badge](https://img.shields.io/badge/-Prompt-text?style=flat-square&logo=github%20copilot&labelColor=512a97&color=ecd8ff)
>
> ```prompt
> 参考 docs/mona-high-school-fitness-tracker.md 文件中的 monafit tracker 应用示例，并将 octofit 作为 mergington 高中应用的名称。让我们安装 MongoDB。
>
> 1. 安装 MongoDB 并确保命令完整执行。
>
> 在所有这些步骤完成前不要进行下一个活动。
>```

> ❕ **重要提示：**
- 如果命令在终端完成但 agent mode 仍显示正在运行，请点击 stop。
- 你可能需要再次将提示粘贴到 agent mode。

### :keyboard: 活动：让我们启动并验证 MongoDB 是否正在运行

> ![Static Badge](https://img.shields.io/badge/-Prompt-text?style=flat-square&logo=github%20copilot&labelColor=512a97&color=ecd8ff)
>
> ```prompt
> 参考 docs/mona-high-school-fitness-tracker.md 文件中的 monafit tracker 应用示例，并将 octofit 作为 mergington 高中应用的名称。让我们启动并验证 MongoDB 是否正在运行。
>
> 1. 启动 MongoDB 服务。
> 2. 验证 MongoDB 服务是否正在运行。
>
> 在所有这些步骤完成前不要进行下一个活动。
>```

> ❕ **重要提示：**
- 如果命令在终端完成但 agent mode 仍显示正在运行，请点击 stop。
- 你可能需要再次将提示粘贴到 agent mode。

1. 现在我们已经创建了应用目录结构，设置了 Python 虚拟环境，并在 Copilot agent mode 的帮助下编写了 requirements.txt 并安装了所有项目依赖，请将更改提交到 `build-octofit-app` 分支。

1. 完成新更改后，请**提交**并**推送**更改到 GitHub。

1. 等待 Mona 检查你的工作，提供反馈，并分享下一课，让我们继续努力！

<details>
<summary>遇到问题？🤷</summary><br/>

如果没有收到反馈，请检查以下事项：

- 确认你对以下文件的更改已提交到 `build-octofit-app` 分支并推送/同步到 GitHub：
  - `octofit-tracker/backend/requirements.txt`，且其中包含 `Django==4.1` 包
- 如果 Mona 发现错误，只需修正并再次推送更改。Mona 会多次检查你的工作直到正确为止。

</details>
