#!/usr/bin/env bash
# demo-sounds.sh — 按映射顺序同步播放所有音效，展示触发事件与音效对应关系

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
SOUNDS_DIR="${PLUGIN_ROOT}/sounds"
VOLUME="${1:-0.6}"

# 按 hooks.json 中的映射顺序定义
declare -a MAPPING=(
  "SessionStart (startup/resume/clear/compact)|smb_pipe.wav"
  "Stop|coin.wav"
  "Notification.permission_prompt|smb_warning.wav"
  "Notification.elicitation_dialog|powerup.wav"
  "Notification.idle_prompt|1up.wav"
  "PostToolUse.Read|smb_bump.wav"
  "PostToolUse.Grep|smb_stomp.wav"
  "PostToolUse.Glob|glob_search.wav"
  "PostToolUse.WebSearch|web_search.wav"
  "PostToolUse.WebFetch|web_fetch.wav"
  "PostToolUse.Edit|smb_jump-small.wav"
  "PostToolUse.Write|smb_jump-super.wav"
  "PostToolUse.Bash|smb_kick.wav"
  "TaskCompleted|smb_world_clear.wav"
)

play_sync() {
  local sound_file="$1"
  local sound_path="${SOUNDS_DIR}/${sound_file}"

  if [ ! -f "${sound_path}" ]; then
    return 1
  fi

  case "$(uname -s)" in
    Darwin)
      afplay -v "${VOLUME}" "${sound_path}" 2>/dev/null
      ;;
    Linux)
      if command -v aplay >/dev/null 2>&1; then
        aplay "${sound_path}" 2>/dev/null
      elif command -v paplay >/dev/null 2>&1; then
        paplay "${sound_path}" 2>/dev/null
      fi
      ;;
  esac
}

echo "🎮 Super Mario Sound Demo (volume: ${VOLUME})"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

for item in "${MAPPING[@]}"; do
  event="${item%%|*}"
  sound="${item##*|}"
  sound_path="${SOUNDS_DIR}/${sound}"

  if [ -f "${sound_path}" ]; then
    printf "▶ %-42s %s\n" "${event}" "${sound}"
    play_sync "${sound}"
    sleep 0.3
  else
    printf "✗ %-42s %s (missing)\n" "${event}" "${sound}"
  fi
done

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Demo 完成"
