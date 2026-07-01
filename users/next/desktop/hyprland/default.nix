{
  pkgs,
  system,
  inputs,
  ...
}:
{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    package = inputs.hyprland.packages.${system}.hyprland;
    portalPackage = inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;
  };

  home-manager.users.next = {
    imports = [
      ./theme.nix
    ];

    wayland.windowManager.hyprland = {
      # Whether to enable Hyprland wayland compositor
      enable = true;
      # The hyprland package to use
      package = inputs.hyprland.packages.${system}.hyprland;
      portalPackage = inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;
      # Whether to enable XWayland
      xwayland.enable = true;

      systemd.enable = false;

      configType = "lua";
      extraLuaFiles = {
        "animations" = {
          content = ./settings/animations.lua;
        };
        "autostart" = {
          content = ./settings/autostart.lua;
        };
        "binds" = {
          content = ./settings/binds.lua;
        };
        "decorations" = {
          content = ./settings/decorations.lua;
        };
        "environments" = {
          content = ./settings/environments.lua;
        };
        "general" = {
          content = ./settings/general.lua;
        };
        "input" = {
          content = ./settings/input.lua;
        };
        "layouts" = {
          content = ./settings/layouts.lua;
        };
        "misc" = {
          content = ./settings/misc.lua;
        };
        "windowrules" = {
          content = ./settings/windowrules.lua;
        };
        "workspaces" = {
          content = ./settings/workspaces.lua;
        };
      };
    };

    home.packages = with pkgs; [
      # Media controls
      pavucontrol
      playerctl
      # Screenshots
      hyprshot
      satty
      # Clipboard history
      cliphist
      wl-clipboard
    ];
  };

  security.sudo = {
    enable = true;
  };

  security.polkit = {
    enable = true;
  };
}
