# fishshell-cmd-opts

Utilities for elegant handling of command line options for fish shell scripts.

## Installation

Just copy the files into some directory (e.g. into `$FISH_UTILS/`)

For example like so:

	$ set FISH_UTILS <somepath>
	$ mkdir -p $FISH_UTILS
	$ cd $FISH_UTILS
	$ git clone git@github.com:EsGeh/fishshell-cmd-opts.git
	$ cd ..

## Usage:

In your script, just "source" the [./cmd_args.fish](./cmd_args.fish), e.g. like so

	...
	source $FISH_UTILS/cmd_args.fish
	...

(where `$FISH_UTILS` is to be replaced by the path where you copied the repo to)

For a usage example, see [./example/example.fish](./example/example.fish)

# Contributing

This software isn't final.
Feel free to comment.
Feel free to contribute.
Pull requests welcome.
