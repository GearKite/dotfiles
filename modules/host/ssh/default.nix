{ lib, config, ... }:
{
  options = {
    services.openssh.allowedInterfaces = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "List of network interfaces allowed for SSH access.";
    };
  };

  config = {
    services.openssh = {
      enable = true;
      ports = [ 22 ];
      openFirewall = false;
      settings = {
        PasswordAuthentication = true;
        AllowUsers = null;
        UseDns = true;
        X11Forwarding = true;
        PermitRootLogin = "prohibit-password";
      };
    };

    services.sshguard.enable = true;

    networking.firewall.interfaces = builtins.listToAttrs (
      map (iface: {
        name = iface;
        value = {
          allowedTCPPorts = config.services.openssh.ports;
        };
      }) config.services.openssh.allowedInterfaces
    );
  };
}
