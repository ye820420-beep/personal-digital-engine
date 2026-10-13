#!/usr/bin/env bash
#
# personal-digital-engine — installer
#
#   curl -fsSL https://raw.githubusercontent.com/ye820420-beep/personal-digital-engine/main/install.sh | bash
#
# or, from a clone:
#
#   git clone --depth 1 https://github.com/ye820420-beep/personal-digital-engine.git
#   cd personal-digital-engine && ./install.sh
#
# Usage: ./install.sh [auto|all|claude|codex|workbuddy|cursor|here]
#
#   auto (default)  install into every AI tool already present on this machine
#   all             create the skills dir even if the tool is not installed
#   claude|codex|workbuddy|cursor   install into that one tool only
#   here            just drop 个人数字化引擎.md in the current directory
#                   (for 豆包 / 元宝 / DeepSeek / ChatGPT web, which take an upload)
#
# The script copies one file. It uploads nothing, sends nothing, and asks for
# no keys.

set -euo pipefail

REPO="https://github.com/ye820420-beep/personal-digital-engine.git"
NAME="personal-digital-engine"
FILE_IN_REPO="skills/个人数字化引擎.md"

TMP_DIR=""
cleanup() { [ -n "$TMP_DIR" ] && rm -rf "$TMP_DIR"; }
trap cleanup EXIT

# ---------- locate the skill file ----------
SRC="$FILE_IN_REPO"
if [ ! -f "$SRC" ]; then
  SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd)/$FILE_IN_REPO"
fi
if [ ! -f "$SRC" ]; then
  echo ">> 本地没有仓库，先克隆一份到临时目录…"
  TMP_DIR="$(mktemp -d)"
  git clone --depth 1 "$REPO" "$TMP_DIR/repo" >/dev/null 2>&1
  SRC="$TMP_DIR/repo/$FILE_IN_REPO"
fi
if [ ! -f "$SRC" ]; then
  echo "找不到技能文件：$FILE_IN_REPO"
  echo "直接从这里下载也行："
  echo "  https://github.com/ye820420-beep/personal-digital-engine/blob/main/skills/%E4%B8%AA%E4%BA%BA%E6%95%B0%E5%AD%97%E5%8C%96%E5%BC%95%E6%93%8E.md"
  exit 1
fi

install_one() {
  local root="$1" label="$2"
  if [ "$MODE" != "all" ] && [ ! -d "$root" ]; then
    echo "  - $label 未安装（$root 不存在，跳过）"
    return
  fi
  mkdir -p "$root/skills/$NAME"
  cp "$SRC" "$root/skills/$NAME/SKILL.md"
  echo "  ✔ $label  →  $root/skills/$NAME/SKILL.md"
}

MODE="${1:-auto}"

echo ""
echo "个人数字化引擎 · 安装（$MODE）"
echo ""

case "$MODE" in
  claude)   install_one "${CLAUDE_CONFIG_DIR:-$HOME/.claude}" "Claude Code" ;;
  codex)    install_one "$HOME/.codex"      "Codex" ;;
  workbuddy)install_one "$HOME/.workbuddy"  "WorkBuddy" ;;
  cursor)   install_one "$HOME/.cursor"     "Cursor" ;;
  all)
    install_one "${CLAUDE_CONFIG_DIR:-$HOME/.claude}" "Claude Code"
    install_one "$HOME/.codex"      "Codex"
    install_one "$HOME/.workbuddy"  "WorkBuddy"
    install_one "$HOME/.cursor"     "Cursor"
    ;;
  here) ;;
  auto)
    install_one "${CLAUDE_CONFIG_DIR:-$HOME/.claude}" "Claude Code"
    install_one "$HOME/.codex"      "Codex"
    install_one "$HOME/.workbuddy"  "WorkBuddy"
    install_one "$HOME/.cursor"     "Cursor"
    ;;
  *)
    echo "用法: ./install.sh [auto|all|claude|codex|workbuddy|cursor|here]"
    exit 1
    ;;
esac

# 聊天式 AI 没有"安装"这个概念，给它们留一份现成的文件
if [ "$MODE" = "here" ]; then
  cp "$SRC" "./个人数字化引擎.md"
  echo "  ✔ 当前目录  →  ./个人数字化引擎.md"
  echo ""
  echo "把这一个文件拖进豆包 / 元宝 / DeepSeek / ChatGPT / Claude 的对话框，说「装这个」即可。"
fi

echo ""
echo "──────────────────────────────────────────"
echo "装好了。之后每次开新对话，对 AI 先说这一句（开机语）："
echo ""
echo "  你装了《个人数字化引擎》。先读 流水账-YYYY-MM.md 和 我的档案.md，"
echo "  然后回我三行：本月记了多少条 / 断更了几天 / 今天该补记什么。"
echo "  之后我说什么你就记什么，只回三行，别多说。"
echo ""
echo "第一次用：说「跑一遍样例」，60 秒看到成品；觉得行，说「开始」。"
echo "──────────────────────────────────────────"
echo ""
