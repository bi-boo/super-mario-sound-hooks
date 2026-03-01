---
description: 查看 super-mario-sound-hooks 音效映射并可选测试播放
argument-hint: [list|test <sound-file.wav>|all]
allowed-tools: [Read, Bash]
---

# /mario-sounds

用于查看当前音效映射，或测试单个/全部音效。

## 用法

- `/mario-sounds`
- `/mario-sounds list`
- `/mario-sounds test coin.wav`
- `/mario-sounds all`

## 音效映射

- Stop → `coin.wav`
- Notification.permission_prompt → `smb_warning.wav`
- Notification.elicitation_dialog → `powerup.wav`
- Notification.idle_prompt → `1up.wav`
- PostToolUse.Edit → `smb_jump-small.wav`
- PostToolUse.Write → `smb_jump-super.wav`
- PostToolUse.Bash → `smb_kick.wav`
- SubagentStop → `smb_pipe.wav`
- TaskCompleted → `smb_world_clear.wav`

## 执行逻辑

1. 默认或 `list`：只展示映射表和可用音效文件。
2. `test <file>`：调用 `hooks/play-sound.sh <file>` 播放指定音效。
3. `all`：按映射顺序逐个调用 `hooks/play-sound.sh` 测试播放。

## 测试命令

统一使用：

```bash
"${CLAUDE_PLUGIN_ROOT}/hooks/play-sound.sh" "<sound-file.wav>"
```
