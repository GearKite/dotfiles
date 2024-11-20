{ config, lib, pkgs, ... }: {
  networking.networkmanager.enable = true;

  networking.hostName = "magma";

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ ];

    interfaces =
      {
        "zt+" = {
          allowedTCPPorts = [ 22 ];
          allowedUDPPorts = [ ];
        };

        "enp5s0" = {
          allowedTCPPorts = [ 22 ];
        };
      };
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.i2p = {
    enable = true;
    # TCP & UDP
    #port = 33692;
    # TCP
    #ntcp2.port = 34555;
    #enableIPv4 = true;
    #enableIPv6 = true;
  };

  environment.systemPackages = with pkgs; [
    wireguard-tools
  ];
}
