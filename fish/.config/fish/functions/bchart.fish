# Prints a bar chart of the input
function bchart
    argparse --ignore-unknown --name=bchart v/version h/help m/min= M/max= c/column= s/segment= w/width= -- $argv || return

    if set --query _flag_version[1]
        echo "bchart, version 1.0"
    else if set --query _flag_help[1]
        echo "Usage: bchart <numbers ...>"
        echo "       stdin | bchart"
        echo "Options:"
        echo "       --min=<number>     Minimum range"
        echo "       --max=<number>     Maximum range"
        echo "       --column=<number>  The column to use for charting"
        echo "       --segment=<string> Bar chart segment character"
		echo "       --width=<number>   Width of the chart"
        echo "       -v or --version    Print version"
        echo "       -h or --help       Print this help message"
        echo "Examples:"
        echo "       bchart 1 1 2 5 14 42"
        echo "       seq 64 | sort --random-sort | bchart"
    else if set --query argv[1]
        printf "%s\n" $argv | bchart --min="$_flag_min" --max="$_flag_max" --segment="$_flag_segment" --width="$_flag_width"
    else
		# If unspecified, the width is the width of the Terminal window.
		set -l width $_flag_width

		if [ "$width" = "" ]
			set width (tput cols)
		else if [ "$width" = "auto" ]
			set width (tput cols)
		else if test $width -le 0
			echo "The width must be greater than 0."
			return 1
		end

		if [ "$_flag_column" = "" ]
			set _flag_column "0"
		end

        command awk -v min="$_flag_min" -v max="$_flag_max" -v segment="$_flag_segment" -v width="$width" '
            {
				rows[NR] = $0

				num = $'$_flag_column'
                nums[NR] = num

                m = min == "" ? m == "" ? num : m > num ? num : m : min
                M = max == "" ? M == "" ? num : M < num ? num : M : max

				row_length = length($0)
				max_row_length = row_length > max_row_length ? row_length : max_row_length
            }

            END {
			    segment = segment == "" ? "*" : segment
				segment_length = length(segment)

				available_width = (width - max_row_length - 1)
				divisor = M / available_width

                while (++i <= NR) {
					num = nums[i]

					printf("%-*s ", max_row_length, rows[i])

					segments = ((num / divisor) / segment_length)

					while (++j <= segments) {
						printf("%s", segment)
					}
					j = 0

					if (i < NR) {
						printf("\n", num)
					}
				}
            }
        ' && echo
    end
end
