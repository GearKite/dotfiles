{ pkgs, config, ... }:
{
  home-manager.users.${config.modules.username} = {
    imports = [
      ./settings.nix
    ];

    services.kanshi = {
      enable = true;
      package = pkgs.kanshi;
      systemdTarget = "hyprland-session.target";
    };
  };
}
