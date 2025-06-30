{ config, pkgs, ... }: {
	home = {
		username = "grizzly";
		homeDirectory = "/home/grizzly";
		stateVersion = "25.05";
		packages = with pkgs; [
			zsh-powerlevel10k
		];
	};

	imports = [
		./modules/bundle.nix
	];
}
