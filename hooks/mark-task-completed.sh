#!/usr/bin/env bash

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

STATE_KEY_SOURCE="${CLAUDE_SESSION_ID:-${CLAUDE_PROJECT_DIR:-$PWD}}"
STATE_KEY="$(printf "%s" "${STATE_KEY_SOURCE}" | shasum | awk '{print $1}')"
STATE_FILE="/tmp/super-mario-sound-hooks.${USER}.${STATE_KEY}.taskcompleted"

# 只做“本轮出现过任务完成”标记，不直接播放音效
: > "${STATE_FILE}"

exit 0
