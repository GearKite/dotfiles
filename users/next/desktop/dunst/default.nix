{ pkgs, config, ... }:
{
  home-manager.users.${config.modules.username} = {
    imports = [
      ./settings.nix
    ];

    services.dunst = {
      enable = true;
      package = pkgs.dunst;
    };
  };
}
