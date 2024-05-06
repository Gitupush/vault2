### Below are the different types of secret management requests that come in:

* [Adding test accounts/apikeys](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/SCM-Type:-Managing-Secrets-Requests#adding-qz2pok-test-accountsapikeys)
* [Get/Read secret](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/SCM-Type:-Managing-Secrets-Requests#getread-secret)
* [Rotate/Put secret](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/SCM-Type:-Managing-Secrets-Requests#rotateput-secret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;* [Makefile type](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/SCM-Type:-Managing-Secrets-Requests#makefile-type)<br>
&nbsp;&nbsp;&nbsp;&nbsp;* [Manual type](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/SCM-Type:-Managing-Secrets-Requests#manual-type)
* [Remove/Delete secret](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/SCM-Type:-Managing-Secrets-Requests#removedelete-secret)
* [Rollback secret](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/SCM-Type:-Managing-Secrets-Requests#removedelete-secret-1)

***_NOTE_:*** Be sure to ALWAYS update your repos before managing secrets!!! >>><b>GIT PULL</b><<<.

<br>

---


## Adding (QZ2/POK) test accounts/apikeys


Example: [SCM-4702](https://jiracloud.swg.usma.ibm.com:8443/browse/SCM-4702)

1. Make sure it was approved by the requestor's manager.

2. Open the 1Password vault that has been shared with you. (If not, ask the requestor to share the 1Password with you)

3. Run the following commands in <b>both</b> QZ2 and POK that have been shared with you in 1Password. 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Example: `vaultctl put secret testing-credentials --context=qz2-dev --env=staging --account=xxxxx acct="xxxxx" apikey="xxxxx"`

4. Update the Workflow status to Done and close the ticket with a comment.

<br>

---


## Get/Read secret

Example: [SCM-8624](https://jiracloud.swg.usma.ibm.com:8443/browse/SCM-8624)

1. Run the command to pull up the credentials:<br>
`vaultctl get secret [secretmeta_name] -r [region] -e [environment] -c [context] -n nextgen`

2. Create and share a 1Password vault with the credentials provided to the requestor.

3. Update the Workflow status to Done and close the ticket with a comment.


<br>

---


## Rotate/Put secret

<b>NOTE</b>: <i>There are two types of secret rotations- (1) Makefile type and (2) Manual type. A 'Makefile' uses a script to automatically rotate all of the certificate(s) and key(s) that are stored in the secret. The manual secret rotation type requires the admin to manually rotate each of the keys (i.e. apikey, certificate, certificate's key, a json file, etc.) stored in the secret.

### MAKEFILE type

Example: [SCM-9229](https://jiracloud.swg.usma.ibm.com:8443/browse/SCM-9229)

1. <b> » GIT PULL « </b> on both repos!

2. Go to the Makefile path:<br>
Example: `cd go/src/github.ibm.com/gensec/platform-inventory/secops/src/vault_pki/rias-rias-resource-metadata-service-tls`

3. Run the "make generate-secrets" command→ BE SURE THERE ARE NO ERROR MESSAGES in the generate-secrets output before moving on to the next step!
```
For dal-dev: REGION=dal ENV=dev CONTEXT=qz2-dev make generate-secrets
For dal-integration: REGION=dal ENV=integration CONTEXT=qz2-dev make generate-secrets
For pok-dev: REGION=pok ENV=dev CONTEXT=pok-dev make generate-secrets
```

4. Run the "make load-secrets" command:
```
For dal-dev: REGION=dal ENV=dev CONTEXT=qz2-dev make load-secrets
For dal-integration: REGION=dal ENV=integration CONTEXT=qz2-dev make load-secrets
For pok-dev: REGION=pok ENV=dev CONTEXT=pok-dev make load-secrets
```

5. Run the make read-secrets command:→ BE SURE the ‘ca.crt’ exists after loading into vault!
```
For dal-dev: REGION=dal ENV=dev CONTEXT=qz2-dev make read-secrets
For dal-integration: REGION=dal ENV=integration CONTEXT=qz2-dev make read-secrets
For pok-dev: REGION=pok ENV=dev CONTEXT=pok-dev make read-secrets
```

6. Copy and paste the output (generate-secrets and load-secrets) into the ticket for validation.

7. Update the Workflow status to Done and close the ticket with a comment.

<br> 

<b>***NOTE***</b>

Sometimes, we receive requests to rotate special types of Makefiles (Example: [SCM-5346](https://jiracloud.swg.usma.ibm.com:8443/browse/SCM-5346)):

* Makefile.redis
* Makefile.iam

For these types, we simply rotate the secret as we normally do above, but we add in the -f flag:

Examples:
```
REGION=dal ENV=dev CONTEXT=qz2-dev make -f Makefile.redis generate-secrets
REGION=dal ENV=dev CONTEXT=qz2-dev make -f Makefile.iam generate-secrets
```



<br>




### MANUAL type

There are different types of manual secret rotations: 
* apikey
* cert/key
* json file


<br>

<b><u>APIKEY manual secret rotation</u></b>

Example: [SCM-8697](https://jiracloud.swg.usma.ibm.com:8443/browse/SCM-8697)

1. <b> » GIT PULL « </b> on both repos!

2. Make sure a 1Password vault has been shared with you (If not, ask the requestor to share the 1Password with you)

3. First, "get secret" to see the contents of the secret:
`vaultctl get secret [secretmeta_name] -r [region] -e [environment] -c [context] -n nextgen`

4. Rotate the secret using the key(s) provided in the 1Password→ There may be more than one key. Be sure to look at the yaml link and take note of the key name(s).<br>
`vaultctl put secret [secretmeta_name] -r [region] -e [environment] -c [context] -n nextgen [key_name]=xxxxx`

5. Validate the rotation with ‘get secret’ once more and ensure the rotation has been made accurately:<br>
`vaultctl get secret [secretmeta_name] -r [region] -e [environment] -c [context] -n nextgen`

6. Copy and paste the ‘put secret’ and ‘get secret’ output into the ticket for validation. BE SURE TO REDACT the key values!

7. Update the Workflow status to Done and close the ticket with a comment.
<br> 

<b>***NOTE***</b>

If password has an "!", put a "\"before the exclamation mark

Example:
`vaultctl put secret [secretmeta_name] -r [region] -e [environment] -c [context] password=xxxx\!x`


<br>
<br>

<b><u>CERT/KEY/FILE manual secret rotation type</b></u>

Example: [SCM-8040](https://jiracloud.swg.usma.ibm.com:8443/browse/SCM-8040)

1. <b> » GIT PULL « </b> on both repos!

2. Make sure a 1Password vault has been shared with you (If not, ask the requestor to share the 1Password with you)

3. From the 1Password, open or download the file. Copy the contents of the file into a note with the same name of the key in the YAML (see example [secretmeta keys](https://github.ibm.com/gensec/platform-inventory/blob/a6c10b3ac6252a7c1ad6ca2d938f6a1118924a69/secops/v1/secretmeta/rias-rias-logrna-kafka-tls.yaml#L18))
```
vim -b ca.crt
vim -b client.crt
vim -b client.key
vim -b kafka-bootstrap-servers
vim -b kafka-topic
```

*Hint - <i>to prevent newline characters from being slipped in, use the “-b” flag when creating a file and save with <b>“:set  noeol”</b> before you save/quit the editor</i>: 
```
vim -b <file>
:set noeol
:wq
```

4. Load in the keys into vault (using example above):<br>
`vaultctl put secret rias-rias-logrna-kafka-tls -r pok -e dev -c pok-dev -n nextgen ca.crt=@ca.crt client.crt=@client.crt client.key=@client.key kafka-bootstrap-servers=@kafka-bootstrap-servers kafka-topic=@kafka-topic`

5. Validate the rotation with ‘get secret’ and ensure the rotation has been made accurately without any newlines inserted:<br>
`vaultctl get secret [secretmeta_name] -r [region] -e [environment] -c [context] -n nextgen`

6. Copy and paste the ‘put secret’ output (step 4) into the ticket for validation. 

7. Update the Workflow status to Done and close the ticket with a comment.


<br>

---


## Remove/Delete secret

Example: [SCM-5947](https://jiracloud.swg.usma.ibm.com:8443/browse/SCM-5947)

**To delete a SECRET:**<br>
`vaultctl delete secret [secretmeta_name] -r [region] -e [environment] -c [context] -n nextgen -f --force`

You will get an output like below:
```
vaultctl delete secret slack-webhook-url -r dal -e integration -c qz2-dev -n nextgen -f --force
Success! Data deleted (if it existed) at:  /rias/dal/integration/keyreact/slack-webhook-url
```

<br>

**To delete KEYS in a path:**<br>
`vaultctl kv metadata-delete genctl/mad/prod/z/hardware/keys -n nextgen -c qz2-dev`

You will get an output like below:
```
vaultctl kv metadata-delete genctl/mad/prod/z/hardware/keys -n nextgen -c qz2-dev
Success! Data deleted (if it existed) at:  genctl/metadata/mad/prod/z/hardware/keys
```

<br>


**To VERIFY:**<br>
`vaultctl kv get genctl/mad/prod/z/hardware/keys -c mad-prod -n nextgen`

You will get an output like below:
```
vaultctl kv get genctl/mad/prod/z/hardware/keys -c mad-prod -n nextgen
No value found at genctl/mad/prod/z/hardware/keys/
```


<br>


---


## Rollback secret
You usually rollback/revert to a previous version if there is an issue with the secret.

This section is under construction (will update soon)













---

Return to [Resolving SCMs](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Resolving-SCMs) page.
