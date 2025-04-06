_:
{
  users.users.next = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "libvirtd"
      "adbusers"
      "scanner"
      "lp"
    ];
  };
}
