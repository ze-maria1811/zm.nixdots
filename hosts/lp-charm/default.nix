{...}:

{
	imports = [
		./nvidia-lp.nix
		./hardware-configuration.nix
		../common/configuration.nix
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

}
