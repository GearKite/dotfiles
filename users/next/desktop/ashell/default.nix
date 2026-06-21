{ pkgs, ... }:
{
  home-manager.users.next = {
    programs.ashell = {
      enable = true;
      package = pkgs.ashell;
      systemd.enable = true;
      settings = {
        modules = {
          center = [
            "WindowTitle"
          ];
          left = [
            "Workspaces"
            "SystemInfo"
          ];
          right = [
            "MediaPlayer"
            "Tray"
            [
              "Tempo"
              "Privacy"
              "Settings"
            ]
          ];
        };
        workspaces = {
          visibility_mode = "All";
        };
      };
    };
  };
}
