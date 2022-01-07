{ config, pkgs, ... }:

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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.neovim = {
    enable = true;
    plugins =
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
}
