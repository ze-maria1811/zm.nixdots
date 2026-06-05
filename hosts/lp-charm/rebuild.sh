#!/bin/sh
if ["$(hostname)" = "vrenlp"]; then
	nixos-rebuild switch --flake github:ze-maria1811/zm.nixdots#lp-quark --refresh
else
	echo "Unpredicted user! aborting..."
fi
