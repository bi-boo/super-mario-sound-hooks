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

play_with_cmd() {
  local cmd="$1"
  shift

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
