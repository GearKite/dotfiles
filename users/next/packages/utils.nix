{ pkgs, config, ... }:
{
  home-manager.users.${config.modules.username}.home.packages = with pkgs; [
    pv
    ncdu
    coreutils-full
    pciutils
    usbutils
    dig
    whois
    file
    btop
    wget
    fastfetch
    lm_sensors
    zip
    unzip
    brightnessctl
    syncthing
  ];

}
