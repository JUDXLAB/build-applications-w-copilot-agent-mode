## 步骤 3：初始化并创建 octofit_db MongoDB 数据库、Django 项目/应用，更新 Django 项目/应用文件，并填充 MongoDB 数据库

在本步骤中，我们将完成以下内容：

- 设置 octofit_db MongoDB 数据库结构。
- 更新 octofit-tracker/backend/octofit_tracker 应用的相关文件：
  - settings、models、serializers、urls、views、tests 和 admin 文件。
- 用测试数据填充 octofit_db 数据库。
- 验证 octofit_db 数据库中已填充测试数据。

1. 打开 `docs` 文件夹下的所有文件，并在整个练习过程中保持本文件在编辑器中打开。
    1. agent mode 会使用 `mona-high-school-fitness-tracker.md` 和 `octofit_story.md` 作为参考来创建应用程序。
2. 将以下提示复制粘贴到 GitHub Copilot Chat，并在下拉菜单中选择 “Agent”，而不是 “Ask” 或 “Edit”。

> 🪧 **注意：**
- 不要将模型从 GPT-4o 切换为其他模型，这将在课程最后作为可选活动。
- 请记住，Copilot agent mode 是对话式的，它可能会向你提问，你也可以向它提问。
- 等待 Copilot 响应，并点击继续按钮以执行 Copilot agent mode 提供的命令。
- 在 Copilot agent mode 完成前，请保留其创建和更新的文件。
- agent mode 能够评估你的代码库、执行命令，并自动添加/重构/删除代码库中的部分内容，如有错误还能自动修复。

### :keyboard: 活动：设置 Python Django 项目/应用

