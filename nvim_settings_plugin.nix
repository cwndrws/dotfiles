{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "34cc8b63ad2da6b02c6c1b2c6861ea8861917b7c";
    sha256 = "19bpqk2mhiz3pqfa7y0ll8bpskbsiancc8prfrrhjanacd78krcr";
  };
}
