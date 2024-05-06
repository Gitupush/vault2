> When Nessus certificates are close to being expired, they must be re-generated per MZR.<br>
> This page documents the procedure to generate new Nessus certificates and keys.<br>
> Refer to [SCM-5206](https://jiracloud.swg.usma.ibm.com:8443/browse/SCM-5206).



***



<details>
<summary>Optional Step</summary>

<u>_Update the Nessus script and push it into the 'platform-inventory' repo_</u><br>
_(Note: This part is usually done once unless new MZRs are added or the script needs to be updated.)_

1.  Run a **_git pull_** in _platform-inventory_

2. Go into the **'nessus'** directory in **'platform-inventory'** and notice two files there with one named _provision_nessus_certificate.sh_: 
> _$ cd go/src/github.com/gensec/platform-inventory/secops/src/vault_pki/nessus_

3. Open the file _provision_nessus_certificate.sh_ in an editor and update whatever needs updating (i.e. adding in new MZR names). Note- You will need the CN and DNS information from @Pavel Alexei. Save and exit out of the editor:
> _For example:_<br>
> _$ vi provision_nessus_certificate.sh_<br>
> _Add into the file appropriately: DNS_ALT_NAMES_POK='pok1-qz1-sr1-rk042-s04-vm2, pok1-qz1-sr1-rk042-s05-vm2, nessus-pok'_

4. Run a **_git commit_**, then a **_git push_** to update the script into the repo

> _$ git commit -m'add comment about the change here' provision_nessus_certificate.sh_<br>
> _$ git push_ <br>

Note: If you get an error such as "_ERROR: Permission to gensec/platform-inventory.git denied to <username>. fatal: Could not read from remote repository_", you need to add your identity:<br>
> _$ ssh-add ~/.ssh/ibm.ssh/github_<br>
> _$ git pull_ <br>
> _$ git push_

</details>








<details>
<summary>Step 1</summary>

<u>_Generate new Nessus certificates and keys in each MZR using the updated script_</u>

1. **_git pull_** the 'platform-inventory' repo, and log into each [georegion's PRIMARY MZR](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Operator-Vault-Endpoints#georegions) to generate new certs and keys:

> _For example for DAL-PROD:_
> * _log into TOR (ssh tor01-vault1)_
> * _git pull 'platform-inventory'_
> * _$ cd go/src/github.com/gensec/platform-inventory/secops/src/vault_pki/nessus_

2. Run **_./provision_nessus_certificate.sh <MZR>_** to create new cert and key
> _$ ./provision_nessus_certificate.sh dal_

3. You should see newly created cert, key, and pem 
> _$ ls -la_<br>
> _dal-nessus.crt_<br>
> _dal-nessus.key_<br>
> _dal-nessus.pem_


4. Perform steps 1 through 3 for all MZRs

</details>






<details>
<summary>Step 2</summary>

<u>_Verify certificate details/expiration dates and share with Pavel Alexei (@Pavel Alexei)_</u>

1. From the MZR, **_cd_** into the 'nessus' directory and **_ls -la_** to see the list of files within the directory.
2. Run the command: **`openssl x509 -text -noout -in <file name>.crt`**

> _For example:_ <br>
> _$ openssl x509 -text -noout -in dal-nessus.crt_<br>

> _Confirm the renewed certificate's expiration date:_<br>
>  _Not Before: Aug  5 18:50:45 2022 GMT_ <br>
>  _Not After : Aug  5 18:51:10 2023 GMT_

3. Create a 1Password vault and share all MZRs' _**cert, key, pem, and expiration date**_ with Pavel Alexei.

</details>





