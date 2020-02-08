# fishshell-cmd-opts

Utilities for elegant handling of command line options for fish shell scripts.
Extends the fish 'argparse' command. With every option you can append a description, which is used in the (automatic) '--help' info.

For a usage example, see [./example/example.fish](./example/example.fish)

## Installation

### On arch linux: install using pacman

- clone the repository
- create package for pacman:

		$ makepkg

- install it:

		$ makepkg -i

### copy script into fish config dir

- clone the repository
- copy `./cmd_args.fish` into some fish config dir (see <https://fishshell.com/docs/current/index.html#initialization>). Recommendation: `$__fish_data_dir/vendor_conf.d/`.

## Usage:

For a usage example, see [./example/example.fish](./example/example.fish)

# Contributing

This software isn't final.
Feel free to comment.
Feel free to contribute.
Pull requests welcome.
