{
  lib,
  inputs,
  system,
  ...
}:
let
  unstable = import inputs.nixpkgs {
    inherit system;
    config = {
      allowUnfreePredicate =
        pkg:
        builtins.elem (lib.getName pkg) [
          "cuda_cudart"
          "libcublas"
          "cuda_cccl"
          "cuda_nvcc"
        ];
    };
  };
in
{
  services.ollama = {
    enable = true;
    package = unstable.ollama-cuda;
    acceleration = "cuda";
  };
}
