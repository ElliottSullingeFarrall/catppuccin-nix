{ lib
, ... 
}:

{
  types = {
    flavourOption = lib.types.enum [ 
      "latte"
      "frappe"
      "macchiato"
      "mocha"
    ];
    accentOption = lib.types.enum [
      "blue"
      "flamingo"
      "green"
      "lavender"
      "maroon"
      "mauve"
      "peach"
      "pink"
      "red"
      "rosewater"
      "sapphire"
      "sky"
      "teal"
      "yellow"
    ];

    mainFontOption = lib.types.enum [
      "0xProto"
      "3270"
      "Agave"
      "AnonymousPro"
      "Arimo"
      "AurulentSansMono"
      "BigBlueTerminal"
      "BitstreamVeraSansMono"
      "CascadiaCode"
      "CascadiaMono"
      "CodeNewRoman"
      "ComicShannsMono"
      "CommitMono"
      "Cousine"
      "D2Coding"
      "DaddyTimeMono"
      "DejaVuSansMono"
      "DroidSansMono"
      "EnvyCodeR"
      "FantasqueSansMono"
      "FiraCode"
      "FiraMono"
      "GeistMono"
      "Go-Mono"
      "Gohu"
      "Hack"
      "Hasklig"
      "HeavyData"
      "Hermit"
      "iA-Writer"
      "IBMPlexMono"
      "Inconsolata"
      "InconsolataGo"
      "InconsolataLGC"
      "IntelOneMono"
      "Iosevka"
      "IosevkaTerm"
      "IosevkaTermSlab"
      "JetBrainsMono"
      "Lekton"
      "LiberationMono"
      "Lilex"
      "MartianMono"
      "Meslo"
      "Monaspace"
      "Monofur"
      "Monoid"
      "Mononoki"
      "MPlus"
      "Noto"
      "OpenDyslexic"
      "Overpass"
      "ProFont"
      "ProggyClean"
      "Recursive"
      "RobotoMono"
      "ShareTechMono"
      "SourceCodePro"
      "SpaceMono"
      "Terminus"
      "Tinos"
      "Ubuntu"
      "UbuntuMono"
      "UbuntuSans"
      "VictorMono"
      "ZedMono"
    ];
    monoFontOption = lib.types.enum [
      "AurulentSansM"
      "CodeNewRoman"
      "ComicShannsMono"
      "CommitMono"
      "DroidSansM"
      "FiraMono"
      "GeistMono"
      "Hasklug"
      "Hurmit"
      "MonaspiceAr"
      "MonaspiceKr"
      "MonaspiceNe"
      "MonaspiceRn"
      "MonaspiceXe"
      "OpenDyslexicM"
      "OverpassM"
    ];
  };

  # string -> string
  # this removes the first letter in a string,
  # which is sometimes needed in order to format
  # the colours correctly
  mkColour = str:
    builtins.substring 1 (builtins.stringLength str) str;

  # string -> string
  # this capitalizes the first letter in a string,
  # which is sometimes needed in order to format
  # the names of themes correctly
  mkUpper = str:
    (lib.toUpper (builtins.substring 0 1 str)) + (builtins.substring 1 (builtins.stringLength str) str);
}