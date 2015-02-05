# RightScale Bash Scripts
### By: Bryan Karaffa

These scripts are designed to be used with [RightScale](https://www.rightscale.com).  You must have an account setup, and cloud(s) connected for most of these scripts to be functional.

# What's included?

## Operational Scripts
These are the primary scripts that actually _do something_.


### _observe-account.sh_

####Usage:  `observe-account.sh <Account ID>`
(Example: `observe-account.sh 12345`)

####Required Parameters:
`$1` = Account ID, easily obtained from navigation in the RS Dashboard

----

### _get-cookie.sh_

#### Usage: `get-cookie.sh`
#### Required Parameters:
`$user`, `$pass`, `$acct`


----

## Helper Scripts
These scripts are used primarily by the operational scripts but can be used to more quickly develop your own scripts.


### _userinput-credentials.sh_
Gets the `$user`,`$pswd`, and `$acct` variable to authenticate.  Commonly used right before running `get-cookie.sh`
#### Usage: `sh userinput-credentials.sh`
#### Required Parameters:
None
