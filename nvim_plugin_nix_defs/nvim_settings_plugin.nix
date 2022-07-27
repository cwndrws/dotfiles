{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "ef2d02444507424a118caeaa5a0e72d8933b2efd";
    sha256 = "14z7rllai1ghvd3rrhfxkysq6pr4zrz7vnviz8nnsw0cyhmbpxph";
  };
}
