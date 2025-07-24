cd ../bin

# collect for D3 case
wd=case2-3-const-ivp-vanilla
outdir=$wd/all-periodic-D3-qd
mkdir -p $outdir
find $wd -maxdepth 1 -type f | grep qd-phase | xargs -I{} cp {} $outdir
find $wd -maxdepth 1 -type f | grep phase.dat | xargs -I{} cp {} $outdir

cd $outdir
input_file="../../../run-tasks/list-of-interesting-regions.txt"
line_num=0

# Read the input file line-by-line
while read -r line; do
    # Skip comments and empty lines
    [[ "$line" =~ ^#.*$ || -z "$line" ]] && continue

    ((line_num++))

    # Parse the line
    read start end step T comment <<< $(echo "$line" | awk '{print $1, $2, $3, $4, $5}')

    # Prepare output file name
    output_gp_file="all_periodic_D3_a_${line_num}--qd-phase.gp"
    output_png_file="all_periodic_D3_a_${line_num}--qd-phase.png"

    # Initialize output file
    echo "set terminal png size 1600,1200" > "$output_gp_file"
    echo "set output '$output_png_file'" >> "$output_gp_file"
    echo -n "plot \\" >> "$output_gp_file"

    # Loop over matching .gp files
    found=false
    for gp_file in periodic_D3_a_gamma*.gp; do
        # Extract gamma value
        gamma=$(echo "$gp_file" | grep -oP 'gamma\K[0-9.]+')
        if (( $(echo "$gamma >= $start && $gamma <= $end" | bc -l) )); then
            # Extract the 3rd line (plot command)
            plot_line=$(sed -n '3p' "$gp_file")
            # Extract just the file and plot settings
            plot_data=$(echo "$plot_line" | sed -E "s/^plot[[:space:]]+'([^']+)'.*$/'\1' using 3:4 with lines title 'γ=${gamma}'/")

            # Append to the output
            if $found; then
                echo -n ", \\" >> "$output_gp_file"
            else
                found=true
            fi
            echo >> "$output_gp_file"
            echo -n "    $plot_data" >> "$output_gp_file"
        fi
    done

    # Finish with newline
    echo >> "$output_gp_file"

    gnuplot $output_gp_file

done < "$input_file"

# go back
cd ../..

outdir=$wd/all-periodic-D3-n
mkdir -p $outdir
find $wd -maxdepth 1 -type f | grep n-phase | xargs -I{} cp {} $outdir
find $wd -maxdepth 1 -type f | grep phase.dat | xargs -I{} cp {} $outdir

cd $outdir
input_file="../../../run-tasks/list-of-interesting-regions.txt"
line_num=0

# Read the input file line-by-line
while read -r line; do
    # Skip comments and empty lines
    [[ "$line" =~ ^#.*$ || -z "$line" ]] && continue

    ((line_num++))

    # Parse the line
    read start end step T comment <<< $(echo "$line" | awk '{print $1, $2, $3, $4, $5}')

    # Prepare output file name
    output_gp_file="all_periodic_D3_a_${line_num}--n-phase.gp"
    output_png_file="all_periodic_D3_a_${line_num}--n-phase.png"

    # Initialize output file
    echo "set terminal png size 1600,1200" > "$output_gp_file"
    echo "set output '$output_png_file'" >> "$output_gp_file"
    echo -n "plot \\" >> "$output_gp_file"

    # Loop over matching .gp files
    found=false
    for gp_file in periodic_D3_a_gamma*.gp; do
        # Extract gamma value
        gamma=$(echo "$gp_file" | grep -oP 'gamma\K[0-9.]+')
        if (( $(echo "$gamma >= $start && $gamma <= $end" | bc -l) )); then
            # Extract the 3rd line (plot command)
            plot_line=$(sed -n '3p' "$gp_file")
            # Extract just the file and plot settings
            plot_data=$(echo "$plot_line" | sed -E "s/^plot[[:space:]]+'([^']+)'.*$/'\1' using 5:6 with lines title 'γ=${gamma}'/")

            # Append to the output
            if $found; then
                echo -n ", \\" >> "$output_gp_file"
            else
                found=true
            fi
            echo >> "$output_gp_file"
            echo -n "    $plot_data" >> "$output_gp_file"
        fi
    done

    # Finish with newline
    echo >> "$output_gp_file"

    gnuplot $output_gp_file

done < "$input_file"
