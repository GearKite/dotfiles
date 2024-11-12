{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "workspace 11, class:(thunderbird)"

      "workspace 15, class:(Element)"
      "workspace 16, class:(nuclear)"
      "workspace 17, class:(Element)"
      "workspace 18, class:(Signal-desktop)"
    ];
   };
}
