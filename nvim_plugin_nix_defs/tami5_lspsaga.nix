{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "lspsaga.nvim";
  src = pkgs.fetchFromGitHub {
    owner = "tami5";
    repo = "lspsaga.nvim";
    rev = "9968d7378a4bb3c13445bb6fd7937f3e757bfa0d";
    sha256 = "04p138pkix3h02710r1812r0c1lkzga6pj35k0c7yic0p040ba35";
  };
}
