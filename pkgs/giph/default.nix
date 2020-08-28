{ stdenv, lib, makeWrapper, ffmpeg, xdotool, slop, libnotify, procps }:
let
  path = lib.makeBinPath [ ffmpeg xdotool slop libnotify procps ];
in
stdenv.mkDerivation rec {
  pname = "giph";
  version = "1.1";
  src = fetchTarball {
    url = "https://github.com/phisch/giph/archive/${version}.tar.gz";
    sha256 = "0migk1jjbhyy01ljvcq82ncb0rgyh3j1d8ap2w1hhdky72c02jln";
  };

  nativeBuildInputs = [ makeWrapper ];

  phases = [ "patchPhase" "installPhase" ];

  installPhase = ''
    mkdir -p $out/bin

    makeWrapper $src/src/giph $out/bin/giph \
      --prefix PATH : "${path}"

    patchShebangs $out/bin/giph

    mkdir -p $out/share/man/man1
    cp $src/man/giph.1 $out/share/man/man1/giph.1
  '';
}
