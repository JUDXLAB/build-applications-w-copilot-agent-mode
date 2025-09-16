# 入门指南 - 应用前端和后端创建

## 向 GitHub Copilot 说明目标和步骤

```text
我想构建一个 monafit Tracker 应用，包含以下功能：

* 用户认证和个人资料
* 活动记录与追踪
* 团队创建与管理
* 竞赛排行榜
* 个性化锻炼建议

这些功能应集成在一个应用中。

请按以下顺序生成操作指令：

1. 在本仓库的 monafit-tracker 目录结构下，一条命令创建前端和后端
2. 设置后端 python venv，并创建 monafit-tracker/backend/requirements.txt 文件
3. monafit-tracker/backend 目录用于存放 django 项目和名为 monafit-tracker 的 app
4. Django 项目 monafit-tracker 目录包含应用所有后端组件
5. 直接在 monafit_tracker/backend 目录下创建 django app
6. monafit-tracker/frontend 目录用于存放 react app，不要有子目录
7. 安装 react 框架
8. 安装 bootstrap 并导入
9. 通过 'apt-get' 安装 mongodb 的命令
10. 用 'sudo service mongodb start' 和 'sudo service mongodb status' 启动 mongodb 的命令

monafit Tracker App 的目录结构如下
monafit-tracker/
├── backend/
│   ├── venv/
│   ├── monafit_tracker/
│   │   ├── __init__.py
│   │   ├── models.py
│   │   ├── serializers.py
│   │   ├── settings.py
│   │   ├── views.py
│   │   ├── urls.py
│   │   ├── wsgi.py
│   │   └── asgi.py
└── frontend/
    ├── node_modules/
    ├── public/
    ├── src/
    ├── package.json
    └── README.md

创建 requirements.txt，包含以下 Python 依赖包

Django==4.1
djangorestframework==3.14.0
django-allauth==0.51.0
django-cors-headers==4.5.0
dj-rest-auth
djongo==1.3.6
pymongo==3.12
sqlparse==0.2.4
stack-data==0.6.3
sympy==1.12
tenacity==9.0.0
terminado==0.18.1
threadpoolctl==3.5.0
tinycss2==1.3.0
tornado==6.4.1
traitlets==5.14.3
types-python-dateutil==2.9.0.20240906
typing_extensions==4.9.0
tzdata==2024.2
uri-template==1.3.0
urllib3==2.2.3
wcwidth==0.2.13
webcolors==24.8.0
webencodings==0.5.1
websocket-client==1.8.0

所有后端 django app 都在 monafit_tracker 目录下，不要再创建其他 app

使用 Python 虚拟环境，并在本工作区通过 monafit-tracker/backend/requirements.txt 安装所有依赖

monafit-tracker/backend/requirements.txt 已包含所有 Django 依赖。Django、djongo、sqlparse

目录结构不要有冗余的 backend 和 frontend 子目录

前端使用 bootstrap

让我们一步一步思考
```

### 创建 monafit Tracker 结构的命令

```bash
mkdir -p monafit-tracker/{backend,frontend}

python3 -m venv monafit-tracker/backend/venv
source monafit-tracker/backend/venv/bin/activate
pip install -r monafit-tracker/backend/requirements.txt

django-admin startproject monafit_tracker monafit-tracker/backend

npx create-react-app monafit-tracker/frontend

npm install bootstrap monafit-tracker/frontend

echo "import 'bootstrap/dist/css/bootstrap.min.css';" >> src/index.js

sudo apt-get update && sudo apt-get install -y mongodb
sudo service mongodb start && sudo service mongodb status
```

## 初始化数据库，设置数据库并在 settings.py、models、serializers、urls 和 views 中安装 app

在 GitHub Copilot Chat 输入以下提示：

