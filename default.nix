{ pkgs ? import <nixpkgs> {} }:
let
  sources = pkgs.callPackage ./nix/sources.nix { };
in
rec {
  lib = import ./lib { inherit (pkgs) lib; };
  # home-manager modules
  hmModules = import ./hm-modules;
  # A list of all modules in hmModules.
  allHmModules = builtins.attrValues hmModules;
  # Overlays
  overlays = import ./overlays;

  id3 = pkgs.callPackage ./pkgs/id3 { };
  mopidy-podcast = pkgs.callPackage ./pkgs/mopidy-podcast { };
  ocamlweb = pkgs.callPackage ./pkgs/ocamlweb { };
  onedrive = pkgs.callPackage ./pkgs/onedrive { };
  passenv = pkgs.callPackage ./pkgs/passenv { inherit sources; };
}
