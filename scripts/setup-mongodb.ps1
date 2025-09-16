<#!
.SYNOPSIS
  Setup MongoDB for OctoFit development on Windows (prefers winget). 
.DESCRIPTION
  Detects available installers (winget). Installs MongoDB Server + Shell if missing.
  Provides verification (creates octofit_db + collections) and status output.
.NOTES
  Run from repository root in an elevated (管理员) PowerShell if install phase needed.
#>

Write-Host "=== OctoFit MongoDB Setup ===" -ForegroundColor Cyan

# --- Config ---
$MongoServiceName = 'MongoDB'
$DbName = 'octofit_db'
$Collections = @('users','teams','activities','leaderboard','workouts')

function Test-Command($name){ Get-Command $name -ErrorAction SilentlyContinue | ForEach-Object { $true } }

function Install-MongoDB {
    if (-not (Test-Command winget)) {
        Write-Host "winget 不可用。请手动安装 MongoDB 或安装 winget 后重试。" -ForegroundColor Yellow
        return
    }
    Write-Host "安装 MongoDB Server (可能需要用户确认)..." -ForegroundColor Green
    winget install -e --id MongoDB.Server --accept-package-agreements --accept-source-agreements
    if ($LASTEXITCODE -ne 0) { Write-Host "MongoDB Server 安装失败" -ForegroundColor Red; return }
    Write-Host "安装 MongoDB Shell (mongosh)..." -ForegroundColor Green
    winget install -e --id MongoDB.Shell --accept-package-agreements --accept-source-agreements
    if ($LASTEXITCODE -ne 0) { Write-Host "MongoDB Shell 安装失败" -ForegroundColor Red; return }
}

function Start-MongoService {
    $svc = Get-Service -Name $MongoServiceName -ErrorAction SilentlyContinue
    if (-not $svc) {
        Write-Host "未发现 $MongoServiceName 服务，可能需要重启或确认安装。" -ForegroundColor Yellow
        return $false
    }
    if ($svc.Status -ne 'Running') {
        Write-Host "启动 MongoDB 服务..." -ForegroundColor Green
        Start-Service $MongoServiceName
        $svc.WaitForStatus('Running','00:00:10') | Out-Null
    }
    Write-Host "MongoDB 服务状态: $((Get-Service $MongoServiceName).Status)" -ForegroundColor Cyan
    return $true
}

function Test-MongoDatabase {
    if (-not (Test-Command mongosh)) { Write-Host "mongosh 不存在，无法验证。" -ForegroundColor Red; return }
    Write-Host "创建/验证数据库及集合..." -ForegroundColor Green
    $collectionsJs = $Collections | ForEach-Object { "db.createCollection('$_');" } | Out-String
    $js = @"
    db = db.getSiblingDB('$DbName');
    $collectionsJs
    printjson(db.getCollectionNames());
"@
    mongosh --quiet --eval $js | Write-Output
}

# --- Main ---
if (-not (Get-Service -Name $MongoServiceName -ErrorAction SilentlyContinue)) {
    Write-Host "MongoDB 似乎尚未安装，开始安装流程..." -ForegroundColor Yellow
    Install-MongoDB
} else {
    Write-Host "检测到已安装 MongoDB。" -ForegroundColor Cyan
}

if (Start-MongoService) {
    Test-MongoDatabase
    Write-Host "完成。" -ForegroundColor Green
} else {
    Write-Host "未能启动或检测服务，脚本结束。" -ForegroundColor Red
    exit 1
}
