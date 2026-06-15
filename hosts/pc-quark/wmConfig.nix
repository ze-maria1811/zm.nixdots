# Sets up the window-manager for host PC-Quark
# Import this file in ./default.nix to use it.
{pkgs, ...}:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet - time --cmd start-hyprland";
	user = "greeter";
      };
    };
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
