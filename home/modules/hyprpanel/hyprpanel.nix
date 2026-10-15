{inputs, ...}: 
{
  imports = [
  inputs.hyprpanel.homeManagerModules.hyprpanel 
  ];

  programs.hyprpanel = {
		enable = true;
		systemd.enable = true;
		settings = {
			bar = {
				clock.format = "%a, %b. %d | %H:%M";
				layouts = {
					"all" = {
						left = [ 
						  "dashboard" 
						  "workspaces" 
						  "windowtitle" 
						];
	
						middle = [ 
						  "media" 
						];
	
						right = [ 
						  "cava" 
						  "volume" 
						  "network" 
						  "bluetooth" 
						  "battery" 
						  "clock" 
						  "notifications"
						];
					}; 
				};
			};
	     };
   };
}
