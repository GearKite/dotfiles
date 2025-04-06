{
  pkgs,
  ...
}:
{
  networking.networkmanager.enable = true;

  networking.hostName = "magma";

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 2234 ];

    interfaces = {
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
  };

  environment.systemPackages = with pkgs; [
    wireguard-tools
  ];
}
