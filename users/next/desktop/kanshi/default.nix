{ pkgs, ... }:
{
  home-manager.users.next = {
    imports = [
      ./settings.nix
    ];

    services.kanshi = {
      enable = true;
      package = pkgs.kanshi;
    };
  };
}
