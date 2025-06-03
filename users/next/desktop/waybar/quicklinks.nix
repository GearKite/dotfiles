{ config, ... }:
{
  imports = [
    ../../constants.nix
  ];

  programs.waybar.settings = {
    mainBar = {
      "custom/quicklink1" = {
        "format" = " ";
        "on-click" = config.modules.executable.terminal;
        "tooltip-format" = "Open the terminal";
      };
      "custom/quicklink2" = {
        "format" = " ";
        "on-click" = config.modules.executable.browser;
        "tooltip-format" = "Open the browser";
      };
      "custom/quicklink3" = {
        "format" = " ";
        "on-click" = config.modules.executable.filemanager;
        "tooltip-format" = "Open the filemanager";
      };
      "custom/quicklinkempty" = { };
      "group/quicklinks" = {
        "orientation" = "horizontal";
        "modules" = [
          "custom/quicklink1"
          "custom/quicklink2"
          "custom/quicklink3"
          "custom/quicklinkempty"
        ];
      };
    };
  };
}
