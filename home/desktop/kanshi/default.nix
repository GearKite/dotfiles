{ pkgs, ... }:
{
  imports = [
    ./settings.nix
  ];

  services.kanshi = {
    enable = true;
    package = pkgs.kanshi;
    systemdTarget = "hyprland-session.target";
  };
}
