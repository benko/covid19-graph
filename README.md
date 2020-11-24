Project: COVID-19 Gnuplot Graph
===============================

Copyright
---------
Copyright (c) 2020, Grega Bremec <gregab@p0f.net>, All Rights Reserved

License
-------
This software is being published under terms and conditions set forth
by the BSD License. See the COPYING file for full license text.

Using
-----

To use this project, download the CSV format of the daily number of new
reported COVID-19 cases by country worldwide from ECDC at
https://www.ecdc.europa.eu/en/publications-data/download-todays-data-geographic-distribution-covid-19-cases-worldwide
and reprocess the data using the `dataprep` script:

    $ ./covid19-dataprep.sh covid19-20201124-world.csv
    Processing: ...... <snip> ..... done.
    Creating index... done.

The above script creates a new data file with blank lines between datasets to allow gnuplot to use an index.

It also creates an index file that allows you to pick the data sets you want to plot:

    $ ls -l covid19-current-world.*
    -rw-r--r--@ 1 gregab  staff  3976107 24 Nov 12:54 covid19-current-world.csv
    -rw-r--r--@ 1 gregab  staff     1589 24 Nov 12:54 covid19-current-world.idx

Edit the plt file to include the countries you want in the graph:

    $ grep ESP covid19-current-world.idx
    61 ESP
    
    $ grep Spain covid19-current-gnuplot.plt 
    	"" index 61 using 1:12 axis x1y1 with lines linecolor rgbcolor "#999999" title "Spain", \

Then simply run gnuplot:

    $ gnuplot ./covid19-current-gnuplot.plt

You can view the graph by using `open` (macOS) or `xdg-open` (Linux) to display it in the default PNG viewer:

    $ open ./covid19-current-countries.png

or

    $ xdg-open ./covid19-current-countries.png

Reporting Issues & Submitting Patches
-------------------------------------

Contact Grega Bremec <gregab@p0f.net> and discuss it.

