{
  pkgs,
  lib,
  stable,
  ...
}:
{
  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of
    # supported GPUs is at:
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = true;

    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
    nvidiaSettings = false;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = lib.mkDefault stable.pkgs.linuxPackages.nvidiaPackages.beta;
  };

  environment.systemPackages = with pkgs; [
    nvtopPackages.full
  ];

  hardware.nvidia-container-toolkit.enable = true;
  virtualisation.docker.enableNvidia = true; # deprecated, but '--gpus' doesn't work without this

  allowed-unfree = [
    # Nvidia (why so many!?) - fuck nvidia
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
}
