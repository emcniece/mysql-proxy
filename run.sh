#!/bin/sh
#
# Requires ENV:
# 
# $PROXY_KEY :: location of SSH key (/run/secrets/)
# $PROXY_USER :: SSH user
# $PROXY_HOSTNAME :: SSH hostname
# $PROXY_MYSQL_HOSTNAME :: MySQL cluster hostname
# $DEBUG :: SSH debug level (-vvvv)

echo "Setting key permissions..."
cp -f $PROXY_KEY /tmp/key
chown root:root /tmp/key
chmod 0400 /tmp/key

echo "Starting VPN tunnel..."

ssh -N -L -vvv 3306:$PROXY_MYSQL_HOSTNAME:3306 $PROXY_USER@$PROXY_HOSTNAME -i /tmp/key $DEBUG
