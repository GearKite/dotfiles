{ config, lib, pkgs, ... }: {
  nix.settings = {
    extra-sandbox-paths = [ config.programs.ccache.cacheDir ];
    experimental-features = [ "nix-command" "flakes" ];
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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "unstable"; # Did you read the comment?

}
