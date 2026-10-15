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
		extraPlugins = [luasnip-latex-snippets];
		extraConfigLuaPost = builtins.readFile ./snippets.lua;
	};
}
