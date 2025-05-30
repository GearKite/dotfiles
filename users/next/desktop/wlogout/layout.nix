{ config, ... }:
{
  programs.wlogout.layout = [
    {
      "label" = "lock";
      "action" = "hyprlock";
      "text" = "Lock";
      "keybind" = "l";
    }
    {
      "label" = "logout";
      "action" = "/usr/bin/env bash ${config.xdg.configHome}/wlogout/scripts/logout.sh";
      "text" = "Exit";
      "keybind" = "e";
    }
    {
      "label" = "shutdown";
      "action" = "shutdown now";
      "text" = "Shutdown";
      "keybind" = "s";
    }
    {
      "label" = "reboot";
      "action" = "reboot";
      "text" = "Reboot";
      "keybind" = "r";
    }
  ];
}
