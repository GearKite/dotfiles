{ pkgs, ... }:
{
  imports = [
    ./settings.nix
  ];

  services.hyprpaper = {
    enable = true;
    package = pkgs.hyprpaper;
  };
}
