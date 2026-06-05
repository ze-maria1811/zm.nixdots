{pkgs, ...}:
{
  home.packages = with pkgs; [
	font-awesome

	(with nerd-fonts; [
	  meslo-lg
	  iosevka
	  ])
  ];
}
