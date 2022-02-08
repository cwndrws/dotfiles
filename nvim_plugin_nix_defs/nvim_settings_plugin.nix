{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "76ee81938f38e97ddad42c00142f27eca0ccf64b";
    sha256 = "04mx7zgn9h27giqgpdagzgb7n92wk1c2hb4pm1qc0mrnjlnsps7g";
  };
}
