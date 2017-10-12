# This is used in the Travis build to install the Idris compiler.
let
  pkgs = import <nixpkgs> {};
  stdenv = pkgs.stdenv;
in {
  idris-patricia = stdenv.mkDerivation {
    name = "idris-patricia";
    src = ./.;
    buildInputs = with pkgs; [ haskellPackages.idris gmp ];
  };
}