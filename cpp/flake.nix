{
  description = "Basic development shell for c++23 (with clang)";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
    in
    {
      devShells.x86_64-linux.default = with pkgs; mkShell.override { stdenv = llvmPackages_17.libcxxStdenv; } {
        packages = [
          cmake
          (hiPrio clang-tools.override { llvmPackages = llvmPackages_17; enableLibcxx = true; })
        ];
      };
    };
}

