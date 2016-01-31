# My Work-in-progress NixOS config

I'm attempting a minimal `/etc/nixos/configuration.nix`, with most of
my environment customizations in the `all` env.

I may decide in the future to put most/all configuration in `/etc/nixos/configuration.nix`.

## Custom packages

Custom packages are located in `all/custom-packages`.

## How to use this repo

Switch to the `nixos-unstable` channel.

`/etc/nixos` files are stored in the `etc` directory.

`~/.nixpkgs` files are stored in the `all` directory.

## Install

`./install.sh` will symlink everything to the right paths.

