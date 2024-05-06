> The below example is an export of the vault_approle_login.sh script. [**Download**](https://github.ibm.com/gensec/OperatorVault-Public/wiki/files/code/vault_approle_login.sh) it to get the latest release.

```bash
#!/bin/bash
# Lookup the proper endpoint at the following URL:
#   https://github.ibm.com/gensec/OperatorVault-Public/wiki/Operator-Vault-Endpoints
VAULT_ADDR='https://127.0.0.1:8200'
VAULT_AUTH_APPROLE='/v1/auth/approle/login'
VAULT_URL="${VAULT_ADDR}${VAULT_AUTH_APPROLE}"

# This is the filename used to store the Vault token
VAULT_TOKEN="${HOME}/.vault-token"

# Specify either root (top-level) or specific namespace
NAMESPACE='nextgen'

read -p "approle's role id: "
ROLE_ID=${REPLY}

read -p 'your assigned secret id: '
SECRET_ID=${REPLY}
echo ''

TMP_JSON="${HOME}/.vault_data.$$.json"

cat << EO_JSON >> ${TMP_JSON}
{
  "role_id":"${ROLE_ID}",
  "secret_id":"${SECRET_ID}"
}
EO_JSON

# Upon successful completion, your token is stored in ${VAULT_TOKEN}
curl --silent --header "X-Vault-Namespace: ${NAMESPACE}" --data "@${TMP_JSON}" ${VAULT_URL} | jq -r ".auth.client_token" | tee ${VAULT_TOKEN}

rm -f ${TMP_JSON}
```