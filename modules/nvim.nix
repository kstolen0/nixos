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
    nodejs_22
    lua54Packages.luarocks
    lua
    xclip

    # language servers
    gopls
    nixd
    nixpkgs-fmt
    lua-language-server
  ];

}

