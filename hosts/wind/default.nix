{ ... }:

{
  imports = [
    ../../users/next

    ./hardware-configuration.nix

    ../../modules/host/bluetooth
    ../../modules/host/nvidia
    ../../modules/host/ssh
    ../../modules/host/tor
    ../../modules/host/virtualisation
  ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "lv";
    variant = "";
  };

  system.stateVersion = "25.05";

}
