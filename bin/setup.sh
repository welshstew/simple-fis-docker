#!/bin/sh
tar -zxvf $HAWT_NAME.tar.gz && mv /tmp/$HAWT_NAME/* /deployments 
rm /tmp/$HAWT_NAME.tar.gz
chmod +x fix-permissions.sh
./fix-permissions.sh /deployments/
