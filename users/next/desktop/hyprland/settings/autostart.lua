local browser = "librewolf" -- Replace with your actual browser path
local terminal = "alacritty" -- Already defined in the sample config

-- Autostart programs on Hyprland startup
hl.on("hyprland.start", function()
	hl.exec_cmd("wl-paste --watch cliphist -max-items 30 store")
	hl.exec_cmd("gomuks-web")
	hl.exec_cmd("[workspace 1 silent] " .. browser)
	hl.exec_cmd("[workspace 2 silent] " .. terminal)
	hl.exec_cmd("[workspace 11 silent] thunderbird")
	hl.exec_cmd("[workspace 12 silent] qbittorrent")
	hl.exec_cmd("[workspace 17 silent] simplex-chat-desktop")
	hl.exec_cmd("[workspace 17 silent] cwtch")
	hl.exec_cmd("[workspace 18 silent] signal-desktop")
end)
