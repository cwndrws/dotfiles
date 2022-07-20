{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "4bba6777ecd19f2b7121006062b9fb72d02d170b";
    sha256 = "14bh7jvc84x8v6rjl5lcyy02g559mlim7hlz2d9b1q3razad020d";
  };
}
