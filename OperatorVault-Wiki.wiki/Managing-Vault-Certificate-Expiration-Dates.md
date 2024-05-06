
### When managing vault certificates, such as looking up cert expiration dates and/or renewing certificates, please see the following commands:


***

CHECKING CERT EXPIRATION DATES

**Once logged in, execute the following command:** 
> sudo openssl x509 -noout -enddate -in /etc/vault.d/vault.crt



***


RENEWING CERTS

**1. Generate the certificate using the path from platform-inventory.**
> REGION=dal ENV=dev CONTEXT=qz2-dev make generate-secrets

**2. Load the certificate.**
> REGION=dal ENV=dev CONTEXT=qz2-dev make load-secrets




***


**QUESTIONS FOR MY VAULT TEAM**


(1) Are there any other follow-up procedures that need to be executed in order to RENEW the certs?

(3) Should I also put in a section in how to VIEW the vault cert and key?
Example:
$ cd /etc/vault.d/
$ls
$cat vault.crt
$cat vault.key

