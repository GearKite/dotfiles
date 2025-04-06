{ pkgs, ... }:
{
  imports = [
    ./settings.nix
  ];

  programs.hyprlock = {
    enable = true;
    package = pkgs.hyprlock;
  };
}
