
## 步骤 5：设置前端 React 框架，更新组件并启动 OctoFit Tracker 应用

在本步骤中，我们将完成以下内容：

- 设置 octofit-tracker 前端 React 框架。
- 更新以下组件以集成 React 框架：
  - src/App.js
  - src/index.js
  - src/components/Activities.js
  - src/components/Leaderboard.js
  - src/components/Teams.js
  - src/components/Users.js
  - src/components/Workouts.js
- 启动 React 应用并检查输出。

1. 打开 `docs` 文件夹下的所有文件，并在整个练习过程中保持本文件在编辑器中打开。
    1. agent mode 会使用 `mona-high-school-fitness-tracker.md` 和 `octofit_story.md` 作为参考来创建应用程序。
2. 将以下提示复制粘贴到 GitHub Copilot Chat，并在下拉菜单中选择 “Agent”，而不是 “Ask” 或 “Edit”。

> 🪧 **注意：**
- 不要将模型从 GPT-4o 切换为其他模型，这将在课程最后作为可选活动。
- 请记住，Copilot agent mode 是对话式的，它可能会向你提问，你也可以向它提问。
- 等待 Copilot 响应，并点击继续按钮以执行 Copilot agent mode 提供的命令。
- 在 Copilot agent mode 完成前，请保留其创建和更新的文件。
- agent mode 能够评估你的代码库、执行命令，并自动添加/重构/删除代码库中的部分内容，如有错误还能自动修复。

### :keyboard: 活动：安装 octofit-tracker 前端 React 框架

