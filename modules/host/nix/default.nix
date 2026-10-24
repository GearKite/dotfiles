{ hostname, ... }:
{
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    auto-optimise-store = true;
    trusted-users = [ "@wheel" ];
  };

  nix.gc = {
    automatic = true;
    options = "--delete-older-than 3d";
  };

  nix.optimise = {
    automatic = true;
  };

  system.autoUpgrade = {
    enable = true;
    dates = "02:00";
    randomizedDelaySec = "45min";
    persistent = true;
    flake = "github:gearkite/dotfiles#${hostname}";
    flags = [ "--accept-flake-config" ];
  };
}
