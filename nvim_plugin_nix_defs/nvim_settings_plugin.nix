{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "657fa07d4977e62d0fd0c2e76872507e21e5d771";
    sha256 = "0g2ylyyq8dxsadx71pkfg1naw9cppd3l6lpsvv01qv1vwkba872l";
  };
}
