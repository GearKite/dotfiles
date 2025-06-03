{
  pkgs,
  inputs,
  ...
}:
{
  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = [
      pkgs.brlaser
    ];
  };

  hardware.sane = {
    enable = true; # enables support for SANE scanners
    extraBackends = [ pkgs.sane-airscan ];

    brscan4 = {
      enable = true;
      netDevices = {
        home = {
          model = "DCP-L2550DN";
          ip = "192.168.50.3";
        };
      };
    };

  };

  services.udev.packages = [ pkgs.sane-airscan ];

  nixpkgs.config.packageOverrides = pkgs: {
    xsaneGimp = pkgs.xsane.override { gimpSupport = true; };
  };

  environment.systemPackages = with pkgs; [
    xsaneGimp
  ];

  imports = [
    (inputs.nixpkgs + "/nixos/modules/services/hardware/sane_extra_backends/brscan4.nix")
  ];

  allowed-unfree = [
    "brscan4"
    "brother-udev-rule-type1"
    "brscan4-etc-files"
  ];
}
