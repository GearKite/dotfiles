{ pkgs, config, ... }:
{
  home-manager.users.${config.modules.username} = {
    imports = [
      ./settings.nix
    ];

    programs.fuzzel = {
      enable = true;
      package = pkgs.fuzzel;
    };
  };
}
