{ config, pkgs, ... }:
{
  home-manager.users.next = {
    imports = [
      ./layout.nix
    ];

    programs.wlogout = {
      enable = true;
      package = pkgs.wlogout;
      style = ./style.css;
    };

    home.file."${config.home-manager.users.next.xdg.configHome}/wlogout/icons" = {
      source = ./icons;
    };

    home.file."${config.home-manager.users.next.xdg.configHome}/wlogout/scripts" = {
      source = ./scripts;
    };

    home.packages = with pkgs; [
      jq # logout script
    ];

  };

  security.sudo = {
    enable = true;
    extraRules = [
      {
        commands = [
          {
            command = "${pkgs.systemd}/bin/halt";
            options = [ "NOPASSWD" ];
          }
          {
            command = "/run/current-system/sw/bin/halt";
            options = [ "NOPASSWD" ];
          }
        ];
        groups = [ "wheel" ];
      }
    ];
  };
}
