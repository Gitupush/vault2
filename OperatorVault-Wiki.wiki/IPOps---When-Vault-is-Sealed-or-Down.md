**Reference:**
* Primary vault is down ([SCED-43368](https://jiracloud.swg.usma.ibm.com:8443/browse/SCED-43368))
* When vault is sealed ([SCED-43369](https://jiracloud.swg.usma.ibm.com:8443/browse/SCED-43369))

_If you notice the vault is sealed or down, please page the Vault Team._


***

## **To see whether the vault is sealed or down, execute the following command:**

> **<code>curl https://Vault_IP_Address:8200/v1/sys/seal-status | jq -r</code>**


## ***If the vault is up and unsealed, the output should look something like this:**

![When vault is up and unsealed](https://media.github.ibm.com/user/380758/files/53ccc880-db7c-11ec-9497-a02b2fd93afc)

## ***However, if the vault is down, the output should say <code>curl: connection refused</code>:**

![When vault is down](https://media.github.ibm.com/user/380758/files/6d6e1000-db7c-11ec-8bac-d504bad96104)


***


