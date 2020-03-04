# This script will allow you to update your scan interval.  The interval is expressed in 
# seconds although you will see it expressed in minutes in the UI

# You will need your CLIENT_ID and CLIENT_SECRET stored as environment variables. Or you
# express them directly instead of expressing the Env Variable names.

# Make sure you have your ENVIRONMENT ID either typed or expressed as a variable. 


curl -X PATCH \
"https://api.riskmanager.fugue.co/v0/environments/ENVIRONMENTID" \
-u $CLIENT_ID:$CLIENT_SECRET \
-H "accept: application/json" \
-H "Content-Type: application/json" \
-d "{ \"scan_interval\": 14400, \"scan_schedule_enabled\": true }"

