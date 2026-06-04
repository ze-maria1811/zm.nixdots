{ pkgs, ... }:

{

imports = [

 ./nixvim/nixvim.nix
 ./zsh/zshrc.nix

];

  home.username = "vren";
  home.homeDirectory = "/home/vren";
  home.stateVersion = "26.05"; 
  
  home.packages = with pkgs; [
	discord
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
	
	font-awesome
	nerd-fonts.meslo-lg
	nerd-fonts.iosevka
	  
];

  # Sets wallpaper for Hyprland! (fix this)

#services.hyprpaper = {
#	enable = true;
#	settings = {
#	wallpaper = [
#	 {
#	 path = "/home/vren/.config/hypr/wallpapers/nixpapers/waifu_black.png";
#	 fit_mode = "cover";
#	      }
#	   ];
#	};	
#};

programs.kitty = { # Kitty settings: maybe make it a separate module ??
	enable = true;
	settings = {
	  shell = "/run/current-system/sw/bin/zsh";
	};
	extraConfig = ''
	  background_opacity 0.76
	  confirm_os_window_close -1
	'';
	font = {
	package = pkgs.nerd-fonts.meslo-lg;
	name = "MesloLG";
	size = 11;
	       };
};

programs.btop.enable = true; # Btop. Will configure declaratively later.
programs.waybar.enable = true;
programs.git = {
	enable = true;
	userName = "ze-maria1811";
	userEmail = "vitor.ctrrs@gmail.com";

};


  home.file = {

  ".config/hypr/hyprland.conf".source = ./hyprland/hyprland.conf;
  ".config/hypr/keybinds.conf".source = ./hyprland/keybinds.conf;
  ".config/hypr/hyprpaper.conf".source = ./hyprland/hyprpaper.conf;
  ".config/hypr/wallpapers" = {
	source = ./hyprland/wallpapers;
	recursive = true;
   };




".config/hypr/hyprpaper.conf".text = ''
wallpaper {
monitor = 
path = ~/.config/hypr/wallpapers/nixpapers/waifu_black.png
fit_mode = cover
    }
    '';


  };

  home.sessionVariables = {
	EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
