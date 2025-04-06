{ config, pkgs, ... }:
let
  constants = import ../../constants.nix { pkgs = pkgs; };
in
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "waybar"
      "dunst"
      "wl-paste --watch cliphist -max-items 30 store"

      "systemctl --user restart hyprland-session.target"
      "systemctl --user start hypridle.service"
      "systemctl --user restart kanshi.service"

      "gomuks"
      "nicotine-plus --hidden"

      "[workspace 1 silent] ${constants.executable.browser}"
      "[workspace 2 silent] ${constants.executable.terminal}"
      "[workspace 11 silent] thunderbird"
      "[workspace 12 silent] qbittorrent"

      "[workspace 17 silent] simplex-chat-desktop"
      "[workspace 17 silent] cwtch"
      "[workspace 18 silent] signal-desktop"
    ];
  };
}
