{ config, pkgs, ... }:

let
  user = import ./user.nix;
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
  home.stateVersion = "24.11";
  home.packages = with pkgs; [
    fzf
    lua-language-server
    ripgrep
    jq
    rustup
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  home.file = {
    # Setup neovim config files
    ".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink ./nvim;
    };
    # Setup alacritty config
    ".config/alacritty" = {
      source = config.lib.file.mkOutOfStoreSymlink ./alacritty;
    };
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
    profileExtra = ''
      source /etc/profile
      if [ -f /opt/homebrew/bin/brew ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
      fi
    '';
    initExtraFirst = ''
      source ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    '';
    sessionVariables = {
      EDITOR = "nvim";
      PATH="\${PATH}:\${HOME}/go/bin:\${HOME}/bin";
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
  programs.git = {
    enable = true;
    extraConfig = {
      push.default = "current";
      pull.rebase = true;
    };
  };
  programs.fzf.enable = true;
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
}
