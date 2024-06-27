{ pkgs
, mkShell
, ...
}:

mkShell {
  packages = with pkgs; [
    snowfallorg.flake
  ];
}