#!bin/bash

#Your CLIENT_ID and CLIENT_SECRET should be saved as environment variables 
#Your resources.json file can be updated however you see fit.  Make sure your .json is formatted properly or you will get errors. 
#This also includes the use of a json parsing tool called JQ that you will need to have installed on your machine
#create the risk manager environment

echo "Creating your risk manager environment..."

curl -X POST \
 "https://api.riskmanager.fugue.co/v0/environments" \
  -u $CLIENT_ID:$CLIENT_SECRET \
  -H "Content-Type: application/json" \
  -d @resources.json | jq '.' >> info.json
  ID=$(jq -r '.id' info.json)

cat info.json
echo "Retrieving your Environment ID"
echo $ID
rm info.json

sleep 120

#initiating scan of the environment

echo "Initiating Risk Manager Scan"
sleep 10
curl -X POST https://api.riskmanager.fugue.co/v0/scans?environment_id=$ID \
   -u $CLIENT_ID:$CLIENT_SECRET | jq '.' >> scaninfo.json 
   
SCANID=$(jq -r '.id' scaninfo.json)
sleep 10

echo "Retrieving your Scan ID"
sleep 20
echo $SCANID

echo "Your environment is now scanning..."
sleep 120

cat scaninfo.json
rm scaninfo.json

