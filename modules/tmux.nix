{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    clock24 = true;
    extraConfig = ''

      run-shell ${pkgs.tmuxPlugins.vim-tmux-navigator}/share/tmux-plugins/vim-tmux-navigator/vim-tmux-navigator.tmux

      run-shell ${pkgs.tmuxPlugins.catppuccin}/share/catppuccin/catppuccin.tmux
      '';

  };

  environment.systemPackages = with pkgs; [
    tmuxPlugins.vim-tmux-navigator
    tmuxPlugins.catppuccin
  ];

}

