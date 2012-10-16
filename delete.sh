#!/bin/sh

echo Loading json $1 into key $2

curl -v -X DELETE http://33.33.33.10:8098/riak/gigaom/$2 
