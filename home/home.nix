{pkgs, ... }:
{
 imports = [
 ./modules/programs.nix
 ./modules/fonts.nix
 ./nixvim/nixvim.nix
 ./zsh/zshrc.nix
  ];

  programs.home-manager.enable = true;

  home = { # General home settings 
    username = "vren";
    homeDirectory = "/home/vren";
    stateVersion = "26.05";
    sessionVariables = {
	EDITOR = "nvim";
    };
    packages = with pkgs; [
	vim
	spotify
	cmatrix
	fastfetch
	jdk	
	hyprpaper
	hyprpanel
	firefox
	obsidian
	inkscape
	wallust
	zsh-powerlevel10k
	mpv
	swayimg
	font-awesome
	nerd-fonts.meslo-lg
	nerd-fonts.iosevka
    ];
  };

  home.file =  { # Dotfile configuration
    ".config/hypr/hyprland.conf" = { 
    	source = "${./hyprland/hyprland.conf}";
	force = true;
	  };

    ".config/hypr/keybinds.conf" = {
    	source = "${./hyprland/keybinds.conf}";
	force = true;
	  };

    ".config/hypr/hyprpaper.conf" = {
    	source = "${./hyprland/hyprpaper.conf}";
	force = true;
	  };

    ".config/hypr/wallpapers" = {
	source = "${./hyprland/wallpapers}";
	force = true;
	recursive = true;
	   };

    ".p10k.zsh" = {
	source = "${./zsh/.p10k.zsh}";
	force = true;
	  };
  };

}
