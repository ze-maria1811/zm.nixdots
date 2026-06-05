{pkgs, ...}:
{
  fonts = {
    enableDefaultPackages = true;
    fontconfig.enable = true;
  };

  home.packages = with pkgs; [
	font-awesome

	(with nerd-fonts; [
	  meslo-lg
	  iosevka
	  ])
  ];
}
