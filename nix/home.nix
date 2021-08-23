{ config, pkgs, ... }:

{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "docker";
  home.homeDirectory = "/home/docker";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}

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
