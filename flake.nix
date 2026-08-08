{
  description = "Anime Box is an Anime Client which targets both desktop and Mobile 
  platforms using Flutter, to ensure users get a fancy experience watching their favorite 
  anime series with friends.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs =
    {
      nixpkgs,
      ...
    }:
    let
      system = "x86_64-linux";
      buildToolsVersion = "36.0.0";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          android_sdk.accept_license = true;
        };
      };

      androidSdk = pkgs.androidenv.composeAndroidPackages {
        platformVersions = [
          "31"
          "33"
          "34"
          "35"
          "36"
        ];

        cmdLineToolsVersion = "17.0";
        includeNDK = true;
        ndkVersions = [
          "28.2.13676358"
        ];

        buildToolsVersions = [
          "35.0.0"
          "36.0.0"
        ];

        cmakeVersions = [ "3.22.1" ];

        abiVersions = [
          "armeabi-v7a"
          "arm64-v8a"
          "x86_64"
        ];
      };

      sdkPath = "${androidSdk.androidsdk}/libexec/android-sdk";
      commonEnv = {
        ANDROID_SDK_ROOT = sdkPath;
        ANDROID_HOME = sdkPath;
        GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${sdkPath}/build-tools/${buildToolsVersion}/aapt2";
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell (
        commonEnv
        // {
          LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath (
            with pkgs;
            [
              mpv
            ]
          )}";

          buildInputs = with pkgs; [
            flutter
            glib
            mpv
            libepoxy
            pango
            pkg-config
            ninja
            at-spi2-core
            gtk3
            rustup
          ];
        }
      );
    };
}
