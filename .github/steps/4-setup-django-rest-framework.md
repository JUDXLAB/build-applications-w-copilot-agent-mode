> 
> 1. Activate the Python virtual environment.
> 2. Update #file:octofit-tracker/backend/octofit_tracker/views.py to replace the return for the REST API URL endpoints with the codespace URL https://[REPLACE-THIS-WITH-YOUR-CODESPACE-NAME]-8000.app.github.dev for Django and avoid certificate HTTPS issues.
> 3. Make sure the Django backend works on [REPLACE-THIS-WITH-YOUR-CODESPACE-NAME]-8000.app.github.dev and localhost:8000.
> 4. Test the API endpoints using curl command.
> 5. Allow host access to codespace URL and localhost:8000.
>
> Don't proceed with the next activity until all of these steps are completed.
>```
## 步骤 4：设置 Django REST Framework，启动服务器并测试 API

在本步骤中，我们将完成以下内容：

- 设置 Django REST Framework。
- 启动服务器。
- 使用 curl 测试 API。

1. 打开 `docs` 文件夹下的所有文件，并在整个练习过程中保持本文件在编辑器中打开。
    1. agent mode 会使用 `mona-high-school-fitness-tracker.md` 和 `octofit_story.md` 作为参考来创建应用程序。
2. 将以下提示复制粘贴到 GitHub Copilot Chat，并在下拉菜单中选择 “Agent”，而不是 “Ask” 或 “Edit”。

> 🪧 **注意：**
- 不要将模型从 GPT-4o 切换为其他模型，这将在课程最后作为可选活动。
- 请记住，Copilot agent mode 是对话式的，它可能会向你提问，你也可以向它提问。
- 等待 Copilot 响应，并点击继续按钮以执行 Copilot agent mode 提供的命令。
- 在 Copilot agent mode 完成前，请保留其创建和更新的文件。
- agent mode 能够评估你的代码库、执行命令，并自动添加/重构/删除代码库中的部分内容，如有错误还能自动修复。

### :keyboard: 活动：设置 Django REST Framework，重启服务器并测试 API

> 🪧 **注意：**
- 请务必将 [REPLACE-THIS-WITH-YOUR-CODESPACE-NAME] 替换为你的 codespace 名称。
  - 例如：redesigned-spork-g6pj46rr9hpp6x
- 你可以在终端运行以下命令获取 codespace 名称：`echo $CODESPACE_NAME`。

> ![Static Badge](https://img.shields.io/badge/-Prompt-text?style=flat-square&logo=github%20copilot&labelColor=512a97&color=ecd8ff)
>
> ```prompt
> 参考 docs/mona-high-school-fitness-tracker.md 文件中的 monafit tracker 应用示例，并将 octofit 作为 Mergington 高中应用的名称。让我们为 URL 设置 codespace，通过 VS Code 的 launch.json 启动服务器，并测试 API。
> 
> 1. 激活 Python 虚拟环境。
> 2. 更新 #file:octofit-tracker/backend/octofit_tracker/views.py，将 REST API URL 端点的返回值替换为 codespace URL https://[REPLACE-THIS-WITH-YOUR-CODESPACE-NAME]-8000.app.github.dev，以避免 Django 的 HTTPS 证书问题。
> 3. 确保 Django 后端能在 [REPLACE-THIS-WITH-YOUR-CODESPACE-NAME]-8000.app.github.dev 和 localhost:8000 上正常工作。
> 4. 使用 curl 命令测试 API 端点。
> 5. 允许主机访问 codespace URL 和 localhost:8000。
>
> 在所有这些步骤完成前不要进行下一个活动。
>```

> ❕ **重要提示：** 不要按照 Copilot agent mode 建议的方式启动 Python Django 应用，点击 **cancel**，请按照下一个活动操作。

### :keyboard: 活动：启动 Python Django 应用并检查输出
现在，让我们实际运行 Django 应用！在左侧边栏选择 `运行和调试` 选项卡，然后点击 **开始调试** 图标。

<img src="https://github.com/user-attachments/assets/baef4dfe-0751-45cb-9e16-8ff26ba9ff58" width=30% height=30%>

> ❕ **重要提示：**
- 请务必将 [REPLACE-THIS-WITH-YOUR-CODESPACE-NAME] 替换为你的 codespace 名称。
- 例如：redesigned-spork-g6pj46rr9hpp6x
- 你可以在终端运行以下命令获取 codespace 名称：`echo $CODESPACE_NAME`。

1. 现在我们已经将 Django 产品更新为包含 codespace 名称的 URL 端点，
   让我们将更改提交到 `build-octofit-app` 分支。

1. 完成新更改后，请 **commit** 并 **push** 到 GitHub。

1. 等待 Mona 检查你的工作，提供反馈，并分享下一课内容，让我们继续努力！

<details>
<summary>Having trouble? 🤷</summary><br/>

If you don't get feedback, here are some things to check:

- Make sure your commit changes were made for the following files to the branch `build-octofit-app` and pushed/synchronized to GitHub:
  - `octofit-tracker/backend/octofit_tracker/settings.py`
  - `octofit-tracker/backend/octofit_tracker/views.py`
- If Mona found a mistake, simply make a correction and push your changes again. Mona will check your work as many times as needed.

</details>
