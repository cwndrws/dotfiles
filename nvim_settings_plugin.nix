{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "332482e1887518ef83a81fd33461c0c418827fd2";
    sha256 = "03r9xglqfgmcq867cgkfyl8kvxcp49l9q8vai01x6mrc8qv2plz8";
  };
}
