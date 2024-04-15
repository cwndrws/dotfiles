{ config, pkgs, ... }:

let
  user = import ./user.nix;
  settings_module = if builtins.pathExists (./. +
  "/nvim_plugin_nix_defs/local_nvim_settings_plugin.nix")
    then (import ./nvim_plugin_nix_defs/local_nvim_settings_plugin.nix)
    else (import ./nvim_plugin_nix_defs/nvim_settings_plugin.nix);

  settings = settings_module pkgs;
  lspsaga_module = import ./nvim_plugin_nix_defs/tami5_lspsaga.nix;
  lspsaga = lspsaga_module pkgs;
  octo = pkgs.vimUtils.buildVimPlugin {
    name = "octo";
    src = pkgs.fetchFromGitHub {
      owner = "pwntester";
      repo = "octo.nvim";
      rev = "792cca0d72d8f59767448a5dac2b0bec52933f17";
      sha256 = "1hvbqa6blw7k5srlcy08s2vhrv01ycx51hg67mgy8cadsjclig2c";
    };
  };
in
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = user.username;
  home.homeDirectory = user.homeDirectory;


  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";
  home.packages = with pkgs; [
    ripgrep
    jq
    rustup
    sumneko-lua-language-server
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      settings
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      lspsaga
      nvim-treesitter
      neodev-nvim
      ale
      fzf-vim
      vim-dispatch
      vim-fugitive
      vim-rhubarb
      typescript-vim
      vim-rails
      gruvbox
      emmet-vim
      vim-endwise
      vim-surround
      vim-test
      vim-nix
      airline
      octo
      telescope-nvim
      nvim-web-devicons
      plenary-nvim
      vimux
      vim-oscyank
      ferret
    ];
  };
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "bureau";
      plugins = [
        "git"
        "history"
        "fzf"
        "vi-mode"
      ];
    };
    profileExtra = "source /etc/profile";
    initExtraFirst = ''
      source ~/.nix-profile/etc/profile.d/nix.sh
    '';
    sessionVariables = {
      EDITOR = "nvim";
      PATH="\${PATH}:\${HOME}/go/bin";
    };
  };
  programs.tmux = {
    enable = true;
    clock24 = true;
    customPaneNavigationAndResize = true;
    keyMode = "vi";
    shortcut = "a";
    historyLimit = 10000;
    extraConfig = builtins.readFile ./tmux.conf;
  };
  programs.fzf.enable = true;
}
