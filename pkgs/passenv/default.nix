{ pkgs }:
let sources = import ../../nix/sources.nix; in
pkgs.haskellPackages.callPackage "${sources.passenv}/passenv.nix" { }
