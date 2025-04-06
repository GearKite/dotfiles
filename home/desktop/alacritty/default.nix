{ pkgs, ... }:
{
  imports = [
    ./settings.nix
  ];

  programs.alacritty = {
    enable = true;
    package = pkgs.alacritty;
  };
}
