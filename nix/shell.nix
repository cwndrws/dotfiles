with (import <nixpkgs> {});
let
  myNeovim = pkgs.neovim.override {
    viAlias = true;
    vimAlias = true;
    configure = {
      plug.plugins = with pkgs.vimPlugins; [
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
      customRC = ''
        colorscheme gruvbox
        set number relativenumber
        let mapleader = "\<Space>"
        set incsearch
        set hlsearch
        set ignorecase
        set smartcase
        set listchars=tab:▸\ ,eol:¬,space:·

        let g:ale_fixers = ['remove_trailing_lines', 'trim_whitespace']
        let g:ale_fix_on_save = 1
      '';
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
