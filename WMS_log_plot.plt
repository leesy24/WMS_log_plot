set terminal windows title ARG1
set terminal windows wsize 1024,768
set title "Ping status ".ARG2
set datafile separator " "
set timefmt "%Y-%m-%d %H:%M:%S"
set format x "%Y-%m-%d %H:%M:%S"
set xdata time
set grid
set autoscale x
set yrange [0:1]
set ytics ("Fail" 0, "Success" 1)
set mouse format "%.0f"
set mouse mouseformat 3
set xtics rotate by -10
set ytics nomirror
set style line 1 lt rgb "red" lw 2
set style line 2 lt rgb "blue" lw 1 pt 6
set style line 3 lt rgb "green" lw 1 pt 4
plot ARG3 u 1:($3>0?1:0) w steps ls 1 notitle, \
     ''   u 1:($3>0?1:1/0) w linespoints ls 2 title 'Success', \
     ''   u 1:($3>0?1/0:0) w linespoints ls 3 title 'Fail'
pause -1
