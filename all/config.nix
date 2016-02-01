{ pkgs } : {
  allowUnfree = true;

  packageOverrides = pkgs : 
  let
    vimrc = import ./vimrc.nix {};

    zshSyntaxHighlighting = pkgs.callPackage ./custom-packages/zsh-syntax-highlighting.nix {};

    zshGitPrompt = pkgs.callPackage ./custom-packages/zsh-git-prompt/default.nix {};

    scmpuff = pkgs.callPackage ./custom-packages/scmpuff.nix {};
  in
  with pkgs; rec {
    vimrcConfig = {
      vam.knownPlugins = vimPlugins;
      vam.pluginDictionaries = [
        { names = [
          "vim-addon-nix"
          "ctrlp"
          "youcompleteme"
          "vim-airline"
          "Solarized"
          "The_NERD_Commenter"
        ];}
      ];
      customRC = vimrc.config;
    };

    my_vim = vim_configurable.customize { name = "vim"; inherit vimrcConfig; };
    all = pkgs.buildEnv {
      name = "all";
      paths = [
        my_vim
        python27
        screenfetch
        git
        zshSyntaxHighlighting
        zshGitPrompt
        scmpuff
      ];
    };
  };
} 
