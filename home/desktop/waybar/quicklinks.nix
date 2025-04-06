{ pkgs, ... }:
let
  constants = import ../constants.nix { inherit pkgs; };
in
{
  programs.waybar.settings = {
    mainBar = {
      "custom/quicklink1" = {
        "format" = " ";
        "on-click" = constants.executable.terminal;
        "tooltip-format" = "Open the terminal";
      };
      "custom/quicklink2" = {
        "format" = " ";
        "on-click" = constants.executable.browser;
        "tooltip-format" = "Open the browser";
      };
      "custom/quicklink3" = {
        "format" = " ";
        "on-click" = constants.executable.filemanager;
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
