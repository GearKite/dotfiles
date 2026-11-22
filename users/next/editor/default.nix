{
  outputs,
  system,
  pkgs,
  ...
}:
{
  environment.systemPackages = [
    outputs.packages.${system}.nixvim
    pkgs.lazygit
    pkgs.ripgrep
  ];

  environment.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
