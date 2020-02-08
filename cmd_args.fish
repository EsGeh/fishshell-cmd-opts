# source this file into your script to use it!

# USAGE:
# 1. define an "opt_descr" (entries must be valid arguments for argparse, with '/<option_info>' appended)
# 2. apply 'option_descr_to_argparse' function to get the params for the 'argparse' builtin
# 3. apply 'print_option_descr' function to print a nicely formatted info string
#
# example: see ./example/example.fish

set opt_descr_regex '(.)(/|-)([^/=]*)(=\+|=\?|=|)/(.*)'

# given an <opt_descr>
# returns <options>, a valid input for argparse
function options_descr_to_argparse
	for o in $argv
		set opt_parsed (string match -r -- "$opt_descr_regex" "$o")
		if test "$status" -ne 0
			echo "syntax error"
			return 1
		end
		echo (string join -- '' $opt_parsed[2..5])
	end
end

# given <opt_descr>
# returns a nicely formatted description string
function options_descr_to_info_string
	set output
	for o in $argv
		set opt_parsed (string match -r -- "$opt_descr_regex" "$o")
		if test "$status" -ne 0
			echo "syntax error"
			return 1
		end
		set opt_parsed[6] (echo "$opt_parsed[6]" | sed 's/:/||||/')
		if test "$opt_parsed[3]" != '-'
			set output (string join -- '' "$output" "-$opt_parsed[2]")
		end
		if [ "$opt_parsed[3]" != '-' ]; and [ "$opt_parsed[4]" != '' ]
			set output (string join -- '' "$output" ":| ")
		else
			set output (string join -- '' "$output" ":  ")
		end
		if test "$opt_parsed[5]" = ''
			set output (string join -- '' "$output" "--$opt_parsed[4]")
		else if test "$opt_parsed[5]" = '='
			set output (string join -- '' "$output" "--$opt_parsed[4] ARG")
		else if test "$opt_parsed[5]" = '=+'
			set output (string join -- '' "$output" "--$opt_parsed[4] ARG")
		else if test "$opt_parsed[5]" = '=?'
			set output (string join -- '' "$output" "--$opt_parsed[4] [ARG]")
		end
		set output (string join -- '' "$output" ":$opt_parsed[6]")
		set output (string join -- '' "$output" "\n")
	end
	set output (echo -e "$output" | column -t -s ':')
	for l in $output
		# substitute back to ':':
		set l (echo "$l" | sed 's/||||/:/')
		echo -- "$l"
	end
end

function print_options_descr
	set opts_info (options_descr_to_info_string $argv)
	for l in $opts_info
		echo -e -- $l
	end
end
