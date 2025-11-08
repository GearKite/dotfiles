{
  outputs,
  system,
  ...
}:
{
  environment.systemPackages = [
    outputs.packages.${system}.nixvim
  ];
}