> ![Static Badge](https://img.shields.io/badge/-Prompt-text?style=flat-square&logo=github%20copilot&labelColor=512a97&color=ecd8ff)
>
> ```prompt
> 参考 docs/mona-high-school-fitness-tracker.md 文件中的 monafit tracker 应用示例，并将 octofit 作为 mergington 高中应用的名称。让我们设置 Python Django 项目/应用并运行服务器。
>
> 1. octofit-tracker/backend 目录将存放名为 octofit-tracker 的 django 项目和应用。
> 2. 为名为 octofit-tracker 的 django 项目/应用设置额外配置。
>
> 在所有这些步骤完成前不要进行下一个活动。
>```

> 🪧 **注意：**
- 等待 Copilot 响应，并点击继续按钮以执行 Copilot agent mode 提供的每个命令。
- 在 Copilot agent mode 完成前，请保留其创建和更新的文件。

> ❕ **重要提示：** 不要按照 Copilot agent mode 建议的方式启动 Python Django 应用，点击 **cancel**。

### :keyboard: 活动：初始化并创建 octofit_db MongoDB 数据库

> ![Static Badge](https://img.shields.io/badge/-Prompt-text?style=flat-square&logo=github%20copilot&labelColor=512a97&color=ecd8ff)
>
> ```prompt
> 参考 docs/mona-high-school-fitness-tracker.md 文件中的 monafit tracker 应用示例，并将 octofit 作为 Merington 高中应用的名称。让我们初始化 octofit_db 数据库。
>
> 1. 初始化 mongo octofit_db 数据库。
> 2. 为 users、teams、activity、leaderboard 和 workouts 集合创建正确的数据表结构。
> 3. 确保 user 集合的主键有唯一 ID。
>   例如：db.users.createIndex({ "email": 1 }, { unique: true })
> 4. 为我执行创建数据库的命令。
> 5. 列出 octofit_db 数据库中的所有集合。
> 
> 在所有这些步骤完成前不要进行下一个活动。
> ```

> ❕ **重要提示：**
- 如果没有“Continue”按钮，只需将 GitHub Copilot Chat 面板左侧拉宽即可出现。
- 如果还是不行，终端没有“Continue”按钮时，你可能需要将响应内容复制粘贴到终端执行。

### :keyboard: Activity: Update the Python Django project/app files

> ![Static Badge](https://img.shields.io/badge/-Prompt-text?style=flat-square&logo=github%20copilot&labelColor=512a97&color=ecd8ff)
>
> ```prompt
> Based on the example monafit tracker app in the docs/mona-high-school-fitness-tracker.md file and use octofit as the name for Merington's high school's app. Let's update the octofit-tracker/backend/octofit_tracker app files.
>
> 1. Update the octofit-tracker/backend/octofit_tracker/settings.py file to include the MongoDB database connection.
> 2. Update the octofit-tracker/backend/octofit_tracker/models.py file to include the models for users, teams, activity, leaderboard, and workouts collections.
> 3. Update the octofit-tracker/backend/octofit_tracker/serializers.py file to include the serializers for users, teams, activity, leaderboard, and workouts collections.
> 4. Update the octofit-tracker/backend/octofit_tracker/urls.py file to include the URLs for users, teams, activity, leaderboard, and workouts collections.
> 5. Update the octofit-tracker/backend/octofit_tracker/views.py file to include the views for users, teams, activity, leaderboard, and workouts collections.
> 6. Update the octofit-tracker/backend/octofit_tracker/tests.py file to include the tests for users, teams, activity, leaderboard, and workouts collections.
> 7. Update the octofit-tracker/backend/octofit_tracker/admin.py file to include the admin for users, teams, activity, leaderboard, and workouts collections.
> 8. Make sure api_root is in octofit-tracker/backend/octofit_tracker/urls.py
> 9. Enable CORS in the octofit-tracker/backend/octofit_tracker/settings.py file to allow cross-origin requests from the frontend React app and allow all origins, methods, and headers.
> 10. Allow all hosts in the settings.py file.
> 11. Install CORS middleware components.
>
> Don't proceed with the next activity until all of these steps are completed.
> ```

> ❕ **Important:** Don't start the Python Django app in the way that GitHub Copilot agent mode suggests hit **cancel**.

### :keyboard: Activity: Populate the octofit_db database with test data from Django project/app files

> ![Static Badge](https://img.shields.io/badge/-Prompt-text?style=flat-square&logo=github%20copilot&labelColor=512a97&color=ecd8ff)
>
> ```prompt
> Based on the example monafit tracker app in the docs/mona-high-school-fitness-tracker.md file and use octofit as the name for Merington's high school's app. Let's populate the octofit_db database with test data. Use the same data from docs/mona-high-school-fitness-tracker.md file.
> 
> 1. Create a test data file in the octofit-tracker/backend/octofit_tracker directory.
> 2. Run makemigrations and migrate the database in a Python virtual environment.
> 3. Populate the octofit_db database with test data for users, teams, activities, leaderboard, and workouts collections based on test data in docs/mona-high-school-fitness-tracker.md octofit-tracker/backend/octofit_tracker/management/commands/populate_db.py.
> 4. Verify the test data is populated in the octofit_db database.
> 
> Don't proceed with the next activity until all of these steps are completed.
> ```

> ❕ **Important:**
- Don't start the Python Django app in the way that GitHub Copilot agent mode suggests hit **cancel**.
- If there is no "Continue" button, just pull the left side of the GitHub Copilot Chat panel over to the left, and it should appear.
- If this doesn't work, you may need to copy and paste the response in the terminal if there is no "Continue" button.

1. Now that we have created the database structure, updated our Django project files, and populated the database, let's check our changes into our `build-octofit-app` branch.

1. With our new changes complete, please **commit** and **push** the changes to GitHub.

1. Wait a moment for Mona to check your work, provide feedback, and share the next lesson so we can keep working!

<details>
<summary>Having trouble? 🤷</summary><br/>

If you don't get feedback, here are some things to check:

- Make sure your commit changes were made for the following files to the branch `build-octofit-app` and pushed/synchronized to GitHub:
  - `octofit-tracker/backend/octofit_tracker/settings.py`
  - `octofit-tracker/backend/octofit_tracker/management/commands/populate_db.py`
- If Mona found a mistake, simply make a correction and push your changes again. Mona will check your work as many times as needed.

</details>