```text
接下来我们一步一步设置如下内容：

1. 初始化 mongo monafit_db 数据库，并为 users、teams、activities、leaderboard 和 workouts 集合创建正确的表结构
2. 确保 user 集合有唯一 id 作为主键
   例如：db.users.createIndex({ "email": 1 }, { unique: true })
3. django 项目的 settings.py 配置 mongodb monafit_db 数据库，包括 localhost 和端口
4. django 项目的 settings.py 配置所有已安装 app，如 djongo、monafit_tracker、rest_framework
5. 在 monafit_tracker 项目下，使用 touch 命令创建 models.py、serializers.py、urls.py 和 views.py，分别用于 users、teams、activity、leaderboard 和 workouts
6. 生成 models.py、serializers.py 和 views.py 的代码
7. 确保 urls.py 有根路由、admin 和 api 端点
    urlpatterns = [
        path('', api_root, name='api-root'),  # 根端点
        path('admin/', admin.site.urls),  # 管理端点
        path('api/', include(router.urls)),  # API 端点
    ]
```

### 初始化和设置 `monafit_db` 的 MongoDB 命令

```bash
mongo --eval "db = db.getSiblingDB('monafit_db'); db.createCollection('users'); db.createCollection('teams'); db.createCollection('activity'); db.createCollection('leaderboard'); db.createCollection('workouts'); db.users.createIndex({ email: 1 }, { unique: true }); db.teams.createIndex({ name: 1 }, { unique: true }); db.activity.createIndex({ activity_id: 1 }, { unique: true }); db.leaderboard.createIndex({ leaderboard_id: 1 }, { unique: true }); db.workouts.createIndex({ workout_id: 1 }, { unique: true });"
```

### 检查数据库集合

```bash
mongo --eval "db = db.getSiblingDB('monafit_db'); printjson(db.getCollectionNames());"
```

### settings.py 示例

```json
# 文件: monafit_tracker/settings.py

"""
monafit_tracker 项目的 Django 配置。

由 'django-admin startproject' 使用 Django 4.1 生成。

关于本文件的更多信息，请参见
https://docs.djangoproject.com/en/4.1/topics/settings/

完整配置项及其值请参见
https://docs.djangoproject.com/en/4.1/ref/settings/
"""

from pathlib import Path

# 构建项目路径
BASE_DIR = Path(__file__).resolve().parent.parent


# 快速启动开发设置 - 不适合生产环境
# https://docs.djangoproject.com/en/4.1/howto/deployment/checklist/

# 生产环境请务必保密密钥！
SECRET_KEY = "django-insecure-25rsll_s*6ml5lv4l$51z6x!y5u_k!11f!hf^1&%q!$syk=ja3"

# 生产环境请关闭 debug！
DEBUG = True

ALLOWED_HOSTS = ['localhost', '127.0.0.1', 'congenial-robot-pwrx4jxpp9c6vjv-8000.app.github.dev']


# 应用定义

INSTALLED_APPS = [
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.messages",
    "django.contrib.staticfiles",
    'rest_framework',
    'djongo',
    'corsheaders',
    'monafit_tracker',
]

MIDDLEWARE = [
    "django.middleware.security.SecurityMiddleware",
    "django.contrib.sessions.middleware.SessionMiddleware",
    "django.middleware.common.CommonMiddleware",
    "django.middleware.csrf.CsrfViewMiddleware",
    "django.contrib.auth.middleware.AuthenticationMiddleware",
    "django.contrib.messages.middleware.MessageMiddleware",
    "django.middleware.clickjacking.XFrameOptionsMiddleware",
    'corsheaders.middleware.CorsMiddleware',
]

ROOT_URLCONF = "monafit_tracker.urls"

TEMPLATES = [
    {
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        "DIRS": [],
        "APP_DIRS": True,
        "OPTIONS": {
            "context_processors": [
                "django.template.context_processors.debug",
                "django.template.context_processors.request",
                "django.contrib.auth.context_processors.auth",
                "django.contrib.messages.context_processors.messages",
            ],
        },
    },
]

WSGI_APPLICATION = "monafit_tracker.wsgi.application"


# 数据库
# https://docs.djangoproject.com/en/4.1/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'djongo',
        'NAME': 'monafit_db',
        'HOST': 'localhost',
        'PORT': 27017,
    }
}


# 密码验证
# https://docs.djangoproject.com/en/4.1/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        "NAME": "django.contrib.auth.password_validation.UserAttributeSimilarityValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.MinimumLengthValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.CommonPasswordValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.NumericPasswordValidator",
    },
]


# 国际化
# https://docs.djangoproject.com/en/4.1/topics/i18n/

LANGUAGE_CODE = "en-us"

TIME_ZONE = "UTC"

USE_I18N = True

USE_TZ = True


# 静态文件（CSS、JavaScript、图片）
# https://docs.djangoproject.com/en/4.1/howto/static-files/

STATIC_URL = "static/"


# 默认主键字段类型
# https://docs.djangoproject.com/en/4.1/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = "django.db.models.BigAutoField"

CORS_ALLOW_ALL_ORIGINS = True
```

