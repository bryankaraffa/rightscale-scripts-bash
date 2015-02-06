#!/bin/bash -e
#
# Quickly open a RightScale account with observe privileges
if [ -z "$1" ]; then
  echo
  echo "[observe-account] ERROR: You must specify an account id."
  echo "(Example: observer-account.sh 12345 )"
  exit
fi
echo

# Authenticate and get cookie for MASTER account
### Pre-configure MASTER account ID
acct="60072"
### Get Username and Password from user
. ./helpers/userinput-credentials.sh
### Execute API Call to retrieve cookie and save it to mycookie
. ./get-cookie.sh

customer_acct=$1
# Use cookie to authenticate and observe account
### Execute API Call to retrieve cookie and save it to mycookie
curl --silent -H X_API_VERSION:1.5 -b mycookie \
-d Host="us-3.rightscale.com" \
-d Referer="https://us-3.rightscale.com/global//admin_accounts/$customer_acct" \
-X POST https://us-3.rightscale.com/global//admin_accounts/$customer_acct/access

# Cleanup
rm -f mycookie

# Open the account page in the browser
### Find out what OS we are running on so we can launch the browser properly
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
  platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
  platform='osx'
fi
echo
echo "[observe-account] Platform detected: $platform."
### Open the browser
if [[ $platform == 'linux' ]]; then
  xdg-open "https://my.rightscale.com/acct/$customer_acct" &> /dev/null
elif [[ $platform == 'osx' ]]; then
  open "https://my.rightscale.com/acct/$customer_acct" &/dev/null
fi
echo "[observe-account] Browser launched!"
echo
