{
  description = "A Nix flake for Wireguard tools and Neovim";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    # Add support for aarch64-linux
    defaultPackage.aarch64-linux = nixpkgs.legacyPackages.aarch64-linux.neovim;

    devShell.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.mkShell {
      buildInputs = [ nixpkgs.legacyPackages.x86_64-linux.wireguard-tools nixpkgs.legacyPackages.x86_64-linux.neovim ];
    };

    devShell.aarch64-linux = nixpkgs.legacyPackages.aarch64-linux.mkShell {
      buildInputs = [ nixpkgs.legacyPackages.aarch64-linux.wireguard-tools nixpkgs.legacyPackages.aarch64-linux.neovim ];
    };
  };
}
