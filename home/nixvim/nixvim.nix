{...}:
{
	imports = [
	./keymaps.nix
	./plugins.nix
	./snippets/snippets.nix
	./greeter/alpha.nix
	];

	programs.nixvim = {
		enable = true;
		colorschemes.gruvbox.enable = true;
		globals = {
			mapleader = " ";
			vimtex_compiler_latexmk.aux_dir = "build";
		};
		opts = {
			foldcolumn = "1";
			foldlevel = 99;
			foldlevelstart = 99;
			foldenable = true;

			mouse = "";
			number = true;
		};
		extraConfigLuaPost = ''
			require("fzf-lua").setup({})
			require("leap").setup({})
		        '';	
	};

	programs.zathura = {
	    enable = true;
	    options = {
		selection-clipboard = "clipboard";
    	    };
  	};
}
