{pkgs, ...}:

let
luasnip-latex-snippets = pkgs.vimUtils.buildVimPlugin {
  name = "luasnip-latex-snippets";
  src = pkgs.fetchFromGitHub {
    owner = "iurimateus";
    repo = "luasnip-latex-snippets.nvim";
    rev = "master";
    sha256 = "sha256-0Q24sRsmdUCr7V3jod9XmgeUev3BfmiHj5OmrEZiXSI="; 
  };
  doCheck = false;
};
in

{
  programs.nixvim = {
	enable = true;
	colorschemes.kanagawa.enable = true;
	globals.mapleader = " ";
	extraPlugins = [luasnip-latex-snippets];
	extraConfigLuaPost = ''
		require("luasnip").config.setup({enable_autosnippets = true})
		require("luasnip-latex-snippets").setup({use_treesitter = true})
		require("fzf-lua").setup({})
		require("leap").setup({})
	
	        '';	
	opts = {
	  mouse = "";
	};
	keymaps = [ 

	 # First, a necessary evil...
	 {  mode = ["n" "i" "v"]; key = "<Up>"; action="<Nop>"; } 
	 {  mode = ["n" "i" "v"]; key = "<Down>"; action="<Nop>"; } 
	 {  mode = ["n" "i" "v"]; key = "<Left>"; action="<Nop>"; } 
	 {  mode = ["n" "i" "v"]; key = "<Right>"; action="<Nop>"; }

	 # Diagnostic related settings
	 {
	    mode = "n";
            key = "<leader>d";
            action = "<cmd>lua vim.diagnostic.open_float()<CR>";
            options.desc = "Show diagnostic under the cursor";
         
         }
         { 
            mode = "n";
            key = ">d";
            action = "<cmd>lua vim.diagnostic.jump({count  = 1, float = true })<CR>";
            options.desc = "Next diagnostic";
         }
	 {
            mode = "n";
            key = "<d";
            action = "<cmd>lua vim.diagnostic.jump({count = -1, float = true})<CR>";
            options.desc = "Previous diagnostic";
         }
         {
            mode = "n";
            key = "D";
            action = "<cmd>Telescope diagnostics<CR>";
            options.desc = "Opens a fuzzy diagnostics window";
	 }


	 # fzf-lua
	 { mode = "n";
           key = "<leader>ff";
	   action = "<cmd>FzfLua files<CR>";
	   options.desc = "Opens fuzzy file lookup";
	 }
         {
            mode = "n";
            key = "<leader>fg";
            action = "<cmd>FzfLua grep_curbuf<CR>";
            options.desc = "Looks up text in the current file";
         }
         {
            mode = "n";
            key = "<leader>fr";
            action = "<cmd>FzfLua resume<CR>";
            options.desc = "Resumes previous fuzzy search";
         }
         {
            mode = "n";
            key = "<leader>ffq";
            action = "<cmd>lua require('fzf-lua').files({ cwd = vim.fn.input('Directory: ')})<CR>";
            options.desc = "Looks up files starting from a specified directory";
         }
         {
            mode = "n";
            key = "<leader>ffo";
            action = "<cmd>FzfLua oldfiles<CR>";
            options.desc = "Searches recently open files";
         }
         {
            mode = "n";
            key = "<leader>ffe";
            action = "<cmd>FzfLua files cwd=~/.config/nixos<CR>";
            options.desc = "Looks up files starting from ~/.config/nixos";
         }
         {
            mode = "n";
            key = "<leader>ffc";
            action = "<cmd>FzfLua files cwd=~/.config<CR>";
            options.desc = "Looks up files starting from ~/.config";
         }

	 #Leap
         {
            mode = ["n" "x" "o"];
            key = "s";
            action = "<Plug>(leap-forward)";
         }
         {
            mode = ["n" "x" "o"];
            key = "S";
            action = "<Plug>(leap-backward)";
         }

	 #Neo-tree
         {
            mode = "n";
            key = "<leader>e";
            action = "<cmd>Neotree action=focus position=left toggle=true<CR>";
	    options.desc = "Shows a filetree";
         }
	
	 #Bufferline
	 {  mode = "n"; key = "<leader>1"; action = "<cmd>BufferLineGoToBuffer 1<CR>";}
	 {  mode = "n"; key = "<leader>2"; action = "<cmd>BufferLineGoToBuffer 2<CR>";}
	 {  mode = "n"; key = "<leader>3"; action = "<cmd>BufferLineGoToBuffer 3<CR>";}
	 {  mode = "n"; key = "<leader>4"; action = "<cmd>BufferLineGoToBuffer 4<CR>";}
	 {  mode = "n"; key = "<leader>5"; action = "<cmd>BufferLineGoToBuffer 5<CR>";}
	 {  mode = "n"; key = "<leader>6"; action = "<cmd>BufferLineGoToBuffer 6<CR>";}
	 {  mode = "n"; key = "<leader>7"; action = "<cmd>BufferLineGoToBuffer 7<CR>";}
	 {  mode = "n"; key = "<leader>8"; action = "<cmd>BufferLineGoToBuffer 8<CR>";}
	 {  mode = "n"; key = "<leader>9"; action = "<cmd>BufferLineGoToBuffer 9<CR>";}

    ];	

	plugins = {
		lsp = {
			enable = true;
			servers = {
			 nil_ls.enable = true;
			 pyright.enable = true;
			 ltex.enable = true;
			 texlab.enable = true;
			 };
		     };

		vimtex = {
			enable = true;
			settings = {
			  quickfix_mode = 0;
			  conceallevel = 1;
			  view_method = "zathura_simple";
			           };
		};

		treesitter = {
			enable = true;
			highlight = {
				enable = true;
				disable = ["latex"]; 
				    };
			indent.enable = true;
			folding.enable = true;
			autoLoad = true;
 			     };

		leap = {
			enable = true;
			autoLoad = true;
		       };

		neo-tree = {
			enable = true;
			settings = {
			  filesystem = {
			    follow_current_file = {
			    	enabled = true;
				leave_dirs_open = true;
						};
			                };
		
				 };

			   };

		cmp = {
			enable = true;
			autoEnableSources = true;
			settings = {
			  sources = [	
			    {name = "nvim_lsp"; }
			    {name = "path"; }
			    {name = "buffer"; }
			    {name = "luasnip"; }
		        	    ];

			     mapping = {
			     	"<Tab>" = "cmp.mapping(function(fallback) if cmp.visible() then cmp.select_next_item() elseif require('luasnip').expand_or_jumpable() then require('luasnip').expand_or_jump() else fallback() end end, {'i', 's'})";

				"<S-Tab>" = "cmp.mapping(function(fallback) if cmp.visible() then cmp.select_prev_item() elseif require('luasnip').jumpable(-1) then require('luasnip').jump(-1) else fallback() end end, {'i', 's'})";

				"<CR>" = "cmp.mapping.confirm({ select = true })";
			               };


				   };

		      };

		luasnip = {
			enable = true;
			fromVscode = [	{}  ]; };

		lualine.enable = true;
		fzf-lua.enable = true;
		telescope.enable = true;
		bufferline.enable = true;
		cmp-vimtex.enable = true;
		web-devicons.enable = true;
		nvim-autopairs.enable = true;
	       };
	};

  programs.zathura = {
    enable = true;
    options = {
	selection-clipboard = "clipboard";
	default-bg = "#1F1F28";
	default-fg = "#C8C093";
	recolor = true;
	recolor-lightcolor = "#1F1F28";
	recolor-darkcolor = "#FFFFFF";
    };
  };



}
