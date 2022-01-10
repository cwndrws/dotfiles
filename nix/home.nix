{ config, pkgs, ... }:

let
  settings = pkgs.vimUtils.buildVimPlugin {
    name = "neovim_settings";
    src = pkgs.fetchFromGitHub {
      owner = "cwndrws";
      repo = "neovim_settings";
      rev = "c33b12705138b092ebe130b4dbbbe956c3583bbb";
      sha256 = "1lwr92gdh0c2s4mqwnsbs169f5inrn6rk7yf0543aw4wnnc3pbv1";
    };
  };
  octo = pkgs.vimUtils.buildVimPlugin {
    name = "octo";
    src = pkgs.fetchFromGitHub {
      owner = "pwntester";
      repo = "octo.nvim";
      rev = "1cb910a7a42398580618ac4f3c3731214ea0916d";
      sha256 = "1fa3shk9h296fnjv47a315d6b9cf4kjlaxa37nibd1hp2l0l8v5d";
    };
  };
in
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "";
  home.homeDirectory = "/root";

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
      octo
    ];
  };
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [
        "git"
        "history"
        "fzf"
        "vi-mode"
      ];
    };
  };
  programs.tmux = {
    enable = true;
    clock24 = true;
    customPaneNavigationAndResize = true;
    keyMode = "vi";
    shortcut = "a";
    terminal = "tmux-256color";
    historyLimit = 10000;
    extraConfig = ''
      # When splitting, open new pane with current path
      bind '"' split-window -v -c '#{pane_current_path}'
      bind '%' split-window -h -c '#{pane_current_path}'

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
    '';
  };
  programs.fzf.enable = true;
}
