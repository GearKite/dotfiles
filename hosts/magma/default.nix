{ ... }:
{
  imports = [
    ../../users/next

    ./hardware-configuration.nix

    ../../modules/host/audio
    ../../modules/host/bluetooth
    ../../modules/host/graphical
    ../../modules/host/init
    ../../modules/host/network
    ../../modules/host/nvidia
    ../../modules/host/ollama
    ../../modules/host/printer
    ../../modules/host/tor
    ../../modules/host/virtualisation

    ./locale.nix
    ./nix.nix
    ./secrets.nix
    ./security.nix
    ./shell.nix
    ./ssh.nix
  ];
}
