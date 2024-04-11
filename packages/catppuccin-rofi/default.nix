{ lib
, stdenv
, fetchFromGitHub
, flavour
, accent
}:
let
  palette = import ../palette.nix;
in
stdenv.mkDerivation rec {
  pname = "catppuccin-rofi";
  version = "unstable-2022-12-31";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "rofi";
    rev = "5350da41a11814f950c3354f090b90d4674a95ce";
    hash = "sha256-DNorfyl3C4RBclF2KDgwvQQwixpTwSRu7fIvihPN8JY=";
  };

  patches = [ ./vars.patch ];

  installPhase = ''
    substitute basic/.local/share/rofi/themes/catppuccin-${flavour}.rasi $out \
      --subst-var-by accent '${builtins.toString palette.${flavour}.${accent}}' \
      --subst-var-by button '${builtins.toString palette.${flavour}.${accent}}'
  '';

  meta = with lib; {
    description = "Soothing pastel theme for Rofi";
    homepage = "https://github.com/catppuccin/rofi";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "catppuccin-rofi";
    platforms = platforms.all;
  };
}