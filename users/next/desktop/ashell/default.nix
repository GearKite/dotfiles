{
  pkgs,
  lib,
  outputs,
  system,
  ...
}:
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
            "NextEvent"
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
        CustomModule = [
          {
            name = "NextEvent";
            icon = "󰸗";
            listen_cmd = lib.getExe outputs.packages.${system}.next-event;
            type = "Button";
            command = "thunderbird -calendar & hyprctl dispatch 'hl.dsp.focus({ window = \"class:^(thunderbird)$\" })'";
          }
        ];
      };
    };
  };
}
