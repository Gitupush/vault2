# Overview
Currently Vault's API certificate, the certificate used for client communication on port 8200, is a manual creation and renewal. In the future, vault agent will automatically provision and renew the API certificates.

# Provisioning a New or Reprovisioning a Vault API certificate
The script, `provision_vault_server_api_certificate.sh`, is used for any Vault API certificate operations. As with all scripts, it's located in the gensec/operatorvault repository in the /bin directory

When provisioning a Vault API certificate, it *must* be done on the Vault server that needs a new API certificate.

Using the above guidance if we want to provision a certificate for the Vault servers in the OSA MZR, we should run the following command on each OSA vault server:
`$ provision_vault_server_api_certificate.sh`

The script details each step of the process and will exit upon any error. To troubleshoot any problems, review the errors, vault audit logs. Additionally each step can be manually executed to try and determine specific errors.

## Technical details
If there are any permission denied errors, ensure the output of the vault login indicated a successful login. Additionally, manually login to vault to verify there aren't any issues.

When vault creates the certificate, it will output JSON of the certificate into the `web.pem` file.

The `jq` (JSON query) binary reads the web.pem file looking for two fields: `.data.private_key` and `.data.certificate`. If the certificate creation is successful, the `web.pem` file will contain both fields. However if `jq` exits with an error, manually inspect the `web.pem` file to ensure both fields are present.

Vault API certificates use the Elliptic-Curve (EC) cryptosystem allows. The EC cryptosystem uses smaller keys than RSA, while still maintaining equivalent security to the RSA cryptosystem. Because of the smaller keys, EC is a more efficient (faster) encryption to use for SSL/TLS network connectivity. With that said, the script will intelligently determine the type of certificate, either EC or RSA, and perform the necessary verification to ensure the private key and certificate are a valid pair.

Now the newly created files are copied into `/etc/vault.d/` as the standard files `vault.crt` and `vault.key`. Additional checks are performed to verify the files copied into `/etc/vault.d` match the generated files.

Finally we send a SIGHUP signal to the vault process. This is a standard method for instructing vault to perform a few different activities. One of those causes the vault process to load the certificates specified in `/etc/vault.d/vault.hcl`. 

The vault api certificate is successfully rotated and in use by the vault process.
