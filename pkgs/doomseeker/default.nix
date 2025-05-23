{
  lib,
  stdenv,
  cmake,
  fetchFromBitbucket,
  wrapQtAppsHook,
  pkg-config,
  qtbase,
  qttools,
  qtmultimedia,
  zlib,
  bzip2,
  xxd,
}:

stdenv.mkDerivation {
  pname = "doomseeker";
  version = "2024-11-24";

  src = fetchFromBitbucket {
    owner = "Doomseeker";
    repo = "doomseeker";
    rev = "2098b2eec400cdab4c3188df385349bd7913c32d";
    hash = "sha256-J7gesOo8NUPuVaU0o4rCGzLrqr3IIMAchulWZG3HTqg=";
  };

  patches = [
    ./dont_update_gitinfo.patch
    ./add_gitinfo.patch
    ./fix_paths.patch
  ];

  nativeBuildInputs = [
    wrapQtAppsHook
    cmake
    qttools
    pkg-config
    xxd
  ];
  buildInputs = [
    qtbase
    qtmultimedia
    zlib
    bzip2
  ];

  hardeningDisable = lib.optional stdenv.hostPlatform.isDarwin "format";

  # Doomseeker looks for the engines in the program directory
  postInstall = ''
    mv $out/bin/* $out/lib/doomseeker/
    ln -s $out/lib/doomseeker/doomseeker $out/bin/
  '';

  meta = with lib; {
    homepage = "http://doomseeker.drdteam.org/";
    description = "Multiplayer server browser for many Doom source ports";
    mainProgram = "doomseeker";
    license = licenses.gpl2Plus;
    platforms = platforms.unix;
    maintainers = [ ];
  };
}

