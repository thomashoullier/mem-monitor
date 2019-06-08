# Gnuplot script to display the results of mem-monitor.sh
set key autotitle columnhead
set datafile separator " "
set grid
set xlabel "Time (ms)"
set ylabel "Memory (KB)"

plot 'test.txt' w linespoints title "RES-MEM"
