{ config
, lib
, pkgs
, ...
}:

let
  flavour = config.catnerd.flavour;
in
{
  programs.zsh.initExtra = lib.mkIf config.catnerd.enable ''
    source ${pkgs.catnerd.catppuccin-zsh-syntax-highlighting.override { inherit flavour; }}
  '';
}