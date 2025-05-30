{ config, pkgs, ... }:
{
  home-manager.users.${config.modules.username} = {
    imports = [
      ./layout.nix
    ];

    programs.wlogout = {
      enable = true;
      package = pkgs.wlogout;
      style = ./style.css;
    };

    home.file."${config.home-manager.users.${config.modules.username}.xdg.configHome}/wlogout/icons" = {
      source = ./icons;
    };

    home.file."${config.home-manager.users.${config.modules.username}.xdg.configHome}/wlogout/scripts" =
      {
        source = ./scripts;
      };
  };
}
