{ ... }:
{
  imports = [
    ./bluetooth.nix
    ./boot.nix
    ./cachix.nix
    ./desktop.nix
    ./display.nix
    ./hardware-configuration.nix
    ./locale.nix
    ./network.nix
    ./nix.nix
    ./nvidia.nix
    ./printer.nix
    ./security.nix
    ./shell.nix
    ./sound.nix
    ./ssh.nix
    ./users.nix
    ./virtualisation.nix

    ./programs/development.nix
    ./programs/image.nix
    ./programs/office.nix
    ./programs/ollama.nix
    ./programs/pentest.nix
    #./programs/steam.nix
    ./programs/tor.nix
    ./programs/utils.nix
    ./programs/video.nix

    <nixpkgs/nixos/modules/services/hardware/sane_extra_backends/brscan4.nix>
  ];
}
