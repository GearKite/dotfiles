{ pkgs, config, ... }:
{
  home-manager.users.${config.modules.username} = {
    imports = [
      ./settings.nix
    ];

    services.hypridle = {
      enable = true;
      package = pkgs.hypridle;
    };
  };
}
