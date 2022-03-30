{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let
  freetype-minimal = freetype.overrideAttrs (o: {
    propagatedBuildInputs = [];
    configureFlags = o.configureFlags ++ ["--with-zlib=no"
                                          "--with-bzip2=no"
                                          "--with-png=no"
                                          "--with-harfbuzz=no" ];
  });

in

pkgs.mkShell {
  buildInputs = [
    cmake
    libtool
    autoconf
    automake
    pkgconfig
    gdb
    freetype-minimal
    ];
}
