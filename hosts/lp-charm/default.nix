{pkgs, ...}:
{
	imports = [
		../common/configuration.nix
		./nvidia-lp.nix
		./hardware-configuration.nix
	];

	hardware.bluetooth = {
		enable = true;
		powerOnBoot = false;
	};
	
	networking = {
		hostName = "vrenlp";
		networkManager.enable = true;
		nameservers = [ 
			"1.1.1.1"
			"1.0.0.1"
		];
	};
	
	home-manager.users.vren = {
		home.packages = with pkgs; [
		  vscode 
		];
	};
}
