{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-26.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    pre-commit-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-compat.follows = "blank";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    blank.url = "github:divnix/blank";
    flake-utils.url = "github:numtide/flake-utils";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    extra-substituters = [
      "https://value11.cachix.org"
    ];
    extra-trusted-public-keys = [
      "value11.cachix.org-1:3zKRUHEEu2wzUOKxiEAm8t5iH+tDUKjfSpoRpnp7yPI="
    ];
  };

  outputs =
    {
      self,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      stateVersion = "24.11";
      helper = import ./lib {
        inherit
          inputs
          outputs
          stateVersion
          ;
        inherit (inputs.nixpkgs) lib;
      };

      # Build list of configurations (each directory in ./hosts)
      hostEntries = builtins.readDir ./hosts;
      hostConfigurations = builtins.filter (entry: hostEntries.${entry} == "directory") (
        builtins.attrNames hostEntries
      );

      obs-cuda-overlay = _final: prev: {
        obs-studio = prev.obs-studio.override { cudaSupport = true; };
      };
    in
    {
      overlays.obs-cuda = obs-cuda-overlay;

      nixosConfigurations = builtins.listToAttrs (
        map (name: {
          inherit name;
          value = helper.mkNixos {
            hostname = name;
            configurations = hostConfigurations;
          };
        }) hostConfigurations
      );
    }
    // inputs.flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import inputs.nixpkgs {
          inherit system;
          overlays = [ obs-cuda-overlay ];
        };

        nixvim' = inputs.nixvim.legacyPackages.${system};

        nixvim = nixvim'.makeNixvimWithModule {
          inherit pkgs;
          module = ./modules/nixvim;
        };
      in
      {
        checks = {
          pre-commit = inputs.pre-commit-hooks.lib.${system}.run {
            src = ./.;
            hooks = {
              nixfmt.enable = true;
              deadnix.enable = true;
              nil.enable = true;
              statix.enable = true;
              ansible-lint.enable = true;
              ansible-lint.settings.subdir = "./ansible";
              markdownlint.enable = true;
            };
          };
        }
        // builtins.listToAttrs (
          map (name: {
            name = "host-${name}";
            value = self.nixosConfigurations.${name}.config.system.build.toplevel;
          }) hostConfigurations
        );

        devShells.default = pkgs.mkShell {
          buildInputs = self.checks.${system}.pre-commit.enabledPackages;
          inherit (self.checks.${system}.pre-commit) shellHook;

          packages = with pkgs; [
            git
            direnv
            ssh-to-age
            cachix
          ];
        };

        packages = {
          inherit nixvim;
          scrcpy-camera = pkgs.callPackage ./pkgs/scrcpy-camera.nix { };
          next-event = pkgs.callPackage ./pkgs/next-event.nix { };
        };
      }
    );
}
