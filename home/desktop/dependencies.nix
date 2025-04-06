{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pavucontrol
    playerctl
    hyprshot
    satty

    cliphist
    wl-clipboard
    jq # logout script
  ];
}
