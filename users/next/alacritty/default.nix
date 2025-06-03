{ pkgs, config, ... }:
let
  configHome = config.home-manager.users.next;
in
{
  home-manager.users.next = {
    imports = [
      ./settings.nix
      ../constants.nix
    ];

    programs.alacritty = {
      enable = true;
      package = pkgs.alacritty;
    };

    modules.executable.terminal = "${configHome.programs.alacritty.package}/bin/alacritty";
  };
}
