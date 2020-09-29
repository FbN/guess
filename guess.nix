{ mkDerivation, base, random, stdenv }:
mkDerivation {
  pname = "guess";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  libraryHaskellDepends = [ base random ];
  executableHaskellDepends = [ base random ];
  license = "unknown";
  hydraPlatforms = stdenv.lib.platforms.none;
}