### models.py、serializers.py、views.py 和 urls.py 示例代码

#### models.py

```python
# 文件: monafit-tracker/backend/monafit_tracker/models.py

from djongo import models

class User(models.Model):
    _id = models.ObjectIdField()
    username = models.CharField(max_length=100)
    email = models.EmailField(unique=True)
    password = models.CharField(max_length=100)

class Team(models.Model):
    _id = models.ObjectIdField()
    name = models.CharField(max_length=100)
    members = models.ArrayReferenceField(to=User, on_delete=models.CASCADE)

class Activity(models.Model):
    _id = models.ObjectIdField()
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    activity_type = models.CharField(max_length=100)
    duration = models.DurationField()

class Leaderboard(models.Model):
    _id = models.ObjectIdField()
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    score = models.IntegerField()

class Workout(models.Model):
    _id = models.ObjectIdField()
    name = models.CharField(max_length=100)
    description = models.TextField()
```

#### serializers.py

```python
from rest_framework import serializers
from .models import User, Team, Activity, Leaderboard, Workout
from bson import ObjectId

class ObjectIdField(serializers.Field):
    def to_representation(self, value):
        return str(value)

    def to_internal_value(self, data):
        return ObjectId(data)

class UserSerializer(serializers.ModelSerializer):
    _id = ObjectIdField()

    class Meta:
        model = User
        fields = '__all__'

class TeamSerializer(serializers.ModelSerializer):
    _id = ObjectIdField()
    members = UserSerializer(many=True)

    class Meta:
        model = Team
        fields = '__all__'

class ActivitySerializer(serializers.ModelSerializer):
    _id = ObjectIdField()
    user = ObjectIdField()

    class Meta:
        model = Activity
        fields = '__all__'

class LeaderboardSerializer(serializers.ModelSerializer):
    _id = ObjectIdField()
    user = UserSerializer()  # 展开 user 对象

    class Meta:
        model = Leaderboard
        fields = '__all__'

class WorkoutSerializer(serializers.ModelSerializer):
    _id = ObjectIdField()

    class Meta:
        model = Workout
        fields = '__all__'
```

#### views.py

```python
# 文件: monafit-tracker/backend/monafit_tracker/views.py

from rest_framework import viewsets, status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.reverse import reverse
from .serializers import UserSerializer, TeamSerializer, ActivitySerializer, LeaderboardSerializer, WorkoutSerializer
from .models import User, Team, Activity, Leaderboard, Workout

@api_view(['GET', 'POST'])
def api_root(request, format=None):
    if request.method == 'POST':
        return Response({"message": "收到 POST 请求"}, status=status.HTTP_201_CREATED)

    base_url = '[使用 CODESPACE URL]'
    return Response({
        'users': base_url + 'api/users/?format=api',
        'teams': base_url + 'api/teams/?format=api',
        'activities': base_url + 'api/activities/?format=api',
        'leaderboard': base_url + 'api/leaderboard/?format=api',
        'workouts': base_url + 'api/workouts/?format=api'
    })

class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer

class TeamViewSet(viewsets.ModelViewSet):
    queryset = Team.objects.all()
    serializer_class = TeamSerializer

class ActivityViewSet(viewsets.ModelViewSet):
    queryset = Activity.objects.all()
    serializer_class = ActivitySerializer

class LeaderboardViewSet(viewsets.ModelViewSet):
    queryset = Leaderboard.objects.all()
    serializer_class = LeaderboardSerializer

class WorkoutViewSet(viewsets.ModelViewSet):
    queryset = Workout.objects.all()
    serializer_class = WorkoutSerializer
```

