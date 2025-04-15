{ inputs, pkgs, ... }:

{

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  environment.systemPackages = with pkgs; [

    # plugin deps
    ripgrep
    unzip
    nodejs_23
    lua54Packages.luarocks
    lua
    xclip

    # language servers
    gopls
    nixd
    nixpkgs-fmt
    terraform-ls
    yaml-language-server

    lua-language-server
    stylua

    vimPlugins.nvim-treesitter.withAllGrammars
    vimPlugins.noice-nvim
    vimPlugins.nui-nvim
  ];

}

