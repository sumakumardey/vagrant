#!/bin/sh

echo Loading json $1 into key $2

curl -v -X PUT http://33.33.33.10:8098/riak/gigaom/$2 -H 'Content-Type: application/json' -d '{"value": "simon was here"}'
