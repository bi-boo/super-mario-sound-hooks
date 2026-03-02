---
name: mario-sounds
description: Use when user wants to view, test, or customize Super Mario hook sound mappings in this plugin.
version: 1.0.0
---

# Mario Sounds Skill

This skill explains and manages the `super-mario-sound-hooks` plugin sound mappings.

## What this plugin does

It plays Mario sound effects for Claude Code hook events:

- Stop → `coin.wav` + （若本轮有 TaskCompleted）`smb_world_clear.wav`
- Notification.permission_prompt → `smb_warning.wav`
- Notification.elicitation_dialog → `powerup.wav`
- Notification.idle_prompt → `1up.wav`
- PostToolUse.Read → `smb_bump.wav`
- PostToolUse.Grep → `smb_stomp.wav`
- PostToolUse.Edit → `smb_jump-small.wav`
- PostToolUse.Write → `smb_jump-super.wav`
- PostToolUse.Bash → `smb_kick.wav`
- TaskCompleted → 内部打标记（`smb_world_clear.wav` 延迟到下一个 Stop 时播放）

## If user asks to test sounds

Use the shared script:

```bash
"${CLAUDE_PLUGIN_ROOT}/hooks/play-sound.sh" "<sound-file-name>"
```

Example:

```bash
"${CLAUDE_PLUGIN_ROOT}/hooks/play-sound.sh" "coin.wav"
```

## If user asks to customize sounds

1. Replace target file in `sounds/` with another `.wav` file.
2. Keep file name unchanged for zero-config replacement.
3. If file name changes, update `hooks/hooks.json` to match.

## Constraints

- Keep filenames ASCII + `.wav`.
- Keep `hooks/play-sound.sh` as the single playback entry.
- Keep commands non-blocking (background playback).