#### urls.py

```python
# 文件: monafit-tracker/backend/monafit_tracker/urls.py

from django.contrib import admin
from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import UserViewSet, TeamViewSet, ActivityViewSet, LeaderboardViewSet, WorkoutViewSet, api_root

router = DefaultRouter()
router.register(r'users', UserViewSet)
router.register(r'teams', TeamViewSet)
router.register(r'activities', ActivityViewSet)
router.register(r'leaderboard', LeaderboardViewSet)
router.register(r'workouts', WorkoutViewSet)

urlpatterns = [
    path('', api_root, name='api-root'),  # 根端点
    path('admin/', admin.site.urls),  # 管理端点
    path('api/', include(router.urls)),  # API 端点
]
```

## 用示例数据填充数据库

```text
我们用 manage.py 设置数据库并根据 models.py 字段填充数据

- 创建 populate_db.py 作为 manage.py 命令，初始化并删除旧数据后重建
- populate_db.py 创建 users、teams、activity、leaderboard 和 workouts
- users 用超级英雄用户
- 包含 monafit_tracker 项目的迁移步骤
```

### 创建 populate_db.py 目录结构的命令

```bash
mkdir -p monafit-tracker/backend/monafit_tracker/management/commands
touch monafit-tracker/backend/monafit_tracker/management/__init__.py
touch monafit-tracker/backend/monafit_tracker/management/commands/__init__.py
touch monafit-tracker/backend/monafit_tracker/management/commands/populate_db.py
```

### populate_db.py 示例代码，用于填充数据库

Mergington 体育样例数据，放在 monafit-tracker/backend/monafit_tracker/management/commands/populate_db.py

```python
# 文件: monafit-tracker/backend/monafit_tracker/management/commands/populate_db.py

from django.core.management.base import BaseCommand
from monafit_tracker.models import User, Team, Activity, Leaderboard, Workout
from django.conf import settings
from pymongo import MongoClient
from datetime import timedelta
from bson import ObjectId

class Command(BaseCommand):
    help = '用测试数据填充 users、teams、activity、leaderboard 和 workouts'

    def handle(self, *args, **kwargs):
        # 连接 MongoDB
        client = MongoClient(settings.DATABASES['default']['HOST'], settings.DATABASES['default']['PORT'])
        db = client[settings.DATABASES['default']['NAME']]

        # 删除已有集合
        db.users.drop()
        db.teams.drop()
        db.activity.drop()
        db.leaderboard.drop()
        db.workouts.drop()

        # 创建用户
        users = [
            User(_id=ObjectId(), username='thundergod', email='thundergod@mhigh.edu', password='thundergodpassword'),
            User(_id=ObjectId(), username='metalgeek', email='metalgeek@mhigh.edu', password='metalgeekpassword'),
            User(_id=ObjectId(), username='zerocool', email='zerocool@mhigh.edu', password='zerocoolpassword'),
            User(_id=ObjectId(), username='crashoverride', email='crashoverride@hmhigh.edu', password='crashoverridepassword'),
            User(_id=ObjectId(), username='sleeptoken', email='sleeptoken@mhigh.edu', password='sleeptokenpassword'),
        ]
        User.objects.bulk_create(users)

        # 创建团队
        team = Team(_id=ObjectId(), name='Blue Team')
        team = Team(_id=ObjectId(), name='Gold Team')
        team.save()
        for user in users:
            team.members.add(user)

        # 创建活动
        activities = [
            Activity(_id=ObjectId(), user=users[0], activity_type='Cycling', duration=timedelta(hours=1)),
            Activity(_id=ObjectId(), user=users[1], activity_type='Crossfit', duration=timedelta(hours=2)),
            Activity(_id=ObjectId(), user=users[2], activity_type='Running', duration=timedelta(hours=1, minutes=30)),
            Activity(_id=ObjectId(), user=users[3], activity_type='Strength', duration=timedelta(minutes=30)),
            Activity(_id=ObjectId(), user=users[4], activity_type='Swimming', duration=timedelta(hours=1, minutes=15)),
        ]
        Activity.objects.bulk_create(activities)

        # 创建排行榜条目
        leaderboard_entries = [
            Leaderboard(_id=ObjectId(), user=users[0], score=100),
            Leaderboard(_id=ObjectId(), user=users[1], score=90),
            Leaderboard(_id=ObjectId(), user=users[2], score=95),
            Leaderboard(_id=ObjectId(), user=users[3], score=85),
            Leaderboard(_id=ObjectId(), user=users[4], score=80),
        ]
        Leaderboard.objects.bulk_create(leaderboard_entries)

        # 创建锻炼
        workouts = [
            Workout(_id=ObjectId(), name='Cycling Training', description='Training for a road cycling event')
            Workout(_id=ObjectId(), name='Crossfit', description='Training for a crossfit competition'),
            Workout(_id=ObjectId(), name='Running Training', description='Training for a marathon'),
            Workout(_id=ObjectId(), name='Strength Training', description='Training for strength'),
            Workout(_id=ObjectId(), name='Swimming Training', description='Training for a swimming competition'),
        ]
        Workout.objects.bulk_create(workouts)

        self.stdout.write(self.style.SUCCESS('成功填充测试数据到数据库。'))
```

