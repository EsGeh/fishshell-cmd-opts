#!/bin/fish

# source command line utils:
source (dirname (readlink -m (status filename)))/utils/fishshell-cmd-opts//cmd_args.fish


# default value:
set name "unknown entity"

# entries must be valid arguments for argparse, with '/<option_info>' appended
set options_descr \
	"h/help/print help" \
	"n/name=/your name. default: '$name'" \
	"x-only-long-option/does nothing"

#################################################
# functions
#################################################

function print_help
	echo "usage: "(status -f)" [OPTIONS...]"
	echo "OPTIONS:"
	print_options_descr $options_descr
end

#################################################
# cmd line interface
#################################################

set options (options_descr_to_argparse $options_descr)

# parse command line arguments:
argparse $options -- $argv 2>/dev/null
or begin
	print_help
	exit 1
end
if set -q _flag_h
	print_help
	exit 0
else
	if set -q _flag_name
		set name $_flag_name
	end
	echo "Hello $name. Have a nice day!"
end
