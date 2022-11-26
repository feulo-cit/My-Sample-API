#/bin/bash

echo "API Simple HTTP Test"
#echo "Waiting 15 seconds to Deploy Finish"
#sleep 15
BASE_URL=https://api-service-feulo-cit.cloud.okteto.net
# Test: Redness
URL="${BASE_URL}/ready"
STATUSCODE=$(curl -s -o /dev/null -w "%{http_code}" -X GET $URL -H  "accept: application/json")
if test $STATUSCODE != 200; then
    exit 1
    echo $URL " | HTTP Code: " $STATUSCODE " | Test Status Fail"
fi
echo $URL " | HTTP Code: " $STATUSCODE " | Test Status Pass"

# Test: Temperature Conversion 
URL="${BASE_URL}/celsius/10/fahrenheit"
STATUSCODE=$(curl -s -o /dev/null -w "%{http_code}" -X GET $URL -H  "accept: application/json")
if test $STATUSCODE != 200; then
    exit 1
    echo $URL " | HTTP Code: " $STATUSCODE " | Test Status ail"
fi
echo $URL " | HTTP Code: " $STATUSCODE " | Test Status Pass"

URL="${BASE_URL}/fahrenheit/10/celsius"
STATUSCODE=$(curl -s -o /dev/null -w "%{http_code}" -X GET $URL -H  "accept: application/json")
if test $STATUSCODE != 200; then
    exit 1
    echo $URL " | HTTP Code: " $STATUSCODE " | Test Status Fail"
fi
echo $URL " | HTTP Code: " $STATUSCODE " | Test Status Pass"
