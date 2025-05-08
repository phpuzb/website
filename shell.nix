{pkgs ? import <nixpkgs> {}}: let
  php-env = pkgs.php.buildEnv {
    extensions = {
      enabled,
      all,
    }:
      enabled ++ (with all; [xsl]);
    extraConfig = "memory_limit=-1";
  };
in
  pkgs.mkShell {
    buildInputs = with pkgs; [
      # Nix
      nixd
      alejandra
      statix
      deadnix

      # PHP
      php-env
      php-env.packages.composer
      symfony-cli
    ];
  }
