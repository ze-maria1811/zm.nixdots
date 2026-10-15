{config, ...}:
let 
  nl = {type = "padding"; 
	val = 2; };
  mk = config.lib.nixvim.mkRaw;
in
{
	programs.nixvim.plugins.alpha = {
		enable = true;
		settings.layout = import ./layout { inherit nl mk; };
	};

}
