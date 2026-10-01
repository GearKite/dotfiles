{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  ninja,
  pkg-config,
  obs-studio,
  ffmpeg,
  android-tools,
}:

stdenv.mkDerivation {
  pname = "obs-scrcpy-camera";
  version = "unstable-2026-01-01";

  src = fetchFromGitHub {
    owner = "NanKillBro";
    repo = "scrcpy-camera";
    rev = "main";
    sha256 = "sha256-L5w9kGkvAJWAxA2WHHr8F0ez6q5/KzWJZHLUxxZ2t9M=";
  };

  nativeBuildInputs = [
    cmake
    ninja
    pkg-config
  ];
  buildInputs = [
    obs-studio
    ffmpeg
    android-tools
  ];

  cmakeFlags = [ "-DCMAKE_BUILD_TYPE=Release" ];

  installPhase = ''
    mkdir -p $out/lib/obs-plugins
    cp scrcpy-camera.so $out/lib/obs-plugins/
  '';

  meta = with lib; {
    description = "OBS plugin for Android camera capture via scrcpy";
    homepage = "https://github.com/NanKillBro/scrcpy-camera";
    license = licenses.gpl2Plus;
    platforms = platforms.linux;
  };
}
