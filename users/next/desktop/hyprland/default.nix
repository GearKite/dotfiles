{ pkgs, ... }:
{
  programs.hyprland.enable = true;

  home-manager.users.next = {
    imports = [
      ./theme.nix

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
    extraRules = [
      {
        commands = [
          {
            command = "${pkgs.ddcutil}/bin/ddcutil";
            options = [ "NOPASSWD" ];
          }
          {
            command = "/run/current-system/sw/bin/ddcutil";
            options = [ "NOPASSWD" ];
          }
        ];
        groups = [ "wheel" ];
      }
    ];
    extraConfig = with pkgs; ''
      Defaults:picloud secure_path="${
        lib.makeBinPath [
          ddcutil
        ]
      }:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin"
    '';
  };

  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
