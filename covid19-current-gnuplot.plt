#!/usr/bin/gnuplot -persist
set terminal png size 2400,1200
set output "covid19-current-countries.png"
set datafile separator comma
# Set background to gray.
set object 1 rectangle from screen 0,0 to screen 1,1 behind
set object 1 rectangle fc rgbcolor "#dddddd" fillstyle solid 1.0
# X axis is time.
set xdata time
set xlabel "Date"
set timefmt "%d/%m/%Y"
set xrange [ "01/03/2020": ]
# Y axis is index.
set ylabel "New Cases / 100k / 14d"
set ytics 100, 100
set pointsize 0.3
set grid ytics
set key center top
#
#           plot {<ranges>}
#                {<iteration>}
#                {<function> | {"<datafile>" {datafile-modifiers}}}
#                {axes <axes>} {<title-spec>} {with <style>}
#                {, {definitions{,}} <function> ...}
#
#           plot '<file_name>' {binary <binary list>}
#                              {{nonuniform} matrix}
#                              {index <index list> | index "<name>"}
#                              {every <every list>}
#                              {thru <thru expression>}
#                              {using <using list>}
#                              {smooth <option>}
#                              {volatile} {noautoscale}
#
#           plot 'file' using <entry> {:<entry> {:<entry> ...}} {'format'}
#
plot "covid19-current-world.csv" \
	index 97 using 1:12 axis x1y1 with lines linecolor rgbcolor "#ff0000" title "Italy", \
	"" index 62 using 1:12 axis x1y1 with lines linecolor rgbcolor "#00ff00" title "Estonia", \
	"" index 51 using 1:12 axis x1y1 with lines linecolor rgbcolor "#0000ff" title "Germany", \
	"" index 174 using 1:12 axis x1y1 with lines linecolor rgbcolor "#550055" title "Serbia", \
	"" index 61 using 1:12 axis x1y1 with lines linecolor rgbcolor "#999999" title "Spain", \
	"" index 179 using 1:12 axis x1y1 with lines linecolor rgbcolor "#ff00ff" title "Slovenia", \
	"" index 198 using 1:12 axis x1y1 with lines linecolor rgbcolor "#ffff00" title "USA"

