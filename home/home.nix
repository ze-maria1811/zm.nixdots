{inputs, pkgs, ... }:
{
 imports = [
 ./modules/programs.nix
 ./modules/fonts.nix
 ./nixvim/nixvim.nix
 ./zsh/zshrc.nix
  ];

  programs.home-manager.enable = true;

  home = { 
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
	zathura
	jdk	
	hyprpaper
	firefox
	obsidian
	inkscape
	wallust
	zsh-powerlevel10k
	font-awesome
	nerd-fonts.meslo-lg
	nerd-fonts.iosevka
    ];
  };

  home.file =  {
    ".config/hypr/hyprland.conf" = { 
	source = inputs."zm.nixdots" + "/home/hyprland/hyprland.conf";
	force = true;
	  };

    ".config/hypr/keybinds.conf" = {
	source = inputs."zm.nixdots" + "/home/hyprland/keybinds.conf";
	force = true;
	  };

    ".config/hypr/hyprpaper.conf" = {
	source = inputs."zm.nixdots" + "/home/hyprland/hyprpaper.conf";
	force = true;
	  };

    ".config/hypr/wallpapers" = {
	source = inputs."zm.nixdots" + "/home/hyprland/wallpapers";
	force = true;
	recursive = true;
	   };

    ".p10k.zsh" = {
	source = inputs."zm.nixdots" + "/home/zsh/.p10k.zsh";
	force = true;
	  };
  };

}
