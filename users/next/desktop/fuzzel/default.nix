{ pkgs, ... }:
{
  home-manager.users.next = {
    imports = [
      ./settings.nix
    ];

    programs.fuzzel = {
      enable = true;
      package = pkgs.fuzzel;
    };
  };
}
