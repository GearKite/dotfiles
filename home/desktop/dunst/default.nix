{ pkgs, ... }:
{
  imports = [
    ./settings.nix
  ];

  services.dunst = {
    enable = true;
    package = pkgs.dunst;
  };
}
