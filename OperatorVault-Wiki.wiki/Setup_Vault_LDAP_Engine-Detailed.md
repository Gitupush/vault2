# Detail Instructions - Setting Up the Vault LDAP Authentiction Endpoint

## II. Create the LDAP engine
**CLI**   
`vault auth enable -namespace=nextgen -path=sl_ldap ldap`

**API**   
`curl -X POST -H "X-Vault-Namespace: nextgen/" -H "X-Vault-Request: true" -H "X-Vault-Token: $(vault print token)" -d '{"type":"ldap", "description":"", "config": {"options":null, "default_lease_ttl":"0s", "max_lease_ttl":"0s", "force_no_cache":false}, "local":false, "seal_wrap":false, "external_entropy_access":false, "options":null}' https://127.0.0.1:8200/v1/sys/auth/sl_ldap`

<hr>

## III. Configure the LDAP engine
**CLI**   
`vault write -namespace=nextgen /auth/sl_ldap/config @ldap-deploy.json`

**API**   
`curl -X PUT -H "X-Vault-Namespace: nextgen/" -H "X-Vault-Request: true" -H "X-Vault-Token: $(vault print token)" -d sl_ldap-config.json https://127.0.0.1:8200/v1/auth/sl_ldap/config`


#### Verify Vault's LDAP configuration
**CLI**   
`vault read -namespace=nextgen auth/sl_ldap/config`

**API**   
`curl -H "X-Vault-Namespace: nextgen/" -H "X-Vault-Request: true" -H "X-Vault-Token: $(vault print token)" https://127.0.0.1:8200/v1/auth/sl_ldap/config`

<hr>

## IV. Create LDAP Identity Group
**Example configuration of JSON file _ldap_deploy_group.json_**
```ldap_deploy_group.json
{
    "name":"ACCESSHUB_GROUP",
    "type":"external",
    "policies":"deploy"
}
```

`curl --silent --request PUT --header "X-Vault-Namespace: nextgen/" --header "X-Vault-Request: true" --header "X-Vault-Token: $(vault print token)"  --data @ldap_deploy_group.json --request PUT https://127.0.0.1:8200/v1/identity/group`

**Verify Identity Group**   
`vault list --namespace=nextgen identity/group/name`   
`curl -H "X-Vault-Token: $(vault print token)" -H "X-Vault-Request: true" -H "X-Vault-Namespace: nextgen/" https://127.0.0.1:8200/v1/identity/group/name?list=true`   

`vault read --namespace=nextgen identity/group/name/ngvault-GEOREGION-deploy`   
```curl -H "X-Vault-Request: true" -H "X-Vault-Namespace: nextgen/" -H "X-Vault-Token: $(vault print token)" https://127.0.0.1:8200/v1/identity/group/name/ngvault-GEOREGION-deploy```   

<hr>

## References
[Hashicorp Vault LDAP Authentication and LDAP Groups](https://www.jasonneurohr.com/articles/hashicorp-vault-ldap-authentication-and-ldap-groups/)

<hr>

#### Optional or Obsolete Steps
<details>
<summary>Ignore for now</summary>

## Creating the Group Aliases
Group aliases will be created for both of the LDAP security groups mapping them to the Vault identity groups. The group alias name must match the security group CN (common name) in LDAP.

##### Get the Accessor of the LDAP Engine
CLI
vault auth list -namespace=nextgen -format=json | jq -r '.["sl_ldap/"].accessor'

API
curl --header "X-Vault-Token: s.NQWnh1WyIJEvbcKcE3YGWLei" --request GET http://localhost:8200/v1/sys/auth | jq -r '.["sl_ldap/"].accessor'

##### Get ID of the Newly Created Group
CLI
vault read -namespace=nextgen identity/group/name/qz2_deploy_users -format=json | jq ".data.id"

API
curl -s -H "X-Vault-Request: true" -H "X-Vault-Namespace: nextgen/" -H "X-Vault-Token: $(vault print token)" https://127.0.0.1:8200/v1/identity/group/name/qz2_deploy_users? | jq -r .data.id

##### Create the Group Alias
ldap_group_alias.json
{
  "name":"ng-operatorvault-qz2",
  "mount_accessor":"auth_ldap_4842b7b0",
  "canonical_id":"f7b5c299-482f-ad09-be92-ec0afc7ae8f7"
}

CLI

API
curl -sH "X-Vault-Request: true" -H "X-Vault-Namespace: nextgen/" --header "X-Vault-Token: $(vault print token)" --data @./ldap_group_alias.json --request POST https://localhost:8200/v1/identity/group-alias


###### Confirm Alias Created Correctly
vault list -namespace=nextgen /identity/group-alias/id
<group id number>

vault read -namespace=nextgen /identity/group-alias/id/<group id number>
</details>
