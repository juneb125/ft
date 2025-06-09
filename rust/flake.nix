{
  description = "Rust project flake template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs, }: let
    systems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];
    forEachSystem = nixpkgs.lib.genAttrs systems;
    pkgs = nixpkgs.legacyPackages;
    # -- MAIN PKG --
    mainPkg = {rustPlatform}:
      rustPlatform.buildRustPackage {
        pname = "rust-template";
        version = "0.1.0";
        src = ./.;
        cargoLock.lockFile = ./Cargo.lock;
      };
  in {
    packages = forEachSystem (system: {
      default = pkgs.${system}.callPackage mainPkg {};
    });
  };
}
