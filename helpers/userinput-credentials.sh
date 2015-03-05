#!/bin/bash -e
#
# get-cookie.sh
#
# Helper script used to get username, password, and account id. Usually used in
# conjunction with get-cookie.sh
# By: Bryan Karaffa
#
# Required parameters for get-cookie.sh
#
# rs_email="john.doe@example.com"   # The email address for your RightScale User in the Dashboard
# rs_pswd="SomeSecurePassword"      # Your User's password
# rs_acct="1234"                 # Account ID, easily obtained from navigation in the RS Dashboard

### Get Email
if [ -z "$rs_email" ]; then
  echo "Your RightScale user e-mail address, followed by [ENTER]:"
  read email
fi
### Get Password
if [ -z "$rs_pswd" ]; then
  echo "Your RightScale password, followed by [ENTER]:"
  read -s pswd
fi

### Get Account ID
rs_acct=$1
if [ -z "$rs_acct" ]; then
  echo "Account ID, easily obtained from the RightScale Dashboard, followed by [ENTER]:"
  read rs_acct
fi

echo
echo
echo "[userinput-credentials] Completed:  $email @ $rs_acct"
