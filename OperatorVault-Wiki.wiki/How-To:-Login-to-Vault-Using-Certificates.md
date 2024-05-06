> Modify the below example for your specific use case

```bash
#   https://github.ibm.com/gensec/OperatorVault-Public/wiki/Operator-Vault-Endpoints
# To use DNS instead of IP addresses, contact James Whiteley for instructions
VAULT_ADDR='https://127.0.0.1:8200'

VAULT_AUTH_CERT='/v1/auth/cert/login'

VAULT_URL="${VAULT_ADDR}${VAULT_AUTH_CERT}"

VAULT_USER=${USER}
CERT_DIR="${HOME}/.vault_rc"

# This is the default file path and name used by Vault's cli tool, but 
# any location is fine.
VAULT_TOKEN="${HOME}/.vault-token"

# Specify either root (top-level) or specific namespace
# NAMESPACE='--header "X-Vault-Namespace: nextgen"'
NAMESPACE=""

# If the Vault's CA certificate is not installed on the OS, then download the
# appropriate one from
#   https://github.ibm.com/gensec/OperatorVault-Public/wiki/Operator-Vault-Endpoints
# Then change the following variable accordingly
#CACERT='--cacert vault-dal_intermediary-ca.crt'
CACERT=''

# Upon successful completion, your token is stored in ${VAULT_TOKEN}
curl -s ${NAMESPACE} --request POST ${CACERT} --cert "${CERT_DIR}/${VAULT_USER}.crt" --key "${CERT_DIR}/${VAULT_USER}.key" ${VAULT_URL} | jq -r ".auth.client_token" > ${VAULT_TOKEN}
```# For IP addresses for other Vault regions, refer to:
