{ config, ... }:
{
  imports = [
    ../../../constants.nix
  ];

  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "waybar"
      "dunst"
      "wl-paste --watch cliphist -max-items 30 store"

      "systemctl --user restart hyprland-session.target"
      "systemctl --user start hypridle.service"
      "systemctl --user restart kanshi.service"

      "gomuks-web"

      "[workspace 1 silent] ${config.modules.executable.browser}"
      "[workspace 2 silent] ${config.modules.executable.terminal}"
      "[workspace 11 silent] thunderbird"
      "[workspace 12 silent] qbittorrent"

      "[workspace 17 silent] simplex-chat-desktop"
      "[workspace 17 silent] cwtch"
      "[workspace 18 silent] signal-desktop"
    ];
  };
}
