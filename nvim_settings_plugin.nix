{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "1f879a5e2a53a50c2804067c7e1b923250093178";
    sha256 = "1grql0wjd00fyzlkha7c46fqb0v34nc2md9hgd3h8mz5brwscqzb";
  };
}
