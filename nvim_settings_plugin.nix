{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "a70a0fa5651f8c356ec9cd31393e31225639ed90";
    sha256 = "1nykp1w2acg35hxajidxxp151xvaxcyvkvi6f8chhhasgkj2ryv8";
  };
}
