{ pkgs, ... }: {
  home = {
    username = "eric";
    homeDirectory = "/home/eric";
    stateVersion = "26.05";
  };

  home.packages = with pkgs; [
    go
    rustup
    python3
    nodejs
    neovim
    git
    tmux
    ripgrep
    fd
    fzf
    bat
    delta
    jq
    htop
    tree
    unzip
    wl-clipboard
  ];

  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    PAGER = "less --mouse";
  };
}
