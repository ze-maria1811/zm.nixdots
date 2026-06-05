{pkgs, ...}:
{
  home.packages = with pkgs; [
	font-awesome
	nerd-fonts.meslo-lg
	nerd-fonts.iosevka
  ];
}
