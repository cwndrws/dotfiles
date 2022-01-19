{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "d3b4e757618202d392cf5ff707ab58966f9a29da";
    sha256 = "0w43dycn7iis6y90fqp3npnfcpqnd9fbywr0hacb6qmpbb9njwrq";
  };
}
