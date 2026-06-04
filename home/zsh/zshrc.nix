{pkgs, ...}:
{
  programs.zsh = {
	enable = true;
	enableCompletion = true;
	syntaxHighlighting.enable = true;
	sessionVariables.SUDO_EDITOR = "nvim";
	plugins = [
	{
	 name = "powerlevel10k";
	 src = pkgs.zsh-powerlevel10k;
	 file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
	}
     ];
	oh-my-zsh = {
	   enable = true;
	   plugins = ["git"];
	};
	initContent = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  };

  programs.fzf = {
	enable = true;
	enableZshIntegration = true;
  };

}
