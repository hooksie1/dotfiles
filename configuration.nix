{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  systemd = {
    enableUnifiedCgroupHierarchy = false;
  };

  networking = {
    hostName = "xps13";
    interfaces = {
      wlp0s20f3.useDHCP = true;
    };
  };

  time.timeZone = "America/New_York";


  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      #desktopManager.pantheon.enable = true;
    };
    gnome.core-developer-tools.enable = true;

    fprintd = {
      enable = true;
    };
    zerotierone = {
      enable = true;
    };
    
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jhooks = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ 
       "wheel" 
       "docker" 
       "libvirtd"
    ]; 
  };

  environment.systemPackages = with pkgs; [
    vim 
    wget
    firefox
    starship
    docker
    docker-compose
    go
    gcc
    libcap
    python3 
    jq
    vscode
    chrome-gnome-shell
    gnomeExtensions.floating-dock
    gnome.gnome-tweaks
    docker-compose
    hyper
    inkscape
    gimp
    jetbrains.goland
    spotify
    insomnia
    ferdi
    gnumake
    slack
    brave
    bitwarden
    authy
    zsh
    git
    tmux
    tdesktop
    zerotierone
    virt-manager
    velero
    libreoffice
    bash-completion
    google-cloud-sdk
    packer
    vagrant
    qemu-utils
    testdisk
    vlc
    dig
    lens
    kube3d 
    flameshot
    blender
    neovim
    pulumi-bin
    sops
    obs-studio
    asciinema
    gnome-network-displays
    poetry
  ];

  programs = {
    zsh = {
      enable = true;
    };
    vim = {
      defaultEditor = true;
    };
#    git = {
#      enable = true;
#      userName  = "John Hooks";
#      userEmail = "hooksie11@gmail.com";
#    };
#    vscode = {
#       enable = true;
#       package = pkgs.vscodium;
#       extensions = with pkgs.vscode-extensions; [
#         ms-python.python
#         eamodio.gitlens
#         golang.Go
#         ms-kubernetes-tools.vscode-kubernetes-tools
#         hashicorp.terraform
#         2gua.rainbow-brackets
#         robbowen.synthwave-vscode
#         ms-toolsai.jupyter-renderers
#         ms-toolsai.jupyter
#         sumneko.lua
#         bbenoist.nix
#         dart-code.dart-code
#         dart-code.flutter
#         rust-lang.rust
#         asciidoctor.asciidoctor-vscode
#         wayou.vscode-todo-highlight
#       ];
#    };
  };


  system.stateVersion = "21.05"; # Did you read the comment?

  virtualisation = {
    docker = {
      enable = true;
    };

    libvirtd = {
      enable = true;
    };

  };

}


