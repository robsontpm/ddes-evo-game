# this will work if either run from ../bin or from here!
cd ../scripts

BARS="$(bash gen-bars.sh)"

cd ../bin

# collect for D3 case
wd=case2-3-const-ivp-vanilla
outdir=$wd/all-biff-D3
mkdir -p $outdir
find $wd -maxdepth 1 -type f | grep biff.dat | xargs -I{} cat {} > $outdir/all-D3-a-biff.dat

echo "" > $outdir/all-D3-a-biff.gp
echo "set terminal pngcairo size 2400,1800 font ',30' enhanced" >> $outdir/all-D3-a-biff.gp
echo "set yrange [-0.5:*]" >> $outdir/all-D3-a-biff.gp
echo "set xlabel 'γ'" >> $outdir/all-D3-a-biff.gp
echo "set output 'all-D3-a-biff-qd.png'" >> $outdir/all-D3-a-biff.gp
echo "set ylabel 'q_d at an extremum of n'" >> $outdir/all-D3-a-biff.gp
echo "" >> $outdir/all-D3-a-biff.gp
printf "%s\n" "$BARS"  >> $outdir/all-D3-a-biff.gp
echo "" >> $outdir/all-D3-a-biff.gp
echo "plot 'all-D3-a-biff.dat' using 1:3 with points pt 7 ps 0.1 lc rgb '#B0000000' notitle" >> $outdir/all-D3-a-biff.gp
echo "set output 'all-D3-a-biff-n.png'" >> $outdir/all-D3-a-biff.gp
echo "set ylabel 'extrema of n'" >> $outdir/all-D3-a-biff.gp
echo "plot 'all-D3-a-biff.dat' using 1:4 with points pt 7 ps 0.1 lc rgb '#B0000000' notitle" >> $outdir/all-D3-a-biff.gp

cd $outdir
gnuplot all-D3-a-biff.gp