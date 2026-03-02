#!/usr/bin/env bash

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

STATE_KEY_SOURCE="${CLAUDE_SESSION_ID:-${CLAUDE_PROJECT_DIR:-$PWD}}"
STATE_KEY="$(printf "%s" "${STATE_KEY_SOURCE}" | shasum | awk '{print $1}')"
STATE_FILE="/tmp/super-mario-sound-hooks.${USER}.${STATE_KEY}.taskcompleted"

if [ -f "${STATE_FILE}" ]; then
  "${PLUGIN_ROOT}/hooks/play-sound.sh" "smb_world_clear.wav" "0.6"
  rm -f "${STATE_FILE}"
fi

exit 0
