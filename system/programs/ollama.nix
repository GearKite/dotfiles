{
  lib,
  ...
}:
let
  unstable = import <nixos-unstable> {
    config.allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "cuda_cudart"
        "libcublas"
        "cuda_cccl"
        "cuda_nvcc"
      ];
  };
in
{
  disabledModules = [ "services/misc/ollama.nix" ];

  imports = [
    # Use unstable ollama
    <nixos-unstable/nixos/modules/services/misc/ollama.nix>
  ];

  services.ollama = {
    enable = true;
    package = unstable.ollama-cuda;
    acceleration = "cuda";
  };

}
