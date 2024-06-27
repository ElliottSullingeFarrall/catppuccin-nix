{
  description = "Automatic Nix theming using Catppuccin and NerdFonts.";

  inputs = {
    snowfall-lib = {
      url = "github:snowfallorg/lib?ref=v3.0.3";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    snowfall-flake = {
			url = "github:snowfallorg/flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};

    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;
      src = ./.;

      snowfall.namespace = "catnerd";

      overlays = with inputs; [
        snowfall-flake.overlays."package/flake"
      ];
    };
}
