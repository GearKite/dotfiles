{ pkgs, ... }:
{
  imports = [
    ./settings/animations.nix
    ./settings/autostart.nix
    ./settings/binds.nix
    ./settings/decorations.nix
    ./settings/environments.nix
    ./settings/general.nix
    ./settings/gestures.nix
    ./settings/input.nix
    ./settings/layouts.nix
    ./settings/misc.nix
    #./settings/monitor.nix
    ./settings/windowrules.nix
    ./settings/workspaces.nix
  ];

  wayland.windowManager.hyprland = {
    # Whether to enable Hyprland wayland compositor
    enable = true;
    # The hyprland package to use
    package = pkgs.hyprland;
    # Whether to enable XWayland
    xwayland.enable = true;

    # Optional
    # Whether to enable hyprland-session.target on hyprland startup
    systemd.enable = true;
  };
}
