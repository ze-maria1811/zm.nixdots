{ pkgs, inputs, ... }:

{

  imports =
    [ 
       inputs.home-manager.nixosModules.default
    ];


  nix = { # Nix related settings; enables nix-command and flakes.
  	settings = {
	  experimental-features = ["nix-command" "flakes"];
	};
	nixPath = [
	  "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
	  "nixos-config=/home/vren/.config/nixos/hosts/common/configuration.nix"
	  "/nix/var/nix/profiles/per-user/root/channels"
	];
  };

  nixpkgs.config.allowUnfree = true;
  programs.zsh.enable = true;
  services.printing.enable = true;

  boot = { # Bootloader and Kernel Version Settings
	loader = {
	  systemd-boot.enable = true;
	  efi.canTouchEfiVariables = true;
	  };

	kernelPackages = pkgs.linuxPackages_latest;
  };

  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

 programs.hyprland = { #Enables Hyprland
  	enable = true;
 	xwayland.enable = true;
  };

services.greetd = { # Enables greetd
	enable = true;
	settings = {
	 default_session = {
	  command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd start-hyprland";
	  user = "greeter";
		};
	};
};

  services.xserver.xkb = { # Xkb settings
    layout = "br";
    variant = "abnt2";
  };

  services.pipewire = { # Audio settings
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
  };

  users.users.vren = { # Manage user
    isNormalUser = true;
    description = "fysiks";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
  
  environment.shells = with pkgs; [ zsh ];
  environment.systemPackages = with pkgs; [
     wget
     python3
  ];

nix.gc = { #Garbage collection
	automatic = true;
	dates = "weekly";
	options = "--delete-older-than 14d";
};

  system.stateVersion = "25.05";

}
