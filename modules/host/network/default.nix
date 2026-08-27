{
  pkgs,
  hostname,
  ...
}:
{
  networking.networkmanager = {
    enable = true;
    ethernet.macAddress = "random";
    wifi = {
      macAddress = "random";
      scanRandMacAddress = true;
    };
  };
  networking.hostName = hostname;

  networking.firewall = {
    enable = true;
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.i2p = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    wireguard-tools
  ];
}