### 运行以下命令迁移数据库并填充数据

```bash
python monafit-tracker/backend/manage.py monafit-tracker/backend/makemigrations
python monafit-tracker/backend/manage.py monafit-tracker/backend/migrate
python monafit-tracker/backendmanage.py monafit-tracker/backend/populate_db
```

## 使用 Codespace 端点访问 Django REST API

```text
让我们一步一步操作

- 更新 #file:monafit-tracker/backend/monafit_tracker/views.py，将 rest api url 返回值替换为 codespace url http://[REPLACE-THIS-WITH-YOUR-CODESPACE-NAME]-8000.app.github.dev
- 用 [REPLACE-THIS-WITH-YOUR-CODESPACE-NAME] 替换 <codespace-name>
- 启动 Django 服务器

HTTP 200 OK
Allow: GET, HEAD, OPTIONS
Content-Type: application/json
Vary: Accept

{
    "users": "http://localhost:8000/api/users/?format=api",
    "teams": "http://localhost:8000/api/teams/?format=api",
    "activities": "http://localhost:8000/api/activities/?format=api",
    "leaderboard": "http://localhost:8000/api/leaderboard/?format=api",
    "workouts": "http://localhost:8000/api/workouts/?format=api"
}

变为

HTTP 200 OK Allow: GET, HEAD, OPTIONS Content-Type: application/json Vary: Accept

{ 
    "users": "http://<codespace-name>-8000.app.github.dev/api/users/?format=api",
    "teams": "http://<codespace-name>-8000.app.github.dev/api/teams/?format=api",
    "activities": "http://<codespace-name>-8000.app.github.dev/api/activities/?format=api",
    "leaderboard": "http://<codespace-name>-8000.app.github.dev/api/leaderboard/?format=api",
    "workouts": "http://<codespace-name>-8000.app.github.dev/api/workouts/?format=api" 
}
```

## views.py 更新

```python
# 文件: monafit-tracker/backend/monafit_tracker/views.py

from rest_framework import viewsets
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.reverse import reverse
from .serializers import UserSerializer, TeamSerializer, ActivitySerializer, LeaderboardSerializer, WorkoutSerializer
from .models import User, Team, Activity, Leaderboard, Workout

@api_view(['GET'])
def api_root(request, format=None):
    base_url = 'http://[REPLACE-THIS-WITH-YOUR-CODESPACE-NAME]-8000.app.github.dev/'
    return Response({
        'users': base_url + 'api/users/?format=api',
        'teams': base_url + 'api/teams/?format=api',
        'activities': base_url + 'api/activities/?format=api',
        'leaderboard': base_url + 'api/leaderboard/?format=api',
        'workouts': base_url + 'api/workouts/?format=api'
    })

class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer

class TeamViewSet(viewsets.ModelViewSet):
    queryset = Team.objects.all()
    serializer_class = TeamSerializer

class ActivityViewSet(viewsets.ModelViewSet):
    queryset = Activity.objects.all()
    serializer_class = ActivitySerializer

class LeaderboardViewSet(viewsets.ModelViewSet):
    queryset = Leaderboard.objects.all()
    serializer_class = LeaderboardSerializer

class WorkoutViewSet(viewsets.ModelViewSet):
    queryset = Workout.objects.all()
    serializer_class = WorkoutSerializer
```

