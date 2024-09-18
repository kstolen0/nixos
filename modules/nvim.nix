{ inputs, pkgs, ... }:

{

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
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
    terraform-ls

    lua-language-server
    stylua
  ];

}

