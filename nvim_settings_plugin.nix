{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "77e18af427e7ea0aa1b55104fd08f21cd0bbc0c5";
    sha256 = "081jh41blsrfz8yf3pljdpnssgmc3afh34km0vxwnjfh0p1ynw6r";
  };
}
