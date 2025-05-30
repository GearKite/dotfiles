_: {
  # Enable virtualization
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # USB redirect
  virtualisation.spiceUSBRedirection.enable = true;

  # Docker
  virtualisation.docker = {
    enable = true;
    enableNvidia = true; # deprecated, but '--gpus' doesn't work without this
  };
}
