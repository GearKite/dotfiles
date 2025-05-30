{ pkgs, config, ... }:
{
  home-manager.users.${config.modules.username}.home.packages = with pkgs; [
    pavucontrol
    playerctl
    hyprshot
    satty

    cliphist
    wl-clipboard
    jq # logout script
  ];
}
