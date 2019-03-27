let
  _nixpkgs = import <nixpkgs> {};
in
{ nixpkgs ? import (_nixpkgs.fetchFromGitHub { owner = "NixOS"
                                              ; repo  = "nixpkgs"
                                              ; rev   = "e6808e30ae2b10f09e8f55e340d1b57f24027010"
                                              ; sha256 = "148gms9s3xzqnjw53v5w2c54l3vff6zd3krq9kp4arny9fm3y95i";}) {}
  }:
let
  pkgs = _nixpkgs; #if nixpkgs == null then _nixpkgs else nixpkgs;
  ghc = pkgs.haskellPackages.ghcWithPackages (ps: with ps;
        [
        ]);
  tl = pkgs.texlive.combine
        { inherit (nixpkgs.texlive) scheme-full; };
in
pkgs.stdenv.mkDerivation {
  name = "generic-lens-paper";
  src = ./.;
  installPhase = ''cp generic-lens-out.pdf $out'';
  buildInputs = [ ghc tl
                  pkgs.haskellPackages.lhs2tex pkgs.xsv  ];
}
