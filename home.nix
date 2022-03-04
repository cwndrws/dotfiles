{ config, pkgs, ... }:

let
  user = import ./user.nix;
  settings_module = import ./nvim_plugin_nix_defs/nvim_settings_plugin.nix;
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
    rnix-lsp
    rustup
    rust-analyzer
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
      lua-dev-nvim
      ale
      fzf-vim
      vim-dispatch
      vim-fugitive
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
      nvim-tree-lua
      vimux
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
    extraConfig = ''
      # setup mouse mode
      set -g mouse on

      # When splitting, open new pane with current path
      bind '"' split-window -v -c '#{pane_current_path}'
      bind '%' split-window -h -c '#{pane_current_path}'

      # Use 1-index for panes and windows
      set -g base-index 1
      setw -g pane-base-index 1

      # This tmux statusbar config was created by tmuxline.vim
      # on Wed, 30 Sep 2020

      set -g status-justify "centre"
      set -g status "on"
      set -g status-left-style "none"
      set -g message-command-style "fg=colour255,bg=colour238"
      set -g status-right-style "none"
      set -g pane-active-border-style "fg=colour190"
      set -g status-style "none,bg=colour234"
      set -g message-style "fg=colour255,bg=colour238"
      set -g pane-border-style "fg=colour238"
      set -g status-right-length "100"
      set -g status-left-length "100"
      setw -g window-status-activity-style "none,fg=colour190,bg=colour234"
      setw -g window-status-separator ""
      setw -g window-status-style "none,fg=colour85,bg=colour234"
      set -g status-left "#[fg=colour17,bg=colour190] #S #[fg=colour190,bg=colour238,nobold,nounderscore,noitalics]#[fg=colour255,bg=colour238] #F #[fg=colour238,bg=colour234,nobold,nounderscore,noitalics]#[fg=colour85,bg=colour234] #W #[fg=colour234,bg=colour234,nobold,nounderscore,noitalics]"
      set -g status-right "#[fg=colour234,bg=colour234,nobold,nounderscore,noitalics]#[fg=colour85,bg=colour234] %a #[fg=colour238,bg=colour234,nobold,nounderscore,noitalics]#[fg=colour255,bg=colour238] %b %d | %R #[fg=colour190,bg=colour238,nobold,nounderscore,noitalics]#[fg=colour17,bg=colour190] #H "
      setw -g window-status-format "#[fg=colour234,bg=colour234,nobold,nounderscore,noitalics]#[default] #I | #W #[fg=colour234,bg=colour234,nobold,nounderscore,noitalics]"
      setw -g window-status-current-format "#[fg=colour234,bg=colour238,nobold,nounderscore,noitalics]#[fg=colour255,bg=colour238] #I | #W #[fg=colour238,bg=colour234,nobold,nounderscore,noitalics]"


      bind -T root F12  \
        set prefix None \;\
        set key-table off \;\
        if -F '#{pane_in_mode}' 'send-keys -X cancel' \;\
        refresh-client -S \;\

      bind -T off F12 \
        set -u prefix \;\
        set -u key-table \;\
        set -u status-style \;\
        set -u window-status-current-style \;\
        set -u window-status-current-format \;\
        refresh-client -S
    '';
  };
  programs.fzf.enable = true;
}
