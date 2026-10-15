{pkgs, ...}:
{
  programs = {
    kitty = {
	enable = true;
#	settings = {
#	  shell = "/run/current-system/sw/bin/zsh";
#	};

#	font = {
#	package = pkgs.nerd-fonts.meslo-lg;
#	name = "MesloLG";
#	size = 11;
#        };
#
#	extraConfig = ''
#	  background_opacity 1.0
#	  confirm_os_window_close -1
#	'';
    };

    btop = {
	enable = true;
    };
	
    cava = {
	enable = true;
    };
  };
}
