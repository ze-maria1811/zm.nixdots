{...}: 
{
	programs.nixvim = {
		plugins = {
			lsp = {
				enable = true;
				servers = {
					nil_ls.enable = true;
					pyright.enable = true;	
					texlab.enable = true;
					lua_ls = {
						enable = true;
						settings.diagnostics.globals = [ "vim" ];
					};
					ltex = {
						enable = true;
						settings.language = "pt-BR";
				 	};
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
				fromVscode = [	{}  ]; 
				settings.enable_autosnippets = true;
			};
	
			lualine.enable = true;
			fzf-lua.enable = true;
			telescope.enable = true;
			bufferline.enable = true;
			cmp-vimtex.enable = true;
			web-devicons.enable = true;
			nvim-autopairs.enable = true;
			nvim-ufo.enable = true;
			};
		};
}

