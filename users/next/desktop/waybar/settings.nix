_: {
  programs.waybar.settings = {
    mainBar = {
      # layer = "top"; # Waybar at top layer

      # position = "bottom"; # Waybar position (top|bottom|left|right)

      height = 30; # Waybar height (to be removed for auto height)
      # "width"= 1280; # Waybar width

      spacing = 4; # Gaps between modules (4px)
      # Choose the order of the modules

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
  };
}
