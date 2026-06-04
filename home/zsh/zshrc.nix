{...}:
{
  programs.zsh = {
	enable = true;
	enableCompletion = true;
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
  };

}
