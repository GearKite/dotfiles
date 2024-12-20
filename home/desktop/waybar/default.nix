{ config, pkgs, ... }:
{
  imports = [
    ./modules.nix
    ./settings.nix
    ./quicklinks.nix
  ];

  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    style = ./style.css;
  };
}
