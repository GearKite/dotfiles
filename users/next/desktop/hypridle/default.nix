{ pkgs, ... }:
{
  home-manager.users.next = {
    imports = [
      ./settings.nix
    ];

    services.hypridle = {
      enable = true;
      package = pkgs.hypridle;
    };
  };
}
