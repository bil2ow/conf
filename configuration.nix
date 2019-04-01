# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use kvm and docker
  boot.kernelModules = [ "kvm-amd" "kvm-intel" ];
  virtualisation.libvirtd.enable = true;
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
    extraOptions = "--registry-mirror=https://docker.mirrors.ustc.edu.cn";
  };
  
  fileSystems."/data" = {
    device = "/dev/sda1";
    fsType = "ext4";
  };
  
  nixpkgs.config.allowUnfree = true;
  
  nix.gc = {
    automatic = true;
    dates = "thursday";
  };
  nix.trustedUsers = [ "root" "billow" ];
  
  networking.networkmanager.enable = true;

  networking.hostName = "white-rabbit"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.wifi.macAddress = "random";
  networking.networkmanager.ethernet.macAddress = "random";

  networking.proxy.default = "http://10.177.3.246:1080/";
  networking.proxy.noProxy = "127.0.0.1,localhost,10.*";

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };
  
  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ libpinyin ];
  };
  
  fonts = {
    enableFontDir = true;

    fontconfig.defaultFonts = {
      monospace = [ "Sarasa Mono SC" ];
      sansSerif = [ "Sarasa UI SC" ];
      serif = [ "Sarasa UI SC" ];
    };
    
    fonts = with pkgs; [
      source-code-pro
      fira-code
      fira-code-symbols
      hack-font
      sarasa-gothic
      source-han-sans-simplified-chinese
    ];
  };

  time.timeZone = "Asia/Shanghai";

  environment.systemPackages = with pkgs; [
    binutils
    pciutils
    wget
    curl
    git
    gnupg
    emacs
    firefox
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = { enable = true; enableSSHSupport = true; };
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  
  services.emacs.enable = true;
  services.hoogle.enable = true;
  
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable Nvidia
  hardware.nvidia.optimus_prime.enable = true;
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.optimus_prime.intelBusId = PCI:0:2:0;
  hardware.nvidia.optimus_prime.nvidiaBusId = PCI:1:0:0;
  services.xserver.videoDrivers = [ "nvidia" ];

  # Enable cuda and opengl
  services.xmr-stak.cudaSupport = true;
  hardware.opengl.enable = true;


  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  # services.xserver.autorun = false;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  services.fstrim = {
    enable = true;
    interval = "tuesday";  
  };

  users.users.billow = {
    isNormalUser = true;
    uid = 1000;
    home = "/home/billow";
    extraGroups = [ "wheel" "networkmanager" "docker" "libvirtd" "kvm" ];
    packages = with pkgs; [
    vscode
    android-studio
    apktool
    jetbrains.idea-ultimate
    jetbrains.pycharm-professional
    jetbrains.clion
    stack
    fsharp
    fstar
    ocaml
    opam
    openjdk
    gradle
    (python37Full.withPackages (p: with p; [ setuptools pip pipenv ]))
    nodejs-10_x
    (yarn.override { nodejs = nodejs-10_x; })
    cmake
    clang
    xclip
    hexchat
    thunderbird
    tdesktop
    ];
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.09"; # Did you read the comment?
  system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channels/nixos-unstable";
  };
}
