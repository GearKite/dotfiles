{ pkgs, ... }:
{
  imports = [
    ./settings.nix
  ];

  programs.fuzzel = {
    enable = true;
    package = pkgs.fuzzel;
  };
}
