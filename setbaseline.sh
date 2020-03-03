#This script will grab your most recent Fugue scan and set it as the baseline.  

#1. Will need to retrieve the environment ID either by name or otherwise
#2. Will need to retrieve the most recent SCANID to use as the baseline ID
#3. Will set the SCANID as the baseline  

ENVID=c0871c61-e1ea-4205-809f-e6b08cfa07e1 #Insert your environment ID here

echo "Retrieving the most recent scan to set your baseline..."
curl -X GET \
 "https://api.riskmanager.fugue.co/v0/scans?environment_id=$ENVID&status=SUCCESS&range_from=1577908490" \
  -u $CLIENT_ID:$CLIENT_SECRET | jq '.' >> scaninfo.json
  SCANID=$(jq -r '.items[0].id' scaninfo.json)

  echo $SCANID
  

echo "Now updating your baseline to reflect the most recent scan"

# The SCAN ID retrieved, will now become your baseline.

curl -X PATCH \
"https://api.riskmanager.fugue.co/v0/environments/$ENVID" \
-u $CLIENT_ID:$CLIENT_SECRET \
-H "accept: application/json" \
-H "Content-Type: application/json" \
-d "{ \"baseline_id\": \"$SCANID\" }" | jq '.'

echo "Your baseline has been updated!"

rm scaninfo.json

