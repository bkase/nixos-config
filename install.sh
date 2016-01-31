#!/usr/bin/env bash

sudo ln -s "$PWD/etc/configuration.nix" /etc/nixos/configuration.nix
sudo ln -s "$PWD/etc/hardware-configuration.nix" /etc/nixos/hardware-configuration.nix

ln -s "$PWD/all" "$HOME/.nixpkgs"

ln -s "$PWD/all/zshrc" "$HOME/.zshrc"

