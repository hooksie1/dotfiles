{
  description = "System Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
    let
      configuration = { pkgs, ...}: {
        environment.systemPackages =
          [
            pkgs.odin
            pkgs.vlang
            pkgs.nats-server
	    pkgs.natscli
          ];
        nix.enable = true;
        nix.settings.experimental-features = "nix-command flakes";
        programs.zsh.enable = true;
        nixpkgs.hostPlatform = "aarch64-darwin";
        system.configurationRevision = self.rev or self.dirtyRev or null;
        system.stateVersion = 5;
      };
    in
    {
      darwinConfigurations."personal" = nix-darwin.lib.darwinSystem {
        modules = [ configuration ];
      };

      darwinPackages = self.darwinConfigurations."personal".pkgs;
    };
}
