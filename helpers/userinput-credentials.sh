#!/bin/sh -e
#
# get-cookie.sh
#
# Helper script used to get username, password, and account id. Usually used in
# conjunction with get-cookie.sh
# By: Bryan Karaffa
#
# Required parameters for get-cookie.sh
#
# email="john.doe@example.com"   # The email address for your RightScale User in the Dashboard
# pswd="SomeSecurePassword"      # Your User's password
# account="1234"                 # Account ID, easily obtained from navigation in the RS Dashboard

### Get Email
if [ -z "$email" ]; then
  echo "The email address for your RightScale User in the Dashboard, followed by [ENTER]:"
  read email
fi
### Get Password
if [ -z "$pswd" ]; then
  echo "Your User's password, followed by [ENTER]:"
  read -s pswd
fi

### Get Account ID
if [ -z "$acct" ]; then
  echo "Account ID, easily obtained from navigation in the Dashboard, followed by [ENTER]:"
  read acct
fi
echo
echo
echo "[userinput-credentials] Completed:  $email @ $acct"
