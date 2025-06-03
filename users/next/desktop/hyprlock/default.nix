{ pkgs, ... }:
{
  home-manager.users.next = {
    imports = [
      ./settings.nix
    ];

    programs.hyprlock = {
      enable = true;
      package = pkgs.hyprlock;
    };
  };
  programs.hyprlock.enable = true;
  security.pam.services.hyprlock = { };
}
