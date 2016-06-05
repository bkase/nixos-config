# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  zshSyntaxHighlighting = pkgs.callPackage ./custom-packages/zsh-syntax-highlighting.nix {};
  zshGitPrompt = pkgs.callPackage ./custom-packages/zsh-git-prompt/default.nix {};
  scmpuff = pkgs.callPackage ./custom-packages/scmpuff.nix {};

  vimrc = pkgs.callPackage ./vimrc.nix {};
  vimrcConfig = {
    vam.knownPlugins = pkgs.vimPlugins;
    vam.pluginDictionaries = [
      { names = [
        "vim-addon-nix"
        "ctrlp"
        "youcompleteme"
        "vim-airline"
        "vim-airline-themes"
        "surround"
        "Solarized"
        "The_NERD_Commenter"
        "rust-vim"

        "neomake"
        "vimproc"
        "haskell-vim"
        "haskellConcealPlus"
        "ghcmod"
        "necoGhc"
        "hoogle"
        "hlint-refactor"
      ];}
    ];
    customRC = vimrc.config;
  };

  my_vim = pkgs.vim_configurable.customize { name = "vim"; inherit vimrcConfig; };
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the gummiboot efi boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "hyrule"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  nix.nixPath = [ "/etc/nixos" "nixos-config=/etc/nixos/configuration.nix" ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    wget
    curl
    openssh
    mosh
    git

    # vim
    racerdRust
    my_vim

    # shell
    python27
    tmux
    screenfetch
    asciinema
    zshSyntaxHighlighting
    zshGitPrompt
    scmpuff
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.kdm.enable = true;
  # services.xserver.desktopManager.kde4.enable = true;

  # virtualisation.docker.enable = true;
  # virtualisation.docker.storageDriver = "btrfs";

  programs.zsh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.bkase = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    uid = 1000;
    shell = "/run/current-system/sw/bin/zsh";
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "15.09";
}
