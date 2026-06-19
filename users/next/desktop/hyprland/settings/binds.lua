-- Define executable variables (replace with your actual paths)
local browser = "librewolf" -- config.modules.executable.browser
local terminal = "alacritty" -- config.modules.executable.terminal
local fileManager = "nautilus" -- config.modules.executable.filemanager
local mainMod = "SUPER"

---------------------
---- KEYBINDINGS ----
---------------------

-- Actions
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ on = true }))
hl.bind(mainMod .. " + CTRL + RETURN", hl.dsp.exec_cmd("fuzzel"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | fuzzel -d | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("loginctl lock-session"))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd("sudo halt -f"))

-- Screenshots
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -c -m output -o ~/Pictures/Screenshots -f $(date '+%Y-%m-%dT%H-%M-%S').png"))
hl.bind(
	"CTRL + Print",
	hl.dsp.exec_cmd(
		"hyprshot -c --raw -m window -- echo | satty --filename - --fullscreen --output-filename ~/Pictures/Screenshots/$(date '+%Y-%m-%dT%H-%M-%S')-satty.png"
	)
)
hl.bind(
	"SHIFT + Print",
	hl.dsp.exec_cmd(
		"hyprshot --raw -m region -- echo | satty --filename - --fullscreen --output-filename ~/Pictures/Screenshots/$(date '+%Y-%m-%dT%H-%M-%S')-satty.png"
	)
)

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move windows with mainMod + SHIFT + arrow keys
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Workspace 10 (0 key)
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- Workspaces 1-9 with number keys
for i = 1, 9 do
	hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- Workspaces 11-18 with F1-F8 keys
for i = 1, 8 do
	local ws = 10 + i
	hl.bind(mainMod .. " + F" .. i, hl.dsp.focus({ workspace = ws }))
	hl.bind(mainMod .. " + SHIFT + F" .. i, hl.dsp.window.move({ workspace = ws }))
end

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume (repeating binds)
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ repeating = true }
)
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { repeating = true })

-- Player (locked binds)
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })

-- Brightness (locked binds)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("sudo ddcutil setvcp 10 + 20"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("sudo ddcutil setvcp 10 - 20"), { locked = true })

---------------------
---- RESIZE MODE ----
---------------------

-- Enter resize mode
hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))

hl.define_submap("resize", function()
	-- Resize mode keybinds
	hl.bind("right", hl.dsp.window.resize({ x = 30, y = 0 }), { repeating = true })
	hl.bind("left", hl.dsp.window.resize({ x = -30, y = 0 }), { repeating = true })
	hl.bind("up", hl.dsp.window.resize({ x = 0, y = -30 }), { repeating = true })
	hl.bind("down", hl.dsp.window.resize({ x = 0, y = 30 }), { repeating = true })

	-- Exit resize mode
	hl.bind("escape", hl.dsp.submap("reset"))
	hl.bind("R", hl.dsp.submap("reset"), { mods = mainMod })
end)
