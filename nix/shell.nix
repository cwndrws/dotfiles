with (import <nixpkgs> {});
let
  settings = pkgs.vimUtils.buildVimPlugin {
    name = "neovim_settings";
    src = pkgs.fetchFromGitHub {
      owner = "cwndrws";
      repo = "neovim_settings";
      rev = "d3899d5bc74b35b33563ed7501895388325847a2";
      sha256 = "0g08n89m579wiyravj2rh8k8hyfi4cq11gypxsry5w1dv99ks403";
    };
  };
  myNeovim = pkgs.neovim.override {
    viAlias = true;
    vimAlias = true;
    configure = {
      plug.plugins = with pkgs.vimPlugins; [
        settings
        ale
        fzf-vim
        vim-dispatch
        vim-fugitive
        typescript-vim
        vim-rails
        gruvbox
        vim-easymotion
        emmet-vim
        auto-pairs
        vim-endwise
        vim-surround
        vim-test
        vim-nix
        airline
      ];
    };
  };
in
mkShell {
  buildInputs = [
    myNeovim
    ripgrep
    fzf
  ];
}
