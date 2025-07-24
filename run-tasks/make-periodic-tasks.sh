#!/bin/bash
export LC_ALL=C

input="list-of-interesting-regions.txt"
output="periodic-tasks.sh"

echo "#!/bin/bash" > "$output"
echo "" >> "$output"

while read -r line; do
    # Skip comments and empty lines
    [[ "$line" =~ ^#.*$ || -z "$line" ]] && continue

    # Parse the line using regex-aware read (handles quoted comment with spaces)
    read -r start end step T comment <<<"$line"

    # Ensure variables are numeric and defined
    if [[ -z "$start" || -z "$end" || -z "$step" ]]; then
        echo "# Skipping malformed line: $line" >> "$output"
        continue
    fi

    # Remove surrounding single quotes from comment (if any)
    comment=${comment//\'/}

    echo "# $comment" >> "$output"

    # Only handle increasing intervals
    gamma="$start"
    while (( $(echo "$gamma <= $end" | bc -l) )); do
        gamma_fmt=$(printf "%.4f" "$gamma")
        solver_p=$(printf "%.0f" "$(echo "$gamma * 10" | bc -l)")
        echo "./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=$gamma_fmt --solver-p=$solver_p --S=50000.0 --T=$T --prefix=periodic_D3_a_gamma$gamma_fmt--" >> "$output"
        gamma=$(echo "$gamma + $step" | bc -l)
    done

    echo "" >> "$output"
done < "$input"



# this file was generated in chatGPT with the following prompt:
# (with some by hand modifications to make it work)
#
# I have the following list in a file in 'list-of-interesting-regions.txt'
#
# # start end gamma_step comment
# 2.4 2.6 0.05 'the first hopf biffurcation'
# 4.25 4.3 0.001 'a jump in periodic orbit'
# 17.5 18.0 0.05 'first kink appear'
# 20.5 21.05 0.05 'crossing in n'
# 29.0 30.0 0.05 'kink in q_d'
# 29.8 30.3 0.02 'period doubling?'
# 35.6 36.2 0.05 'folds in q_d'
# 38.6 38.5 0.01 'period cascade?'
# 39.0 39.2 0.01 'period cascade continues?'
# 39.3 39.5 0.01 'onset of chaos'
# 39.8 40.1 0.05 'a chaotic region'
# 40.1 40.2 0.01 'an exit from the chaotic region'
# 40.4 40.6 0.01 'a periodic window'
#
# I need a bash script that from this file will generate the following 'periodic-tasks.sh'
#
# # {comment}
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma={gamma} --solver-p={int(gamma*10)} --S=50000.0 --T=200.0 --prefix=periodic_D3_a_gamma{gamma}--
#
# where {gamma} changes in the interval {begin} to {end} with step {gamma_step}. 
#
# I don't want the resulting script to contain loops, I want it to contain only resulting commands (a long list). Please move the loops generating commands to the generating script itself. 
#
# in the resulting scripts do not break the commands with use of \
#
# Add export LC_ALL=C to assure the . is treated as .
# 
# Assume the input data is correct, do not add any extra tests. 