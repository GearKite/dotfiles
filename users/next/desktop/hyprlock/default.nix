{ pkgs, config, ... }:
{
  home-manager.users.${config.modules.username} = {
    imports = [
      ./settings.nix
    ];

    programs.hyprlock = {
      enable = true;
      package = pkgs.hyprlock;
    };
  };
}
