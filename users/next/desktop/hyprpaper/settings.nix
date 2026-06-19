{ pkgs, ... }:
let
  wallpaper-file = "${pkgs.hyprland}/share/hypr/wall2.png";
in
{
  services.hyprpaper.settings = {
    ipc = "on";
    splash = true;
    splash_offset = 2;

    preload = [ wallpaper-file ];

    wallpaper = {
      monitor = "";
      path = wallpaper-file;
      fit_mode = "cover";
    };
  };
}
