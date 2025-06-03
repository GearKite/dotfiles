{ pkgs, ... }:
{
  home-manager.users.next.home.packages = with pkgs; [
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
