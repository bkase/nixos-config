# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "usbhid" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/700c2bb0-414b-417d-b4aa-6a3f71110197";
      fsType = "btrfs";
      options = [ "subvol=nixos" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/83D3-069E";
      fsType = "vfat";
    };


  #fileSystems."/var/lib/docker" =
  # { device = "/dev/disk/by-uuid/700c2bb0-414b-417d-b4aa-6a3f71110197";
  #   fsType = "btrfs";
  #   options = [ "subvol=@docker" ];
  # };

  swapDevices = [ ];

  nix.maxJobs = 8;
}
