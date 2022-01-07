with (import <nixpkgs> {});
let
  settings = pkgs.vimUtils.buildVimPlugin {
    name = "neovim_settings";
    src = pkgs.fetchFromGitHub {
      owner = "cwndrws";
      repo = "neovim_settings";
      rev = "cbf4a0635022e5afea16d1bf56ae7e2639c5e526";
      sha256 = "0xsmb931ps4nczy6jg4a5ci1kzhndyzipgyfn63f6zkbfk6zf2vb";
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
      customRC = ''
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
