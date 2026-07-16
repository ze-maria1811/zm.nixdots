{pkgs, ...}:
{
	imports = [
		../common/configuration.nix
		./nvidia-lp.nix
		./hardware-configuration.nix
		./keyd.nix
	];

	hardware.bluetooth = {
		enable = true;
		powerOnBoot = false;
	};
	
	networking = {
		hostName = "vrenlp";
		networkmanager.enable = true;
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

	services.keyd = {
		enable = true;
		config = ''
		[ids]
		0001:0001
		[main]
		up = noop
	'';
	};
}
