local browser = "librewolf" -- Replace with your actual browser path
local terminal = "alacritty" -- Already defined in the sample config

-- Then use them with string concatenation:
hl.exec_cmd("[workspace 1 silent] " .. browser)

-- Autostart programs on Hyprland startup
hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("dunst")
	hl.exec_cmd("wl-paste --watch cliphist -max-items 30 store")
	hl.exec_cmd("systemctl --user restart hyprland-session.target")
	hl.exec_cmd("systemctl --user start hypridle.service")
	hl.exec_cmd("systemctl --user restart kanshi.service")
	hl.exec_cmd("gomuks-web")
	hl.exec_cmd("[workspace 1 silent] " .. terminal) -- Replace 'terminal' with your browser executable
	hl.exec_cmd("[workspace 2 silent] " .. terminal)
	hl.exec_cmd("[workspace 11 silent] thunderbird")
	hl.exec_cmd("[workspace 12 silent] qbittorrent")
	hl.exec_cmd("[workspace 17 silent] simplex-chat-desktop")
	hl.exec_cmd("[workspace 17 silent] cwtch")
	hl.exec_cmd("[workspace 18 silent] signal-desktop")
end)
