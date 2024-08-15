#!/bin/sh
sudo nixos-rebuild switch --flake .#default --recreate-lock-file -v
