{config, ...}:

{
	hardware.nvidia = {
	package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
	modesetting.enable = true;
	open = false;
	nvidiaSettings = true;
	powerManagement.enable = false;
	};
  
   services.xserver.videoDrivers = ["nvidia"];
}
