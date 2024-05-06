_**Before using Vault, it will be helpful to gain a mental model of its anatomy and architecture.**_


***

# A High Level Visual Overview of Vault
![alt text](https://mktg-content-api-hashicorp.vercel.app/api/assets?product=vault&version=refs%2Fheads%2Fstable-website&asset=website%2Fpublic%2F%2Fimg%2Flayers.png "A High Level Overview of Vault")








***

# [The Skeleton of the Vault] The Barrier, Storage backend, and HTTP API

There are three main outer layer parts of the Vault: (1) the barrier, (2) the storage backend, and (3) the HTTP API.

* Surrounding the Vault, is a security barrier that automatically encrypts all data (requests made to the backend) leaving Vault using a 256-bit Advanced Encryption Standard (AES) cipher.
* Only the storage backend and the HTTP API are outside the barrier while all other components are inside the barrier.
> Storage backend is untrusted and is used to durably store encrypted data that is available across restarts.
> HTTP API is also started by the Vault server, so clients can interact with it.




***

# [STEP ONE - Unseal the Vault] _Unseal Keys_
When you start up Vault, it is in a **sealed** state. 
In order to run any operations, it must first be **unsealed** by using **unseal keys**.
* Unseal keys consists of an encryption key and master key. 
* The **encryption key**, which is used to protect all the data is generated when Vault starts. 
* The **master key** protects the encryption key. 
> By default, Vaults uses a technique called Shamir's Secret Sharing Algorithm that splits the master key into 5 shares--any 3 of the 5 shares are required to reconstruct the master key (_See image below_). However, Shamir's technique can be disabled, and the master key can directly be used to unseal the Vault.

![alt text](https://mktg-content-api-hashicorp.vercel.app/api/assets?product=vault&version=refs%2Fheads%2Fstable-website&asset=website%2Fpublic%2F%2Fimg%2Fvault-shamir-secret-sharing.svg "Breakdown of an Encryption Key")


* The Vault is successfully unsealed when it retrieves the encryption key and is now able to decrypt the data sent to the storage backend. 
* Once unsealed, Vault loads all of the configured audit devices, authentication methods, and secret engines.


> _**Note:** The configuration of audit devices, auth methods, and secret engines are stored in Vault in a YAML file (i.e. config.yaml) since they are security sensitive. Only users with the correct permissions can modify them as they are protected by the ACL system and constantly audited._






***

# [STEP TWO - Processing Requests from HTTP API to the Core]