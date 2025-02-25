{ config, pkgs, ... }:
let
  constants = import ../../constants.nix { pkgs = pkgs; };
in
{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";

    bind =
      [
        # Actions
        "$mainMod, RETURN, exec, ${constants.executable.terminal}" # Open Alactritty
        "$mainMod, Q, killactive" # Close current window
        "$mainMod, M, exit" # Exit Hyprland
        "$mainMod, E, exec, ${constants.executable.filemanager}" # Opens the filemanager
        "$mainMod, T, togglefloating" # Toggle between tiling and floating window
        "$mainMod, F, fullscreen" # Open the window in fullscreen
        "$mainMod CTRL, RETURN, exec, fuzzel" # Open fuzzel
        "$mainMod, P, pseudo," # dwindle
        "$mainMod, J, togglesplit," # dwindle
        "$mainMod, B, exec, ${constants.executable.browser}" # Opens the browser
        "$mainMod, V, exec, cliphist list | fuzzel -d | cliphist decode | wl-copy"
        "$mainMod, L, exec, loginctl lock-session" # lock
        "$mainMod CTRL, L, exec, sudo halt -f" # force halt

        # Screenshots
        ", Print, exec, hyprshot -c -m output -o ~/Pictures/Screenshots -f $(date '+%Y-%m-%dT%H-%M-%S').png" # monitor
        "CTRL, Print, exec, hyprshot -c --raw -m window -- echo | satty --filename - --fullscreen --output-filename ~/Pictures/Screenshots/$(date '+%Y-%m-%dT%H-%M-%S')-satty.png" # window + annotation
        "SHIFT, Print, exec, hyprshot --raw -m region -- echo | satty --filename - --fullscreen --output-filename ~/Pictures/Screenshots/$(date '+%Y-%m-%dT%H-%M-%S')-satty.png" # region + annotation

        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l" # Move focus left
        "$mainMod, right, movefocus, r" # Move focus right
        "$mainMod, up, movefocus, u" # Move focus up
        "$mainMod, down, movefocus, d" # Move focus down

        # Move windows with arrow keys
        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1" # Scroll workspaces
        "$mainMod, mouse_up, workspace, e-1" # Scroll workspaces

        # workspaces
        "$mainMod, 0, workspace, 10"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
      ]
      ++ (
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (
          builtins.genList (
            i:
            let
              ws = i + 1;
            in
            [
              "$mainMod, code:1${toString i}, workspace, ${toString ws}"
              "$mainMod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          ) 9
        )
      )

      ++ (
        # workspaces with F keys
        # binds $mod + [shift +] F{1..8} to [move to] workspace {11..18}
        builtins.concatLists (
          builtins.genList (
            i:
            let
              ws = i + 1;
            in
            [
              "$mainMod, F${toString ws}, workspace, 1${toString ws}"
              "$mainMod SHIFT, F${toString ws}, movetoworkspace, 1${toString ws}"
            ]
          ) 8
        )
      );

    bindm = [
      # Move/resize windows with mainMod + LMB/RMB and dragging
      "$mainMod, mouse:272, movewindow" # Move window
      "$mainMod, mouse:273, resizewindow" # Resize window
    ];

    binde = [
      # Volume
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ];

    bindl = [
      # Player
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
      ", XF86AudioNext, exec, playerctl next"

      # Brightness
      ", XF86MonBrightnessUp, exec, sudo ddcutil setvcp 10 + 20"
      ", XF86MonBrightnessDown, exec, sudo ddcutil setvcp 10 - 20"
    ];
  };

  wayland.windowManager.hyprland.extraConfig = ''
    # window resize
    bind = $mainMod, R, submap, resize

    submap = resize
    binde = , right, resizeactive, 30 0
    binde = , left, resizeactive, -30 0
    binde = , up, resizeactive, 0 -30
    binde = , down, resizeactive, 0 30
    bind = , escape, submap, reset
    bind = $mainMod, R, submap, reset
    submap = reset
  '';
}
