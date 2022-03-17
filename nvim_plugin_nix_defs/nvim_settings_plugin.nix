{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "70e82767e8f1101bc5e6238b5af9b54295c6fc99";
    sha256 = "12zs4mk6hzgy968siw31gm5z5756fwrn12d5d94hmarkj0nk2cdy";
  };
}
