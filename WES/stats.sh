#!/bin/bash

FILE=stats.md

rm -f $FILE

# akz bemerkung rechts_w
for col in fstatus baujahr fkt_faehig oart menge land; do
    echo $col;
    echo "## $col" >> $FILE
    echo '```' >> $FILE
    sqlite3 daten/wes.gpkg -header "select $col,count(*) from wes group by $col" >> $FILE
    echo '```' >> $FILE
    echo >> $FILE
done
