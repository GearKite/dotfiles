{ config, pkgs, ... }:
{
  imports = [
    ./layout.nix
  ];

  programs.wlogout = {
    enable = true;
    package = pkgs.wlogout;
    style = ./style.css;
  };

  home.file."${config.xdg.configHome}/wlogout/icons" = {
    source = ./icons;
  };

  home.file."${config.xdg.configHome}/wlogout/scripts" = {
    source = ./scripts;
  };
}