## 通过 manage.py 启动服务器

```bash
python manage.py runserver
```

## 设置前端 React 应用，使用如下 package.json

```bash
mkdir -p monafit-tracker/frontend

npx create-react-app monafit-tracker/frontend

npm install bootstrap --prefix monafit-tracker/frontend

echo "import 'bootstrap/dist/css/bootstrap.min.css';" >> src/index.js

npm install react-router-dom --prefix monafit-tracker/frontend
```

### package.json

```json
{
  "name": "octofit-tracker",
  "version": "0.1.0",
  "private": true,
  "dependencies": {
    "@testing-library/dom": "^9.3.1",
    "@testing-library/jest-dom": "^6.1.5",
    "@testing-library/react": "^14.1.2",
    "@testing-library/user-event": "^14.5.1",
    "bootstrap": "^5.3.2",
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-router-dom": "^6.21.0",
    "react-scripts": "5.0.1",
    "web-vitals": "^2.1.4"
  },
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject"
  },
  "eslintConfig": {
    "extends": [
      "react-app",
      "react-app/jest"
    ]
  },
  "browserslist": {
    "production": [
      ">0.2%",
      "not dead",
      "not op_mini all"
    ],
    "development": [
      "last 1 chrome version",
      "last 1 firefox version",
      "last 1 safari version"
    ]
  }
}
```

## monafit App 组件

创建以下组件

- Users
- Activities
- Teams
- Leaderboard
- Workouts
- Login
- Register
- Profile
- Dashboard
- Settings
- Home

基础用户名密码认证即可

### App.js

```javascript
import React from 'react';
import { BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom';
import Activities from './components/Activities';
import Leaderboard from './components/Leaderboard';
import Teams from './components/Teams';
import Users from './components/Users';
import Workouts from './components/Workouts';
import './App.css';

function App() {
  return (
    <Router>
      <div className="container">
        <nav className="navbar navbar-expand-lg navbar-light bg-light">
          <div className="container-fluid">
            <Link className="navbar-brand" to="/">OctoFit Tracker</Link>
            <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
              <span className="navbar-toggler-icon"></span>
            </button>
            <div className="collapse navbar-collapse" id="navbarNav">
              <ul className="navbar-nav">
                <li className="nav-item">
                  <Link className="nav-link" to="/activities">Activities</Link>
                </li>
                <li className="nav-item">
                  <Link className="nav-link" to="/leaderboard">Leaderboard</Link>
                </li>
                <li className="nav-item">
                  <Link className="nav-link" to="/teams">Teams</Link>
                </li>
                <li className="nav-item">
                  <Link className="nav-link" to="/users">Users</Link>
                </li>
                <li className="nav-item">
                  <Link className="nav-link" to="/workouts">Workouts</Link>
                </li>
              </ul>
            </div>
          </div>
        </nav>
        <div className="mt-4">
          <Routes>
            <Route path="/activities" element={<Activities />} />
            <Route path="/leaderboard" element={<Leaderboard />} />
            <Route path="/teams" element={<Teams />} />
            <Route path="/users" element={<Users />} />
            <Route path="/workouts" element={<Workouts />} />
            <Route path="/" element={<h1>欢迎使用 OctoFit Tracker</h1>} />
          </Routes>
        </div>
      </div>
    </Router>
  );
}

export default App;
```

### index.js 可能的 React 版本问题

报错提示 ReactDOM.render 不可用，因为 React 18 引入了新的 root API。

