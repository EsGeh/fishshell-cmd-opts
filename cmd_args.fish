# source this file into your script to use it!

# usage:
# 1. define an "opt_descr" (a list where each entry has this syntax: '<short>/<long>/<description>')
# 2. apply 'option_descr_to_argparse' function to get the params for the 'argparse' builtin
# 3. apply 'print_option_descr' function to print a nicely formatted info string
#
# example: see

# given an <option_descr>
# returns <options>, a valid input for argparse
function options_descr_to_argparse
	for o in $argv
		set split_res (string split '/' $o)
		echo "$split_res[1]/$split_res[2]"
	end
end

# given <option_descr>
# returns a nicely formatted description string
function options_descr_to_info_string
	set output
	for o in $argv
		# we use ':' as column seperator, so we need to substitute
		# existing ':'s by e.g. "||||":
		set o_escaped (echo $o | sed 's/:/||||/')
		set tok_and_rest (string split --max=1 '/' $o_escaped)
		set short $tok_and_rest[1]

		set tok_and_rest (string split --max=1 '/' $tok_and_rest[2])
		set long_temp (string split --max=1 '=' $tok_and_rest[1])
		set descr $tok_and_rest[2]

		set long $long_temp[1]
		if test (count $long_temp) -ge 2
			set long "$long ARG"
		end
		set output $output "-$short|--$long:$descr\n"
	end
	set output (echo -e $output | column -t -s ':')
	for l in $output
		# substitute back to ':':
		set l (echo $l | sed 's/||||/:/')
		echo -e $l
	end
end

function print_options_descr
	set opts_info (options_descr_to_info_string $argv)
	for l in $opts_info
		echo -e $l
	end
end
