{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "e7a9acd71687c41db9981daf1a9e85a439eeb85d";
    sha256 = "1qdjfavfhxrbrrg6x5q3sxfdrxqpb6mm01y3askqlp753ff26xc6";
  };
}
