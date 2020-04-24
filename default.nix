let
  pin = import ((import ./nix/sources.nix).nixpkgs) {} ;
in
{ nixpkgs ? pin
}:
let
  tl = nixpkgs.texlive.combine
        { inherit (nixpkgs.texlive) scheme-full; };
in
nixpkgs.stdenv.mkDerivation {
  name = "infinite-paper";
  src = ./.;
  buildInputs = [ tl
                  #nixpkgs.haskellPackages.lhs2tex
                  nixpkgs.haskell.compiler.ghc881
                  nixpkgs.xsv  ];
  installPhase = ''cp build/paper.pdf $out'';

}
