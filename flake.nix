{
  description = "Anime Box is an Anime Client which targets both desktop and Mobile 
  platforms using Flutter, to ensure users get a fancy experience watching their favorite 
  anime series with friends.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-stable,
      rust-overlay,
      ...
    }:
    let
      system = "x86_64-linux";
      buildToolsVersion = "36.0.0";
      overlays = [ (import rust-overlay) ];
      pkgs = import nixpkgs {
        inherit system overlays;
        config = {
          allowUnfree = true;
          android_sdk.accept_license = true;
        };
      };

      pkgs-stable = import nixpkgs-stable { inherit system; };

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
            pkgs-stable.chromium
            pango
            pkg-config
            at-spi2-core
            gtk3
            rustup
            (pkgs.rust-bin.stable.latest.default.override {
              targets = [
                "aarch64-linux-android"
                "armv7-linux-androideabi"
                "x86_64-linux-android"
              ];
            })
          ];
        }
      );
    };
}
