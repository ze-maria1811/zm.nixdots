{...}:
{
	imports = [
		../common/configuration.nix
		./hardware-configuration.nix
		./nvidia-pc.nix
		];
	
	networking.hostname = "vren";

}

