#!/bin/sh
tar -zxvf $HAWT_DEPLOYABLE_NAME.tar.gz && mv /tmp/$HAWT_DEPLOYABLE_NAME-app/* /deployments 
rm /tmp/$HAWT_DEPLOYABLE_NAME.tar.gz
chmod +x fix-permissions.sh
./fix-permissions.sh /deployments/
