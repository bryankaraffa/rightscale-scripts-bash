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
if [ -z "$email" ]; then
  echo "The email address for your RightScale User in the Dashboard, followed by [ENTER]:"
  read email
fi
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
echo "[observe-account] Launching browser.."
### Open the browser
if [[ $platform == 'linux' ]]; then
  xdg-open "https://my.rightscale.com/acct/$customer_acct" &
elif [[ $platform == 'osx' ]]; then
  open "https://my.rightscale.com/acct/$customer_acct"
fi
echo
echo
echo "[observer-account] Done!"
echo
