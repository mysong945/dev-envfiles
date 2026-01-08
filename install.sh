#!/usr/bin/env bash
set -e

# ===============================
# 基本变量
# ===============================
REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="$HOME/.config/dev-envfiles"
ZSH_TARGET="$TARGET_DIR/zsh"
ZSHRC="$HOME/.zshrc"
OMZ_DIR="$HOME/.oh-my-zsh"

echo "▶ Dev Env Zsh Setup"
echo "▶ Repo: $REPO_ROOT"

# ===============================
# 1. 检查 zsh
# ===============================
if ! command -v zsh >/dev/null 2>&1; then
  echo "✗ zsh 未安装，请先安装 zsh"
  exit 1
fi

# ===============================
# 2. 安装 Oh My Zsh（如未安装）
# ===============================
if [ ! -d "$OMZ_DIR" ]; then
  echo "▶ 安装 Oh My Zsh..."
  RUNZSH=no CHSH=no \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "✓ Oh My Zsh 已安装，跳过"
fi

# ===============================
# 3. 创建目标目录
# ===============================
mkdir -p "$ZSH_TARGET"

# ===============================
# 4. 同步 zsh 配置文件
# ===============================
echo "▶ 同步 zsh 配置文件..."

cp "$REPO_ROOT/zsh/base.zsh" "$ZSH_TARGET/base.zsh"
cp "$REPO_ROOT/zsh/global_functions.zsh" "$ZSH_TARGET/global_functions.zsh"

echo "✓ base.zsh / global_functions.zsh 已更新"

# ===============================
# 5. 注入 ~/.zshrc
# ===============================
MARK_BEGIN="# >>> dev-envfiles >>>"
MARK_END="# <<< dev-envfiles <<<"

if grep -q "$MARK_BEGIN" "$ZSHRC" 2>/dev/null; then
  echo "✓ ~/.zshrc 已配置 dev-envfiles，跳过注入"
else
  echo "▶ 写入 ~/.zshrc"

  cat >> "$ZSHRC" <<EOF

$MARK_BEGIN
# Dev envfiles
if [ -f "$ZSH_TARGET/base.zsh" ]; then
  source "$ZSH_TARGET/base.zsh"
fi

if [ -f "$ZSH_TARGET/global_functions.zsh" ]; then
  source "$ZSH_TARGET/global_functions.zsh"
fi
$MARK_END
EOF
fi

# ===============================
# 6. 提示
# ===============================
echo
echo "✔ 安装完成"
echo "▶ 请执行: source ~/.zshrc 或重新打开终端"
