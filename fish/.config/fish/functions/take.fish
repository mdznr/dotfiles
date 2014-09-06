# Function for taking the first 'n' lines
#
# Example usage:
#     
#     seq 10 | take 5
function take --argument number
    head -$number
end
