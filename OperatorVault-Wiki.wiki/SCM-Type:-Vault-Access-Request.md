### Below are the different types of access requests that will generally come in:

* [Creating “approle”](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/SCM-Type:-Vault-Access-Request#creating-approle)
* [Creating QA-User certificate/key](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/SCM-Type:-Vault-Access-Request#creating-qa-user-certificatekey)
* [Renewing certificate/key](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/SCM-Type:-Vault-Access-Request#renewing-certificatekey)
* [Revoking vault access](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/SCM-Type:-Vault-Access-Request#revoking-vault-access)


***_NOTE_:*** Make sure that tickets which require approval have been approved first!<br> If not, add in a comment to have their manager add in a word of approval.
 
<br>

---


## Creating “approle”

An "approle" is a credential for developers to access Vault. The role is usually to "deploy," but there may be other types based on the customer's needs.</i></br>

<br>

Examples: [SCM-4784](https://jiracloud.swg.usma.ibm.com:8443/browse/SCM-4784), [SCM-8705](https://jiracloud.swg.usma.ibm.com:8443/browse/SCM-8705)

<b>NOTE: <i>There should be one environment per request</i></b>

1. Make sure it was approved by the requestor's manager. <i>(QZ2 needs approval; POK doesn't need approval)</i>

2. Run the following commands based on the <i>approle</i> type (change the email and -c flag to qz2-dev or pok-dev depending on the context)

* compute servers:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`vaultctl approle create deploy [user_email@ibm.com] -c qz2-dev -n nextgen`

* management servers:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`vaultctl approle create opsmgmt-deploy [user_email@ibm.com] -c qz2-dev -n nextgen`

* other types:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`vaultctl approle create smartnic [user_email@ibm.com]  -c qz2-dev -n nextgen`

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`vaultctl approle create ipops-automation ipops-automation@ibm.com -c qz2-dev -n nextgen`

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`vaultctl approle create sysbringup-update systembringuptool@ibm.com -c qz2-dev -n nextgen`

3. Create a 1Password vault and share the newly created credentials (role-id and secret-id) with the requestor. (If they don’t have a 1Password account, send the credentials to the requester on Slack and delete the credentials on Slack after they copy them over.)

5.  Update the Workflow to Done and add in a closed comment.

<br>

---


## Creating QA-User certificate/key

Examples: [SCM-4770](https://jiracloud.swg.usma.ibm.com:8443/browse/SCM-4770), [SCM-4736](https://jiracloud.swg.usma.ibm.com:8443/browse/SCM-4736)

1. Make sure it was approved by the requestor's manager.

2. Authenticate yourself:
`vault_cert_login.sh`

3. Run the script to create a new user cert:
`provision_new_certificate_user.sh`

4. Follow the instructions and fill in the fields asked:

> Add in the user's first and last name (Example: Jennica_Kwak)<br>
> Add in the user's email address<br>
> Add in namespace<br>
> Add in policy type<br>
> Cat the firstname_lastname cert (Example: cat Jennica_Kwak.crt)<br>
> Cat the firstname_lastname key (Example: cat Jennica_Kwak.key)


5. Create and share a 1Password vault with the private cert and key provided to the requestor.

6. Update the Workflow status to Done and close the ticket with a comment.

<br>

---


## Renewing certificate/key

Examples: [SCM-4702](https://jiracloud.swg.usma.ibm.com:8443/browse/SCM-4702), [SCM-8260](https://jiracloud.swg.usma.ibm.com:8443/browse/SCM-8260), [SCM-6064](https://jiracloud.swg.usma.ibm.com:8443/browse/SCM-6064)


1. Make sure it was approved by the requestor's manager.

2. Authenticate yourself:
`vault_cert_login.sh`

3. Run the script to create a new user cert:
`refresh_user_certificate.sh`

4. Follow the instructions and fill in the fields asked:

> Add in the user's first and last name (Example: Jennica_Kwak)<br>
> Add in namespace<br>

This should automatically renew an existing account.

5. Create and share a 1Password vault with the private cert and key provided to the requestor.

6. Update the Workflow status to Done and close the ticket with a comment.

<br>

---


## Revoking vault access

1. Authenticate yourself:
`vault_cert_login.sh`

2. Run the script/command to remove user from vault access:
`revoke_approle_user.sh [username@ibm.com]` or `vaultctl approle destroy-accessor deploy <acccessor_id>`

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>***NOTE:***</b>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i>If the command returns nothing, that means no user was found with access to that georegion.</i><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i>Please also remember that you only run this script ONCE in each of the five georegions:</i>

* QZ2 (qz2-dev)
* POK (pok-dev)
* AMERICAS (dal-prod)
* EU (lon-prod)
* EASIA (tok-prod)


<br>

---

Return to [Resolving SCMs](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Resolving-SCMs) page.

















