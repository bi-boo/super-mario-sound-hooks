#!/usr/bin/env bash

set -u

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
SOUND_FILE="$1"
VOLUME="${2:-}"
SOUND_PATH="${PLUGIN_ROOT}/sounds/${SOUND_FILE}"

if [ ! -f "${SOUND_PATH}" ]; then
  exit 0
fi

# PID file for single-instance control — kill previous sound before playing new one
PID_FILE="/tmp/super-mario-sound-hooks.${USER:-nobody}.pid"

kill_previous() {
  if [ -f "${PID_FILE}" ]; then
    local old_pid
    old_pid="$(cat "${PID_FILE}" 2>/dev/null)"
    if [ -n "${old_pid}" ] && kill -0 "${old_pid}" 2>/dev/null; then
      kill "${old_pid}" 2>/dev/null
    fi
    rm -f "${PID_FILE}"
  fi
}

play_with_cmd() {
  local cmd="$1"
  shift

  kill_previous

  case "${cmd}" in
    afplay)
      if [ -n "${VOLUME}" ]; then
        "${cmd}" -v "${VOLUME}" "$@" "${SOUND_PATH}" >/dev/null 2>&1 &
      else
        "${cmd}" "$@" "${SOUND_PATH}" >/dev/null 2>&1 &
      fi
      ;;
    *)
      "${cmd}" "$@" "${SOUND_PATH}" >/dev/null 2>&1 &
      ;;
  esac

  echo $! > "${PID_FILE}"
}

case "$(uname -s)" in
  Darwin)
    if command -v afplay >/dev/null 2>&1; then
      play_with_cmd afplay
    fi
    ;;
  Linux)
    if command -v aplay >/dev/null 2>&1; then
      play_with_cmd aplay
    elif command -v paplay >/dev/null 2>&1; then
      play_with_cmd paplay
    fi
    ;;
esac

exit 0
