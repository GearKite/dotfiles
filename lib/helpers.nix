{
  inputs,
  outputs,
  stateVersion,
  ...
}:
{
  mkNixos =
    {
      hostname,
      system ? "x86_64-linux",
      configurations,
    }:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit
          inputs
          outputs
          hostname
          system
          stateVersion
          configurations
          ;
        unstable = import inputs.nixpkgs { inherit system; };
      };
      modules = [
        ../hosts
        ./unfree.nix
      ];
    };

  forAllSystems = inputs.nixpkgs.lib.genAttrs [
    "aarch64-linux"
    "x86_64-linux"
  ];
}
