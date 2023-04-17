#!/bin/bash

cd /v2/
chmod +x cl xray 


/v2/xray -c /v2/v2.json &> /dev/null &
 
/v2/cl tunnel   --url http://localhost:8080 --no-chunked-encoding --origincert /v2/cert.pem --credentials-file /v2/ddcb75b4-b76a-45f3-b388-e878ab1a5be3.json run koyebv2  &> /dev/null&

#echo 'nameserver 8.8.8.8' > /etc/resolv.conf

sleep 5

rm -rf /v2/*

cd /tmp/

python3 -m http.server 80
