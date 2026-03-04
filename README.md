# 🍄 Super Mario Sound Hooks for Claude Code

> It's-a me, Mario! Turn your Claude Code session into a retro gaming experience.
>
> 让 Claude Code 的每一个操作都响起马里奥的经典音效！

[中文](#-中文) · [English](#-english)

---

## 🇨🇳 中文

### 这是什么？

**Super Mario Sound Hooks** 是一个 Claude Code 插件，把经典超级马里奥的音效绑定到 Claude 的各种操作事件上。读文件、执行命令、完成任务——每一步都有专属的 8-bit 音效相伴，让写代码变成一场像素冒险。

告别沉默的终端，开始你的马里奥之旅！🌟

### 音效对照表

| 事件 | 触发条件 | 音效文件 | 感觉像 |
|---|---|---|---|
| `SessionStart` | 启动 / 恢复 / clear / compact | `smb_pipe.wav` | 钻进传送管 |
| `Stop` | Claude 完成本次回复 | `coin.wav` | 捡到金币！ |
| `Notification` | `permission_prompt` | `smb_warning.wav` | 前方有危险 |
| `Notification` | `elicitation_dialog` | `powerup.wav` | 吃到了蘑菇 |
| `Notification` | `idle_prompt` | `1up.wav` | 额外生命！ |
| `PostToolUse` | `Read` 读文件 | `smb_bump.wav` | 撞到砖块 |
| `PostToolUse` | `Grep` 搜索 | `smb_stomp.wav` | 踩扁栗宝宝 |
| `PostToolUse` | `Glob` 文件匹配 | `glob_search.wav` | 扫描地图 |
| `PostToolUse` | `WebSearch` 搜网页 | `web_search.wav` | 探索新世界 |
| `PostToolUse` | `WebFetch` 抓内容 | `web_fetch.wav` | 取回宝物 |
| `PostToolUse` | `Edit` 编辑文件 | `smb_jump-small.wav` | 小跳 |
| `PostToolUse` | `Write` 写文件 | `smb_jump-super.wav` | 超级大跳！ |
| `PostToolUse` | `Bash` 执行命令 | `smb_kick.wav` | 踢出龟壳 |
| `TaskCompleted` | 任务完成 | `smb_world_clear.wav` | 通关！🎉 |

### 安装方法

**第一步** — 将仓库克隆到本地插件目录：

```bash
git clone https://github.com/bi-boo/super-mario-sound-hooks \
  ~/.claude/plugins/localdev/super-mario-sound-hooks
```

**第二步** — 给脚本赋予执行权限：

```bash
chmod +x ~/.claude/plugins/localdev/super-mario-sound-hooks/hooks/*.sh
```

**第三步** — 重启 Claude Code 会话，听到传送管音效就说明安装成功了 🎵

### 内置命令

安装后，可在 Claude Code 中使用 `/mario-sounds` 斜杠指令：

| 命令 | 说明 |
|---|---|
| `/mario-sounds` 或 `/mario-sounds list` | 查看所有音效映射 |
| `/mario-sounds test coin.wav` | 试听指定音效 |
| `/mario-sounds all` | 按顺序播放全部音效 demo |

### 自定义

**替换音效文件** — 直接把 `sounds/` 目录下的 `.wav` 文件替换成你喜欢的音效，保持文件名不变即可生效。

**修改事件映射** — 编辑 `hooks/hooks.json`，将任意事件指向不同的音效文件，也可以调整音量（范围 0.0–1.0）。

**新增事件** — Claude Code 支持更多 Hook 类型，查阅 [Claude Code hooks 文档](https://docs.anthropic.com/en/docs/claude-code/hooks) 自行扩展。

### 跨平台支持

`play-sound.sh` 脚本会自动识别操作系统并选择合适的播放器：

| 平台 | 播放器 |
|---|---|
| macOS | `afplay`（支持音量控制） |
| Linux | `aplay`（优先）或 `paplay` |

所有音效均在后台播放，不会阻塞 Claude Code 的正常运行。

### 音效版权说明

`sounds/` 目录中的音效来源于超级马里奥系列。在转发或商业使用前，请自行确认对应素材的授权范围。

### 开源协议

MIT — 详见 [LICENSE](LICENSE)。

---

## 🇺🇸 English

### What is this?

**Super Mario Sound Hooks** is a Claude Code plugin that maps classic Super Mario sound effects to Claude's hook events. Every file read, every bash command, every completed task — each one triggers a nostalgic 8-bit sound that makes coding feel like an adventure.

Stop staring silently at your terminal. Start-a the adventure. 🌟

### Sound Map

| Event | Trigger | Sound | Vibe |
|---|---|---|---|
| `SessionStart` | startup / resume / clear / compact | `smb_pipe.wav` | Entering the warp pipe |
| `Stop` | Claude finishes responding | `coin.wav` | Collected a coin! |
| `Notification` | `permission_prompt` | `smb_warning.wav` | Danger ahead! |
| `Notification` | `elicitation_dialog` | `powerup.wav` | Grabbed a mushroom |
| `Notification` | `idle_prompt` | `1up.wav` | Extra life! |
| `PostToolUse` | `Read` | `smb_bump.wav` | Bonked a block |
| `PostToolUse` | `Grep` | `smb_stomp.wav` | Stomped a Goomba |
| `PostToolUse` | `Glob` | `glob_search.wav` | Scanning the map |
| `PostToolUse` | `WebSearch` | `web_search.wav` | Exploring new worlds |
| `PostToolUse` | `WebFetch` | `web_fetch.wav` | Retrieved the goods |
| `PostToolUse` | `Edit` | `smb_jump-small.wav` | Small jump |
| `PostToolUse` | `Write` | `smb_jump-super.wav` | Super jump! |
| `PostToolUse` | `Bash` | `smb_kick.wav` | Shell kicked |
| `TaskCompleted` | Task marked done | `smb_world_clear.wav` | World clear! 🎉 |

### Installation

**Step 1** — Clone or download this repo into your local plugins directory:

```bash
git clone https://github.com/bi-boo/super-mario-sound-hooks \
  ~/.claude/plugins/localdev/super-mario-sound-hooks
```

**Step 2** — Grant execute permission to the hooks:

```bash
chmod +x ~/.claude/plugins/localdev/super-mario-sound-hooks/hooks/*.sh
```

**Step 3** — Restart your Claude Code session and listen for the warp pipe sound. 🎵

### Commands

Once installed, the `/mario-sounds` slash command is available inside Claude Code:

| Command | Description |
|---|---|
| `/mario-sounds` or `/mario-sounds list` | Show all sound mappings |
| `/mario-sounds test coin.wav` | Play a specific sound |
| `/mario-sounds all` | Play the full demo in sequence |

### Customization

**Swap a sound file** — Replace any `.wav` file in the `sounds/` directory with your own. Keep the same filename and it just works.

**Change the mapping** — Edit `hooks/hooks.json` to point any event to a different sound file or adjust the volume (0.0–1.0).

**Add new events** — Claude Code supports many hook types. Check the [Claude Code hooks documentation](https://docs.anthropic.com/en/docs/claude-code/hooks) and add your own entries.

### Platform Support

The `play-sound.sh` script auto-detects your OS and picks the right player:

| Platform | Player |
|---|---|
| macOS | `afplay` (with optional volume control) |
| Linux | `aplay` (preferred) or `paplay` |

All sounds play in the background — Claude Code is never blocked.

### Sound Attribution

The sound files in `sounds/` are sourced from the Super Mario series. Please verify the applicable license before redistribution or commercial use.

### License

MIT — see [LICENSE](LICENSE).
