{
  description = "wayfind-http";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";

      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
  };

  # nix flake show
  outputs =
    {
      nixpkgs,
      flake-utils,
      rust-overlay,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;

          overlays = [
            (import rust-overlay)
          ];
        };

        rustToolchain = pkgs.rust-bin.stable."1.81.0".minimal.override {
          targets = [
            "wasm32-unknown-unknown"
            "thumbv7m-none-eabi"
          ];
          extensions = [
            "clippy"
            "rust-analyzer"
            "rust-docs"
            "rust-src"
            "rustfmt"
          ];
        };
      in
      {
        devShells = {
          # nix develop
          default = pkgs.mkShell {
            name = "wayfind-http-shell";

            NIX_PATH = "nixpkgs=${nixpkgs.outPath}";

            buildInputs = with pkgs; [
              # Rust
              rustToolchain

              # Nix
              nixfmt-rfc-style
              nixd
            ];
          };
        };
      }
    );
}
