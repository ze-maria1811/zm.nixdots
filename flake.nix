{
  description = "vren's wonderful nix build :)";
	# Credits for Vimjoyer for providing a nice template for me
  inputs = {
     nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

     home-manager = {
       url = "github:nix-community/home-manager/release-26.05";
       inputs.nixpkgs.follows = "nixpkgs";
     };

     nixvim = {
	url = "github:nix-community/nixvim/nixos-26.05";
	inputs.nixpkgs.follows = "nixpkgs";
     };

     "zm.nixdots" = {
	url = "github:ze-maria1811/zm.nixdots";
	flake = false;
     };

     hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
     stylix.url = "github:danth/stylix/release-26.05";

  };

  outputs = { self, nixpkgs, home-manager, hyprpanel, stylix, ... }@inputs: {
    nixosConfigurations = {
	pc-quark = nixpkgs.lib.nixosSystem { # PC host settings
	   specialArgs = {inherit self inputs;};
           system = "x86_64-linux";
	   modules = [
		./hosts/pc-quark
		stylix.nixosModules.stylix ./hosts/common/configuration.nix
		home-manager.nixosModules.home-manager { 
		  home-manager = {
		    extraSpecialArgs = {inherit inputs;};
		    useGlobalPkgs = true;
		    sharedModules = [inputs.nixvim.homeModules.nixvim]; 
		    users = {"vren" = import ./home/home.nix;};
		    }; 
	         }
	    ];
	};

	lp-charm = nixpkgs.lib.nixosSystem { # Laptop host settings
	   specialArgs = {inherit self inputs;};
	   system = "x86_64-linux";
	   modules = [
		./hosts/lp-charm
		stylix.nixosModules.stylix ./hosts/common/configuration.nix
		home-manager.nixosModules.home-manager { 
	          home-manager = {
		    extraSpecialArgs = {inherit inputs;};
		    useGlobalPkgs = true;
		    sharedModules = [inputs.nixvim.homeModules.nixvim];
		    users = {"vren" = import ./home/home.nix;};
		    }; 
	         }
	      ];
	   };
       };
   };
}
