{ config, lib, pkgs, ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{
  disabledModules = [ "services/misc/ollama.nix" ];

  imports = [
    # Use unstable ollama
    <nixos-unstable/nixos/modules/services/misc/ollama.nix>
  ];

  services.ollama = {
    enable = true;
    package = unstable.ollama;
    acceleration = "cuda";
  };

  services.open-webui = {
    enable = true;
    package = unstable.open-webui;
  };
}
