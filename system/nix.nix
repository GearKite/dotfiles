{ config, lib, pkgs, ... }: {
  nix.settings = {
    extra-sandbox-paths = [ config.programs.ccache.cacheDir ];
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  programs.ccache.enable = true;

  environment.systemPackages = with pkgs; [
    cachix
  ];

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc.lib
    ];
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  system.autoUpgrade = {
    enable = true;
    dates = "02:00";
    randomizedDelaySec = "45min";
    persistent = true;
    flags = [ "--upgrade-all" ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
