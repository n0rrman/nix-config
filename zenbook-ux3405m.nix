{ config, lib, pkgs, modulesPath, ... }:

{

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
      intel-media-driver
      intel-compute-runtime
    ];
  };

  zramSwap.enable = true;
  zramSwap.memoryPercent = 200;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  # Intel NPU/VPU firmware
  hardware.firmware = [
    (
      let
        model = "37xx";
        version = "v1.5.1";
        fw-version = "v0.0";

        firmware = pkgs.fetchurl {
          url = "https://github.com/intel/linux-npu-driver/raw/${version}/firmware/bin/vpu_${model}_${fw-version}.bin";
          hash = "sha256-KVO9EF/faYV1g2st59fIgEHqCYIgM+JhSSfzOlcA7SU=";
        };
      in
      pkgs.runCommand "intel-vpu-firmware-${model}-${fw-version}" { } ''
        mkdir -p "$out/lib/firmware/intel/vpu"
        cp '${firmware}' "$out/lib/firmware/intel/vpu/vpu_${model}_${fw-version}.bin"
      ''
    )
  ];


  # hardware.opengl = {
  #     enable = true;
  #     driSupport = true;
  # };
  # DDC
  # boot.kernelModules = [ "kvm-intel" ];
  hardware.i2c.enable = true;
  boot.extraModulePackages = [ config.boot.kernelPackages.ddcci-driver ];
  boot.kernelModules = [ "kvm-intel" "i2c-dev" "ddcci_backlight" ];
  users.users.norrman.extraGroups = [ "i2c" ];

}
