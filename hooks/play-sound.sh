#!/usr/bin/env bash

set -u

if [ "$#" -ne 1 ]; then
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
SOUND_FILE="$1"
SOUND_PATH="${PLUGIN_ROOT}/sounds/${SOUND_FILE}"

if [ ! -f "${SOUND_PATH}" ]; then
  exit 0
fi

play_with_cmd() {
  "$@" "${SOUND_PATH}" >/dev/null 2>&1 &
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
