{
  pkgs,
  lib,
  ...
}:
{
  services.ollama = {
    enable = true;
    package = lib.mkDefault pkgs.ollama-cuda;
    acceleration = lib.mkDefault "cuda";
  };

  allowed-unfree = [
    "cuda_cudart"
    "libcublas"
    "cuda_cccl"
    "cuda_nvcc"
  ];
}
