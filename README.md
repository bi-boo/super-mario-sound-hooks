# super-mario-sound-hooks

为 Claude Code 的常见 Hook 事件播放经典马里奥音效。

## 功能概览

本插件覆盖以下事件：

- `Stop`
- `Notification`（`permission_prompt` / `elicitation_dialog` / `idle_prompt`）
- `PostToolUse`（`Edit` / `Write` / `Bash`）
- `SubagentStop`
- `TaskCompleted`

## 目录结构

```text
super-mario-sound-hooks/
├── .claude-plugin/
│   └── plugin.json
├── hooks/
│   ├── hooks.json
│   └── play-sound.sh
├── sounds/
│   ├── coin.wav
│   ├── smb_warning.wav
│   ├── powerup.wav
│   ├── 1up.wav
│   ├── smb_jump-small.wav
│   ├── smb_jump-super.wav
│   ├── smb_kick.wav
│   ├── smb_pipe.wav
│   └── smb_world_clear.wav
├── commands/
│   └── mario-sounds.md
├── skills/
│   └── mario-sounds/
│       └── SKILL.md
├── LICENSE
└── README.md
```

## 安装

1. 将目录放到：

   `~/.claude/plugins/skills/super-mario-sound-hooks/`

2. 确保脚本有执行权限：

   ```bash
   chmod +x ~/.claude/plugins/skills/super-mario-sound-hooks/hooks/play-sound.sh
   ```

3. 重启 Claude Code 会话。

## 音效对照表

| 事件 | 匹配器 | 音效 |
|---|---|---|
| Stop | - | `coin.wav` |
| Notification | `permission_prompt` | `smb_warning.wav` |
| Notification | `elicitation_dialog` | `powerup.wav` |
| Notification | `idle_prompt` | `1up.wav` |
| PostToolUse | `Edit` | `smb_jump-small.wav` |
| PostToolUse | `Write` | `smb_jump-super.wav` |
| PostToolUse | `Bash` | `smb_kick.wav` |
| SubagentStop | - | `smb_pipe.wav` |
| TaskCompleted | - | `smb_world_clear.wav` |

## 自定义音效

- 直接替换 `sounds/` 下同名 `.wav` 文件即可（推荐）。
- 如果改了文件名，需要同步修改 `hooks/hooks.json` 中对应命令参数。

## 跨平台支持

`hooks/play-sound.sh` 自动识别系统并选择播放器：

- macOS: `afplay`
- Linux: `aplay`（优先）或 `paplay`

播放在后台执行，不阻塞 Claude Code。

## 版权说明

`sounds/` 中音效来自 Super Mario 系列素材。请在分享或商用前自行确认对应素材授权范围。
