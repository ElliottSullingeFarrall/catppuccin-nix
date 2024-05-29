{ config
, lib
, pkgs
, ...
}:

let
  flavour = config.catnerd.flavour;
in
{
  zsh.initExtra = lib.mkIf config.catnerd.enable ''
    source ${pkgs.catppuccin-zsh-syntax-highlighting.override { inherit flavour; }}
  '';
}