修复方法：将 src/index.js 更新为 React 18 的 createRoot API。如下：

```javascript
import React from 'react';
import ReactDOM from 'react-dom/client'; // 使用新 root API
import './index.css';
import App from './App';
import 'bootstrap/dist/css/bootstrap.min.css';

const root = ReactDOM.createRoot(document.getElementById('root')); // 创建 root
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
```

### 示例排行榜组件

API 端点始终使用 Codespace URL

```javascript
import React, { useEffect, useState } from 'react';

function Leaderboard() {
  const [leaderboard, setLeaderboard] = useState([]);

  useEffect(() => {
    fetch('https://congenial-robot-pwrx4jxpp9c6vjv-8000.app.github.dev/api/leaderboard/')
      .then(response => response.json())
      .then(data => setLeaderboard(data))
      .catch(error => console.error('获取排行榜出错:', error));
  }, []);

  return (
    <div>
      <h1>排行榜</h1>
      <table>
        <thead>
          <tr>
            <th>用户名</th>
            <th>分数</th>
          </tr>
        </thead>
        <tbody>
          {leaderboard.map(entry => (
            <tr key={entry._id}>
              <td>{entry.user.username}</td>
              <td>{entry.score}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

export default Leaderboard;
```

## App.css 示例

```css
/* 通用样式 */
body {
  font-family: 'Roboto', sans-serif;
  background-color: #f0f8ff; /* 浅蓝色背景 */
  margin: 0;
  padding: 0;
}

.App {
  text-align: center;
}

/* 导航样式 */
nav {
  background-color: #4682b4; /* 钢蓝色 */
  padding: 1rem;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

nav ul {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex;
  justify-content: center;
}

nav ul li {
  margin: 0 1rem;
}

nav ul li a {
  color: #0f0be4; /* 白色文本 */
  text-decoration: none;
  font-weight: bold;
  font-size: 1.2rem;
  transition: color 0.3s;
}

nav ul li a:hover {
  color: #f0f8ff; /* 浅蓝色 */
  text-decoration: underline;
}

/* 组件样式 */
h1 {
  color: #00008b; /* 深蓝色标题 */
  font-size: 2.5rem;
  margin-bottom: 1rem;
}

/* 表格样式 */
table {
  width: 90%;
  margin: 1rem auto;
  border-collapse: collapse;
  background-color: #ffffff; /* 白色背景 */
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  border-radius: 8px;
  overflow: hidden;
}

table th, table td {
  border: 1px solid #ddd;
  padding: 1rem;
  text-align: left;
  font-size: 1rem;
}

table th {
  background-color: #4682b4; /* 钢蓝色 */
  color: white;
  font-size: 1.2rem;
}

table tr:nth-child(even) {
  background-color: #f0f8ff; /* 浅蓝色 */
}

table tr:hover {
  background-color: #e0ffff; /* 浅青色 */
}

ul {
  list-style: none;
  padding: 0;
}

ul li {
  color: #4682b4; /* 钢蓝色文本 */
  background-color: #fff;
  margin: 0.5rem 0;
  padding: 1rem;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  font-size: 1.1rem;
}

/* 文本样式 */
.component-text {
  color: #00008b; /* 深蓝色居中标题 */
  font-size: 1.8rem;
  margin-bottom: 1rem;
}

/* 按钮样式 */
button {
  background-color: #4682b4; /* 钢蓝色 */
  color: white;
  border: none;
  padding: 0.75rem 1.5rem;
  border-radius: 8px;
  font-size: 1rem;
  cursor: pointer;
  transition: background-color 0.3s;
}

button:hover {
  background-color: #5a9bd4; /* 更浅的钢蓝色 */
}

.App-logo {
  height: 40vmin;
  pointer-events: none;
}

@media (prefers-reduced-motion: no-preference) {
  .App-logo {
    animation: App-logo-spin infinite 20s linear;
  }
}

.App-header {
  background-color: #2b2834;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  font-size: calc(10px + 2vmin);
  color: white;
}

.App-link {
  color: #61dafb;
}

@keyframes App-logo-spin {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}
```
