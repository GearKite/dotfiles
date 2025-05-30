{
  config,
  lib,
  pkgs,
  ...
}:
{
  nix.settings = {
    extra-sandbox-paths = [ config.programs.ccache.cacheDir ];
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    auto-optimise-store = true;
    trusted-users = [ "@wheel" ];
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
    flags = [ "--upgrade-all" ];
  };

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "zerotierone"
      # Brother scanner
      "brscan4"
      "brother-udev-rule-type1"
      "brscan4-etc-files"
      # Nvidia (why so many!?)
      "nvidia-x11"
      "cuda_cccl"
      "cuda_cudart"
      "libcublas"
      "cuda_nvcc"
      "cuda-merged"
      "cuda_cuobjdump"
      "cuda_gdb"
      "cuda_nvdisasm"
      "cuda_nvprune"
      "cuda_cupti"
      "cuda_cuxxfilt"
      "cuda_nvml_dev"
      "cuda_nvrtc"
      "cuda_nvtx"
      "cuda_profiler_api"
      "cuda_sanitizer_api"
      "libcufft"
      "libcurand"
      "libcusolver"
      "libnvjitlink"
      "libcusparse"
      "libnpp"
      "nvidia-persistenced"
    ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
