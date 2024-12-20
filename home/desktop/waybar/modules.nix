{ config, pkgs, ... }:
{
  programs.waybar.settings = {
    mainBar = {
      # Workspaces
      "hyprland/workspaces" = {
        on-click = "activate";
        active-only = false;
        all-outputs = false;
        format = "{}";
        format-icons = {
          urgent = "";
          active = "";
          default = "";
        };
      };

      # Fuzzel Application Launcher
      "custom/appmenu" = {
        format = "Apps";
        tooltip-format = "Left= Open the application launcher\nRight= Show all keybindings";
        on-click = "fuzzel";
        tooltip = false;
      };

      # Power Menu
      "custom/exit" = {
        format = "⏻";
        tooltip-format = "Powermenu";
        on-click = "wlogout -b 4";
        tooltip = false;
      };

      # Keyboard State
      keyboard-state = {
        numlock = true;
        capslock = true;
        format = "{name} {icon}";
        format-icons = {
          locked = "";
          unlocked = "";
        };
      };

      # System tray
      tray = {
        icon-size = 21;
        spacing = 10;
      };

      # Clock
      clock = {
        format = "{:%H:%M:%S}";
        interval = 1; # Update every second

        on-click = "thunderbird -calendar && hyprctl dispatch focuswindow class:thunderbird";
      };

      # CPU
      cpu = {
        format = "   {}%";
        on-click = "alacritty -e htop";
      };

      # Memory
      memory = {
        format = " {}%";
        on-click = "alacritty -e htop";
      };

      # Harddisc space used
      disk = {
        interval = 30;
        format = " {percentage_used}%";
        path = "/";
        on-click = "alacritty -e htop";
      };

      "hyprland/language" = {
        format = " {short}";
      };

      # Group Hardware
      "group/hardware" = {
        orientation = "inherit";
        drawer = {
          transition-duration = 300;
          children-class = "not-memory";
          transition-left-to-right = false;
        };
        modules = [
          "custom/system"
          "disk"
          "cpu"
          "memory"
          "hyprland/language"
        ];
      };

      # Network
      network = {
        format = "{ifname}";
        format-wifi = "{icon}";
        format-ethernet = " ";
        format-disconnected = "󰌙"; #An empty format will hide the module.
        tooltip-format = " {ifname} via {gwaddri}";
        tooltip-format-wifi = "   {essid} ({signalStrength}%)";
        tooltip-format-ethernet = "  {ifname} ({ipaddr}/{cidr})";
        tooltip-format-disconnected = "Disconnected";
        max-length = 50;
        on-click = "alacritty -e nmtui";
        format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
      };

      # Battery
      battery = {
        states = {
          # "good"= 95;
          warning = 30;
          critical = 15;
        };
        format = "{icon}";
        format-charging = "";
        format-plugged = "";
        format-alt = "{icon}  {percentage}%  {time}";
        # "format-good"= ""; # An empty format will hide the module
        # "format-full"= "";
        format-icons = [ " " " " " " " " " " ];
      };

      # Pulseaudio
      pulseaudio = {
        # "scroll-step"= 1; # %; can be a float
        format = "{icon}  {volume}%";
        format-bluetooth = "{volume}% {icon} {format_source}";
        format-bluetooth-muted = " {icon} {format_source}";
        format-muted = " {format_source}";
        format-source = "{volume}% ";
        format-source-muted = "";
        format-icons = {
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = [ "" " " " " ];
        };
        on-click = "pavucontrol";
      };

      # Bluetooth
      bluetooth = {
        format-disabled = "";
        format-off = "";
        interval = 30;
        on-click = "blueman-manager";
        format-no-controller = "";
      };

      # Other
      user = {
        format = "{user}";
        interval = 60;
        icon = false;
      };

      # Idle Inhibator
      idle_inhibitor = {
        format = "{icon}";
        tooltip = true;
        format-icons = {
          activated = "";
          deactivated = "";
        };
        on-click-right = "hyprlock";
      };
    };
  };
}
