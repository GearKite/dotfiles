{ pkgs, ... }:
{
  imports = [
    ./settings.nix
  ];

  services.hypridle = {
    enable = true;
    package = pkgs.hypridle;
  };
}
