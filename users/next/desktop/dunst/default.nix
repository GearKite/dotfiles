{ pkgs, ... }:
{
  home-manager.users.next = {
    imports = [
      ./settings.nix
    ];

    services.dunst = {
      enable = true;
      package = pkgs.dunst;
    };
  };
}
