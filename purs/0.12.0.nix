{ pkgs ? import <nixpkgs> {} }:

let
  version = "v0.12.0";

  src = if pkgs.stdenv.isDarwin
    then pkgs.fetchurl {
      url = "https://github.com/purescript/purescript/releases/download/v0.12.0/macos.tar.gz";
      sha256 = "0fnkj0b8ll159svz7gxsi0ph7dnf6ay5p14jikd983f7m65z5jfb";
    }
    else pkgs.fetchurl {
      url = "https://github.com/purescript/purescript/releases/download/v0.12.0/linux64.tar.gz";
      sha256 = "1wf7n5y8qsa0s2p0nb5q81ck6ajfyp9ijr72bf6j6bhc6pcpgmyc";
    };

in import ./mkPursDerivation.nix {
  inherit pkgs version src;
}
