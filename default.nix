{pkgs ? import <nixpkgs> {}}: let
  version = "1.0.0";
in
  pkgs.php.buildComposerProject (finalAttrs: {
    pname = "website";
    inherit version;
    src = ./.;
    vendorHash = "sha256-pN7TFuH9h04+4X3h06bodhd4vc067TDAwvbWBYgePDU=";

    postInstall = ''
      # Create web output directory
      mkdir -p $out/www

      # Copy produced SSG output
      cp -R ./_site/* $out/www
    '';
  })
