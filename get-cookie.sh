#!/bin/bash -e
#
# get-cookie.sh
#
# Helper script to execute API call and receive cookie for a RightScale account
# By: Bryan Karaffa
#
# Required parameters
#
# rs_email="john.doe@example.com"   # The email address for your RightScale User in the Dashboard
# rs_pswd="SomeSecurePassword"      # Your User's password
# rs_acct="1234"                 # Account ID, easily obtained from navigation in the RS Dashboard

### Set acount_href
account_href="/api/accounts/$rs_acct"

echo "[get-cookie] Executing API Call: $email @ $account_href"
### Execute API Call to retrieve cookie and save it to mycookie
curl -s -H X_API_VERSION:1.5 -c mycookie \
--data-urlencode "email=$rs_email" \
--data-urlencode "password=$rs_pswd" \
-d account_href="$account_href" \
-X POST https://my.rightscale.com/api/session
