{
  inputs.nixpkgs.url = "nixpkgs";
  description = "logic programming with prolog";
  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system} = rec {
        prolog = with pkgs; mkShell { buildInputs = [ swiProlog ]; };
        default = prolog;
      };
    };
}
