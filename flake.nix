{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
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
    gomuks = {
      url = "github:gearkite/gomuks/flake-package";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  nixConfig = {
    extra-substituters = [
      "https://cuda-maintainers.cachix.org"
      "https://hyprland.cachix.org"
      "https://nix-community.cachix.org"
      "https://pre-commit-hooks.cachix.org"
      "https://value11.cachix.org"
    ];
    extra-trusted-public-keys = [
      "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "pre-commit-hooks.cachix.org-1:Pkk3Panw5AW24TOv6kz3PvLhlH8puAsJTBbOPmBo7Rc="
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
    in
    {
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
        };
      in
      {
        checks = {
          pre-commit = inputs.pre-commit-hooks.lib.${system}.run {
            src = ./.;
            hooks = {
              nixfmt-rfc-style.enable = true;
              deadnix.enable = true;
              nil.enable = true;
              statix.enable = true;
              ansible-lint.enable = true;
              ansible-lint.settings.subdir = "./ansible";
              markdownlint.enable = true;
            };
          };
        };

        devShells.default = pkgs.mkShell {
          buildInputs = self.checks.${system}.pre-commit.enabledPackages;
          inherit (self.checks.${system}.pre-commit) shellHook;

          packages = with pkgs; [
            git
            direnv
            ssh-to-age
          ];
        };
      }
    );
}
