{ pkgs, ... }:
{
  home-manager.users.next = {
    imports = [
      ./settings.nix
    ];

    services.hyprpaper = {
      enable = true;
      package = pkgs.hyprpaper;
    };
  };
}
