curl -v http://33.33.33.50:8098/riak/goog/2010-05-05

curl -i http://33.33.33.10:8098/riak/goog?keys=true\&props=false



curl -XPOST http://33.33.33.30:8098/mapred -H "Content-Type: application/json" -d @-


# Simple Map Full dataset
{"inputs":"goog",
  "query":[{"map":{"language":"javascript",
                   "name":"Riak.mapValuesJson",
                   "keep":true}}
          ]
}

# High sell value 1st wk january
{"inputs":[["goog","2010-01-04"],
           ["goog","2010-01-05"],
           ["goog","2010-01-06"],
           ["goog","2010-01-07"],
           ["goog","2010-01-08"]],
 "query":[{"map":{"language":"javascript",
                  "source":"function(value,keyData,arg){ var data = Riak.mapValuesJson(value)[0]; return [data.High];}"
                 }},
          {"reduce":{"language":"javascript","name":"Riak.reduceMax","keep":true}}]
}

# Max highs by month
{
    "inputs":"goog",
    "query":[
        {"map":{"language":"javascript", "source":"function(value, keyData, arg){ var data = Riak.mapValuesJson(value)[0]; var month = value.key.split('-').slice(0,2).join('-'); var obj = {}; obj[month] = data.High; return [obj];}"}},
    {"reduce":{"language":"javascript", "source":"function(values, arg){ return [ values.reduce(function(acc, item){ for(var month in item){ if(acc[month]) { acc[month] = (acc[month] < item[month]) ? item[month] : acc[month]; } else { acc[month] = item[month]; } } return acc; })];}", "keep":true}}
]
}

# First week of Jan 2010
{"inputs":[["goog","2010-01-04"],
           ["goog","2010-01-05"],
           ["goog","2010-01-06"],
           ["goog","2010-01-07"],
           ["goog","2010-01-08"]],
   "query":[{"map":{"language":"javascript","name":"Riak.mapValuesJson","keep":true}}]
}