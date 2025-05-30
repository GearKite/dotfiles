{ pkgs, config, ... }:
{
  home-manager.users.${config.modules.username} = {
    imports = [
      ./settings.nix
    ];

    services.hyprpaper = {
      enable = true;
      package = pkgs.hyprpaper;
    };
  };
}
