{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    tmux
    ripgrep
    zsh
  ];

  programs = {
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "sudo" ];
        theme = "bureau";
      };

      localVariables = {
        EDITOR = "vim";
      };
    };

    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      plugins = with pkgs.vimPlugins; [
        vim-airline
        gruvbox
        vim-nix
      ];

      extraConfig = ''
        set background=dark
        colorscheme gruvbox
        set expandtab
        set tabstop=2
        set shiftwidth=2
        set number
        set relativenumber
      '';
    };

    home-manager = {
      enable = true;
    };
  };
}
