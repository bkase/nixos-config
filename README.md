# My Work-in-progress NixOS config

`/etc/nixos/configuration.nix` has entire system derived. `all/` formerly had most derivations. Now it only contains a reference to zshrc (which will be moved to `configuration.nix` soon).

## Custom packages

Custom packages are located in `etc/custom-packages`.

## How to use this repo

Clone nixpkgs to `/etc/nixos`

`/etc/nixos` files are stored in the `etc` directory.

`~/.nixpkgs` files are stored in the `all` directory.

## Install

`./install.sh` will symlink everything to the right paths.