> ![Static Badge](https://img.shields.io/badge/-Prompt-text?style=flat-square&logo=github%20copilot&labelColor=512a97&color=ecd8ff)
>
> ```prompt
> 参考 docs/mona-high-school-fitness-tracker.md 文件中的 monafit tracker 应用示例，并将 octofit 作为 mergington 高中应用的名称。让我们为 octofit-tracker 前端 React 框架设置 codespace。
>
> 1. 创建 octofit-tracker/frontend 目录。
> 2. 在 octofit-tracker/frontend 目录下创建 react 应用。
> 3. 根据 docs/mona-high-school-fitness-tracker.md 安装稳定版本的 React 框架及模块。
> 4. 在 octofit-tracker/frontend 目录下安装稳定版 bootstrap。
> 5. 在 src/index.js 文件中引入 bootstrap css。
> 6. 在 octofit-tracker/frontend 目录下安装稳定版 react-router-dom。
> 7. 不要更改 .gitignore 文件。
>
> 在所有这些步骤完成前不要进行下一个活动。
>```

### :keyboard: 活动：更新 octofit-tracker 前端 React 组件

> 🪧 **注意：**
- 请务必将 [REPLACE-THIS-WITH-YOUR-CODESPACE-NAME] 替换为你的 codespace 名称。
  - 例如：redesigned-spork-g6pj46rr9hpp6x
- 你可以在终端运行以下命令获取 codespace 名称：`echo $CODESPACE_NAME`。

> ![Static Badge](https://img.shields.io/badge/-Prompt-text?style=flat-square&logo=github%20copilot&labelColor=512a97&color=ecd8ff)
>
> ```prompt
> 参考 docs/mona-high-school-fitness-tracker.md 文件中的 monafit tracker 应用示例，并将 octofit 作为 mergington 高中应用的名称。让我们更新 octofit-tracker 前端 React 组件。
>
> - 更新以下组件，使其指向后端 API 并集成 React 框架：
>   - src/App.js
>   - src/index.js
>   - src/components/Activities.js
>   - src/components/Leaderboard.js
>   - src/components/Teams.js
>   - src/components/Users.js
>   - src/components/Workouts.js
> - 在每个组件中，将 fetch url 替换为 codespace url https://[REPLACE-THIS-WITH-YOUR-CODESPACE-NAME]-8000.app.github.dev/api/<component>，用于 Django rest framework 后端。
> - 确保使用正确的端口和协议（http 或 https）。
> - 更新 src/App.js 以包含所有组件的主导航。
> - 确保导航菜单使用 react-router-dom。
> - React 应用应显示导航菜单和各组件。
>
> 在所有这些步骤完成前不要进行下一个活动。
> ```

> ❕ **重要提示：**
- 请务必将 [REPLACE-THIS-WITH-YOUR-CODESPACE-NAME] 替换为你的 codespace 名称。
  - 例如：redesigned-spork-g6pj46rr9hpp6x
- 你可以在终端运行以下命令获取 codespace 名称：`echo $CODESPACE_NAME`。

### :keyboard: 活动：启动 react 应用并检查输出

现在，让我们实际运行 react 应用！在左侧边栏选择 `运行和调试` 选项卡，然后点击 **开始调试** 图标。

<img src="https://github.com/user-attachments/assets/8ab08e4e-539a-4ca9-8270-be4b1f0df176"  width=30% height=30%>

### :keyboard: 活动：为 octofit tracker 应用添加格式、结构和样式

> ![Static Badge](https://img.shields.io/badge/-Prompt-text?style=flat-square&logo=github%20copilot&labelColor=512a97&color=ecd8ff)
>
> ```prompt
> 参考 docs/mona-high-school-fitness-tracker.md 文件中的 monafit tracker 应用示例，并将 octofit 作为 mergington 高中应用的名称。让我们像 App.css 一样美化样式。
>
> - 让 App.js 及所有组件的 javascript 文件风格保持一致：
>   - 所有 javascript 组件中的数据使用 bootstrap 表格。
>   - 按钮使用 bootstrap 按钮。
>   - 标题使用 bootstrap 标题。
>   - 链接使用 bootstrap 链接。
>   - 导航菜单使用 bootstrap 导航。
>   - 表单使用 bootstrap 表单。
>   - 卡片使用 bootstrap 卡片。
>   - 模态框使用 bootstrap 模态框。
>
> 在所有这些步骤完成前不要进行下一个活动。
>```

### :keyboard: 可选活动：让 octofit tracker 应用更美观并添加色彩

> ![Static Badge](https://img.shields.io/badge/-Prompt-text?style=flat-square&logo=github%20copilot&labelColor=512a97&color=ecd8ff)
>
> ```prompt
> 参考 docs/mona-high-school-fitness-tracker.md 文件中的 monafit tracker 应用示例，并将 octofit 作为 mergington 高中应用的名称。让我们像 App.css 一样美化样式。
> 
> - 编辑 App.css 文件，实现如下：
>   - 为背景添加颜色。
>   - 为文本添加颜色。
>   - 为表格添加颜色。
>   - 为按钮添加颜色。
>   - 为标题添加颜色。
>   - 为链接添加颜色。
>   - 为导航菜单添加颜色。
> - 将 octofitapp-small logo 靠左对齐添加到应用，并美化。
> - 为应用添加 favicon 并美化。
>
>在所有这些步骤完成前不要进行下一个活动。
>```

### :keyboard: 可选活动：迭代外观并尝试不同模型

> 🧪 **试试这样：**
- 尝试自定义提示词，改变应用外观、添加功能，并尝试不同模型。
- 当你对应用满意后，可以将更改提交并推送到 `build-octofit-app` 分支。

1. 现在我们已经为所有应用组件创建了 REACT 前端，让我们将更改提交到 `build-octofit-app` 分支。

1. 完成新更改后，请 **commit** 并 **push** 到 GitHub。

1. 等待 Mona 检查你的工作，提供反馈，并分享下一课内容，让我们继续努力！

<details>
<summary>遇到问题？🤷</summary><br/>

如果没有收到反馈，请检查以下内容：

- 确保你对以下文件的更改已提交到 `build-octofit-app` 分支并推送/同步到 GitHub：
  - `octofit-tracker/frontend/src/components/Activities.js`，并包含 `-8000.app.github.dev/api/activities/`
  - `octofit-tracker/frontend/src/components/Leaderboard.js`，并包含 `-8000.app.github.dev/api/leaderboard/`
  - `octofit-tracker/frontend/src/components/Teams.js`，并包含 `-8000.app.github.dev/api/teams/`
  - `octofit-tracker/frontend/src/components/Users.js`，并包含 `-8000.app.github.dev/api/users/`
  - `octofit-tracker/frontend/src/components/Workouts.js`，并包含 `-8000.app.github.dev/api/workouts/`
- 如果 Mona 发现了错误，只需修正后再次推送。Mona 会多次检查你的工作。

</details>
