{...}:
{
  programs.zsh = {
	enable = true;
	autosuggestions.enable = true;
	syntaxHighlighting.enable = true;
	sessionVariables.SUDO_EDITOR = "nvim";

	oh-my-zsh = {
	   enable = true;
	   theme = "powerlevel10/powerlevel10k";
	   plugins = ["git"];
	};
  };

  programs.fzf = {
	enable = true;
	enableZshIntegration = true;
	fuzzyCompletion = true;
	keybindings = true;
  };

}
