{ config, lib, ... }:
{
  options.allowed-unfree = lib.mkOption {
    type = lib.types.listOf lib.types.str;
  };

  config.nixpkgs.config.allowUnfreePredicate =
    pkg: builtins.elem (lib.getName pkg) config.allowed-unfree;
}
