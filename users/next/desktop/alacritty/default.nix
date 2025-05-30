{ pkgs, config, ... }:
{
  home-manager.users.${config.modules.username} = {
    imports = [
      ./settings.nix
    ];

    programs.alacritty = {
      enable = true;
      package = pkgs.alacritty;
    };
  };
}
