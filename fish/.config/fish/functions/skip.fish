# Function for ignoring the first 'n' lines
#
# Example usage:
#
#     seq 10 | skip 5
function skip --argument n
    tail +(math 1 + $n)
end
