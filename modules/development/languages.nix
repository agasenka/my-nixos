{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Compilers & Build Tools
    bear
    ccache
    clang
    clang-tools
    cmake
    gcc
    gnumake
    mold
    ninja
    pkg-config

    # Rust
    cargo
    clippy
    rustc
    rustfmt

    # Go
    go
    gopls

    # Zig
    zig

    # Python
    python3

    # JavaScript/Node
    nodejs

    # Java
    jdk

    # Lua
    lua
  ];
}
