#!/bin/sh -e
#
# Quickly open a RightScale account with observe privileges
if [ -z "$1" ]; then
  echo "\n[observe-account] ERROR: You must specify an account id.\n(Example: observer-account.sh 12345 )\n\n"
  exit
fi
echo

# Authenticate and get cookie for MASTER account
### Pre-configure MASTER account ID
acct="60072"
### Get Username and Password from user
. ./userinput-credentials.sh
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
### Specify the commands to open the browser
### Currently, only Google Chrome on OSX and Linux are supported.
if [[ $platform == 'linux' ]]; then
  alias open_browser='google-chrome'
elif [[ $platform == 'osx' ]]; then
  alias open_browser='/usr/bin/open -a "/Applications/Google Chrome.app"'
fi
### Open the browser
open_browser "https://us-4.rightscale.com/acct/$customer_acct"
echo "\n\n[observer-account] Done!"
echo
