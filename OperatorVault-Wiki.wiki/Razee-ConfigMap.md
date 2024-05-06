_This page exhibits a Vault Agent configuration in play through a Razee integration example._

***


### [Razee Mustache Template's ConfigMap](https://github.ibm.com/cloudlab/srb/blob/master/proposals/2974/README.md#3-architecture-interfaces-and-impact):
> _The ConfigMap is used to generate VAULT_CONFIG variable needed by vault-agent containers_


<details>
<summary>Mount Vault Agent ConfigMap Keys to Pod</summary>

> Vault Agent ConfigMap keys are mounted as a 'configMap' with each key mapped to a file name

![ConfigMap Keys Defined](https://github.ibm.com/gensec/OperatorVault-Wiki/blob/master/assets/ConfigMap%20Keys%20Defined.png)
</details>



<p>&nbsp;</p>

### [Razee Configuration for Certificate Management](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Razee-Configuration-for-Certificate-Management)


### [Razee Configuration for Reading Secrets](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Razee-Configuration-for-Reading-Secrets)


<p>&nbsp;</p>
<p>&nbsp;</p>


(_Click here to view the [storage workspace PR](https://github.ibm.com/genctl/storage-service-workspace/pull/4586/files) for an alternate way to handle Vault Agent PKI certificate generation._)


