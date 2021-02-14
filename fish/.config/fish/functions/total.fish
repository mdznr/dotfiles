# Calculates the total of all the lines in the input
#
# Example usage:
#
#     git shortlog -sn | coln 1 | total
alias total "awk '{ count += \$0 } END { print count }'"

