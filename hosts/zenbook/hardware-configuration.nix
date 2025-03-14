# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "vmd" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];


  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/98922758-8383-4060-909a-6924e2661ff7";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-42fec362-b750-4324-8c92-9c91b20ebf29".device = "/dev/disk/by-uuid/42fec362-b750-4324-8c92-9c91b20ebf29";

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/1132-76A8";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  fileSystems."/home" =
    {
      device = "/dev/disk/by-uuid/f31d81ed-fff1-42af-9710-0e67de27734a";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-9ac4009a-9ea3-4eaf-b257-3cdb259bac56".device = "/dev/disk/by-uuid/9ac4009a-9ea3-4eaf-b257-3cdb259bac56";

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

