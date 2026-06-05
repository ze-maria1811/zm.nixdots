{pkgs, ...}:
{
	imports = [
		../common/configuration.nix
		./hardware-configuration.nix
		./nvidia-pc.nix
		];
	
	networking.hostName = "vren";
	home-manager.users.vren = {
		home.packages = with pkgs; [
		  steam
		  discord
		];
	};
}

