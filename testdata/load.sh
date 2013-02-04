#!/bin/bash
INPUT_FILE=goog.csv
IFS=','

while read Date Open High Low Close Volume AdjClose
do

curl -X PUT http://33.33.33.10:8098/riak/goog/$Date -H 'Content-Type: application/json' -d "{\"Date\":$Date,\"Open\":$Open,\"High\":$High,\"Low\":$Low,\"Close\":$Close,\"Volume\":$Volume,\"AdjClose\":$AdjClose}"
	echo Inserting key: $Date 

done < $INPUT_FILE