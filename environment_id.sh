#!bin/bash

# Customers often ask, what's the easiest way to get my environment ID.
# The easiest way is via the API!!

# This will list all of your environments and return the name and corresponding environment ID

curl https://api.riskmanager.fugue.co/v0/environments \
  -u $CLIENT_ID:$CLIENT_SECRET | jq '.items[] |.name,.id'

# That's it!  This will output the name and environment ID