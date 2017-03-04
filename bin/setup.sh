#!/bin/sh
tar -zxvf *.tar.gz && mv /tmp/$HAWT_DEPLOYABLE_NAME-app/* /deployments 
rm /tmp/*.tar.gz
chmod +x fix-permissions.sh
./fix-permissions.sh /deployments/
