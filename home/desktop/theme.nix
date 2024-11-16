{ config, pkgs, ... }:

{
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };

  wayland.windowManager.hyprland.settings.env = [
    "HYPRCURSOR_THEME,${home.pointerCursor.name}"
    "HYPRCURSOR_SIZE,${home.pointerCursor.size}"

    "XCURSOR_THEME,${home.pointerCursor.name}"
    "XCURSOR_SIZE,${home.pointerCursor.size}"
  ];

  home.packages = with pkgs; [
    hyprcursor
  ];
}
