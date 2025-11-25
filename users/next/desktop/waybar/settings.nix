_: {
  programs.waybar.settings = {
    mainBar = {
      # layer = "top"; # Waybar at top layer

      # position = "bottom"; # Waybar position (top|bottom|left|right)

      height = 49; # Waybar height (to be removed for auto height)
      # "width"= 1280; # Waybar width

      spacing = 4; # Gaps between modules (4px)
      # Choose the order of the modules

      output = [
        "eDP-1"
        "DP-2"
      ];

      modules-left = [
        "custom/appmenu"
        "group/quicklinks"
        "cpu"
        "memory"
      ];

      modules-center = [
        "hyprland/workspaces"
      ];

      modules-right = [
        "tray"
        "mpd"
        "pulseaudio"
        "bluetooth"
        "network"
        "keyboard-state"
        "battery"
        "clock"
        "custom/exit"
      ];
    };

    otherMonitor = {
      height = 30; # Waybar height (to be removed for auto height)

      spacing = 4; # Gaps between modules (4px)
      # Choose the order of the modules

      output = [ "DP-1" ];

      modules-center = [
        "hyprland/workspaces"
      ];
    };

  };
}
