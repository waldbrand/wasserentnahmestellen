#!/bin/bash

sqlite3 daten/wes.gpkg -header "select * from wes limit 20"
