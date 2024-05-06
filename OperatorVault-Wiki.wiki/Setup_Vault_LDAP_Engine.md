# High-level Instructions for Implementing a LDAP authentication endpoint
> Softlayer's Active Directory is used as the backend LDAP service

## Step 1 - Create the LDAP group in AccessHub

AccessHub groups follow this naming convention: `ngvault-GEOREGION-deploy`

**Create the AccessHub group**
1. https://confluence.softlayer.local/display/FABRIC/Requesting+a+New+AD+Group+or+Changes+to+an+Existing+AD+Group
2. https://confluence.softlayer.local/pages/viewpage.action?pageId=66312828

**Examples**   
&emsp;https://jira.softlayer.local/browse/FABREQ-25031  
&emsp;https://jira.softlayer.local/browse/SECOPT-1236

<hr>

## Step 2 - Provision the LDAP Authentication Endpoint

**Change into the script's directory**   
```pushd ~/go/src/github.ibm.com/gensec/operatorvault/bin/ldap```   

You should see two files
```
$ ls -l
total 12
-rw-r----- 1 jawhiteley uaemployees  495 Oct 11 16:20 ldap.tmpl-deploy
-rwxr-x--- 1 jawhiteley uaemployees 5128 Oct 11 16:20 provision_ldap_auth_endpoint.sh
```
**Execute the script using the ldap.tmpl_deploy file as the argument**   
```./provision_ldap_auth_endpoint.sh ldap.tmpl-deploy```   
> During the install, you will be prompted for your password so the script can use SUDO to read the password to authenticate with Softlayer's Active Directory server from the file `/etc/ldap.conf`

***

### Other Information
For more details on the inner workings of the script, refer to the manual [process](Setup_Vault_LDAP_Engine-Detailed)
