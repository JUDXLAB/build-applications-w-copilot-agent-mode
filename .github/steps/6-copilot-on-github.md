
## 步骤 6：在拉取请求中使用 GitHub Copilot

恭喜你！你已经完成了本次练习的编码部分（以及 VS Code 操作）。现在是时候合并我们的工作了。:tada: 最后，让我们了解两个可以加速拉取请求的 Copilot 限定功能！

#### Copilot 拉取请求摘要

通常，你需要回顾笔记和提交信息，然后为拉取请求编写摘要。这可能会花费一些时间，尤其是当提交信息不一致或代码缺乏文档时。幸运的是，Copilot 可以自动分析拉取请求中的所有更改，提供重要亮点，并附带引用！

> [!注意]  
> **Copilot Free** 版本不可用此功能。[[文档]](https://docs.github.com/en/enterprise-cloud@latest/copilot/using-github-copilot/using-github-copilot-for-pull-requests/creating-a-pull-request-summary-with-github-copilot)

#### Copilot 代码审查

多一双眼总是好的，让我们请 Copilot 先做一次初步审查，然后再进行常规的同伴评审。Copilot 擅长发现常见错误并给出简单修正建议，但请务必负责任地使用。

> [!注意]  
> 该功能对组织处于**公开预览**阶段。[[文档]](https://docs.github.com/en/copilot/using-github-copilot/code-review/using-copilot-code-review)

### :keyboard: 活动：用 Copilot 总结和审查 PR

**拉取请求摘要**和**copilot 代码审查**都为限定访问，因此本活动大多为可选。如果你有权限，Mona 会很乐意帮你检查！如果没有，可以跳过这些可选步骤。

1. 在浏览器中打开新标签页，进入你的练习仓库。

1. 你可能会看到一个**通知横幅**，建议你创建新的拉取请求。点击它，或在顶部使用 **Pull Requests** 标签创建新拉取请求。请使用以下信息：

   - **base:** `main`
   - **compare:** `build-octofit-app`
   - **title:** `Add registration validation and more activities`

1. （可选）在 **Add a description** 区域，如有需要进入编辑模式，然后点击 **Copilot actions** 图标并选择 **Summary**。稍等片刻，Copilot 会自动添加描述。:memo:

   <img alt="Copilot summarize button " width="300px" src="https://github.com/user-attachments/assets/3fc5fab4-db03-4ab8-8a16-cdd71ec2ded0">

1. （可选）在右侧信息面板顶部，找到 **Reviewers** 区域，点击带有 **Copilot 图标**的 **Request** 按钮。稍等片刻，Copilot 会为你的拉取请求添加审查评论！

   <img alt="Copilot review button" width="300px" src="https://github.com/user-attachments/assets/39b15002-a235-4c25-b09d-6a8097e27b62">

   > **提示：** 你会看到 Copilot 被请求审查的日志记录。

1. 在底部点击 **Merge pull request** 按钮。干得漂亮！你全部完成了！:tada:

1. 等待 Mona 检查你的工作，提供反馈，并在本课最后发布最终审查！
