{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    pv
    ncdu
    coreutils-full
    pciutils
    usbutils
    dig
    whois
    file
    htop
    wget
    ncdu
  ];

}
