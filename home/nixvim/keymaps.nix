{...}:
{
	programs.nixvim = {
		keymaps = [ 

		 # Disables arrow keys
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
		 {  mode = "n"; key = "<leader>bd"; action = "<cmd>bdelete<CR>";}
		];	
	};
}
