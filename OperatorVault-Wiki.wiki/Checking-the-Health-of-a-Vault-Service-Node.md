The script, `gensec/operatorvault/bin/check_vault_health.sh`, checks the vault service of the specified vault server. To provide an thorough test, the script duplicates the actions of a vault client such as a deploy process, developer, or vault agent.

> To verify the health of a vault service node, it's always best to test from another vault server or the deployer in that **same** datacenter. If you don't test from a server in the same datacenter as the vault server itself, the 192.168 check will fail.
 
## Prerequisites
The following repositories:
Source | Directory
--- | ---
github.ibm.com/gensec/operatorvault | ~/go/src/github.ibm.com/gensec/operatorvault
github.ibm.com/gensec/platform-inventory | ~/go/src/github.ibm.com/gensec/platform-inventory
github.ibm.com/cloudlab/platform-inventory | ~/go/src/github.ibm.com/cloudlab/platform-inventory
1Password 'Operator Vault' Vault* | ~/vault-admin_slack_token.txt
1Password 'Operator Vault' Vault** | ~/.vaultctl / < georegion > / health_check. <crt / key>

>1. In the 1Password 'Operator Vault' Vault, there's a note entitled 'Slack API Token and URL'. The value after 'TOKEN PATH' should be copied into the file, ~/vault-admin_slack_token.txt."  
>2. In the 1Password 'Operator Vault' Vault, there's a certificate



## Enabling/Disabling Slack Alerting
**Disable Slack Alerts**  
When manually running the script, it's recommended to disable Slack Alerting so there's no confusion between the automated tests and your manual test(s). Slack alerts are **enabled** by default. To disable alerts set the following environment variable before running the script:  
`export ENABLE_SLACK=0`  
This will cause the script to skip checking for the existence of a slack token.

**Enable Slack Alerts (Default)**  
Slack alerts are enabled by default, but for any slack alerts to be successful, the `vault-admin_slack_token.txt` file must exist. Refer to the [Prerequisites](#Prerequisites) section for details.

***

## Running the Script
Running the `check_vault_health.sh` without any arguments will produce the following output:
```
$ check_vault_health.sh 
Usage: check_vault_health.sh [action] <hostname> [<hostname>.....]
Possible actions:
       ping
       tcp8200
       login
       cert
       secret
       all (default action)
```
The [action] parameter is optional and, as shown above, 'all' is the action if no action is specified on the command line.  
The <hostname> parameter is required and should be the hostname of the vault node to test. For example if we are testing the DAL10 QZ2 vault node, then the command would be:
`check_vault_health.sh dal1-qz2-sr3-rk095-s15`  

#### The Optional Actions
- all - The default action which runs all the below actions in the listed order
1. ping - Simple test to see if the vault node's management IP address, usually starts with 192.168, is responsive and if the vault node's services IP address, usually starts with 10., is responsive.
1. tcp8200
1. login
1. cert
1. secret
