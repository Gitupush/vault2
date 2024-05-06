**Prerequisite:** [Access needed to set up Vault](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Access-Needed-for-CSRE-(Vault-Access))

<br>

<b>The steps below pertain to setting up in the following georegions:</b><br>
* QZ2 
* Americas (DAL, WDC, TOR, SAO)
* EU (LON, FRA, PAR, MAD)
* EASIA (TOK, OSA, SYD)

<br>

<b>To set up in `POK`, please follow the instructions [here](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/POK-Vault-Setup).</b>

<br>

---

## Vault Setup Instructions


<details>
<summary><b>STEP #1 - Git SSH keys setup</b> (ONLY DONE ONCE ON YOUR DESKTOP)</summary>

<i>Create and upload your Git SSH keys, but skip this step if you already have a SSH key configured for use with Git</i>.
<br>

&nbsp;&nbsp;&nbsp;&nbsp;**1. From your local machine, generate a ssh key to use with Git**
```ruby
mkdir ~/.ssh || cd ~/.ssh 
ssh-keygen -t ed25519 -C github -f github
```
&nbsp;&nbsp;&nbsp;&nbsp;**2. Change the permissions**
```ruby
chmod 0600 github*
ls -ltra (verify the permissions)
```
&nbsp;&nbsp;&nbsp;&nbsp;**3. Upload SSH key to Github**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;From the [Github web interface](https://github.ibm.com/), go to ```Settings``` &rarr; ```SSH and GPG Keys``` &rarr; ```New SSH Key``` and paste the contents of <b>github.pub</b> and save it.

</details>




<details>
<summary><b>STEP #2 - Vault environment setup</b></summary>

<i><b>#README#</b><br>
You will run the entirety of 'STEP #2' and 'STEP #3' <u>four times</u> in order to set up Vault in the following georegions: QZ2, Americas, EU, and Easia. You may use the DAL-QZ2 setup example below as a guide when setting up all four georegions; however, click the "To set up other georegions" drop-down button for  clarity on setting up the other georegions. Please note that you must change the "USERNAME" field to your Softlayer Active Directory username accordingly. </i>

<br>

<b>1. <u>From your LOCAL MACHINE</u>:</b><br>
To set up QZ2:<br>
`tsh -l USERNAME --proxy=us-south.pylon.softlayer.local scp ~/.ssh/github* shellngqztwodal1201.softlayer.local:.ssh/`

<details>
<summary><i>To set up other georegions:</i></summary>

For full information on all bastion hosts, see [here](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Setup-SSH-to-Access-Vault-Nodes). 

```
* AMERICAS
tsh -l USERNAME --proxy=ca-tor.pylon.softlayer.local scp ~/.ssh/github* shellngtor0401.softlayer.local:.ssh/

* EU
tsh -l USERNAME --proxy=eu-gb.pylon.softlayer.local scp ~/.ssh/github* shellnglon0401.softlayer.local:.ssh/

* EASIA
tsh -l USERNAME --proxy=jp-tok.pylon.softlayer.local scp ~/.ssh/github* shellngtok0401.softlayer.local:.ssh/
```

</details>


<br>


<b>2. <u>Login to the bastion</u>:</b><br>
To set up QZ2:<br>
`tsh -l USERNAME --proxy=us-south.pylon.softlayer.local ssh USERNAME@shellngqztwodal1201.softlayer.local`

<details>
<summary><i>To set up other georegions:</i></summary>

For full information on all bastion hosts, see [here](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Setup-SSH-to-Access-Vault-Nodes). 

```
* AMERICAS 
tsh -l USERNAME --proxy=ca-tor.pylon.softlayer.local ssh USERNAME@shellngtor0401.softlayer.local

* EU
tsh -l USERNAME --proxy=eu-gb.pylon.softlayer.local ssh USERNAME@shellnglon0401.softlayer.local

* EASIA
tsh -l USERNAME --proxy=jp-tok.pylon.softlayer.local ssh USERNAME@shellngtok0401.softlayer.local
```

</details>



<br>


<b>3. <u>Log in to desired SSH node you want to set up Vault in and create a new directory <i>.ssh</i></u>:</b><br>
To set up QZ2:<br>
`ssh 10.200.95.45`<br>
`mkdir ~/.ssh`<br>
Exit the node.

<details>
<summary><i>To set up other georegions:</i></summary>

Note: Refer to the [Source of Truth SSH IPs](https://github.ibm.com/gensec/operatorvault/tree/master/docs/ssh/ibm.config.d) for all Vault endpoints.<br>

```
* AMERICAS 
# First, ssh into tor01-vault1
ssh 10.202.111.14 
mkdir ~/.ssh
# tor01 node has no vault connectivity, so we need to set up Vault in the dal10-qz1 node.

Second, ssh into dal10-vault: 
ssh 10.200.95.17
mkdir ~/.ssh
# Exit the node TWICE
# Must return to the TOR bastion


* EU
# lon04-vault
ssh 10.201.47.15
mkdir ~/.ssh
# Exit the node


* EASIA
# tok02-vault1
ssh 10.201.175.14
mkdir ~/.ssh
# Exit the node

```

</details>

<br>

<b>4.<u>From the BASTION to the desired Vault node</u>:</b> <br>
To set up QZ2:<br>
`scp ~/.ssh/github* 10.200.95.45:.ssh/`


<details>
<summary><i>To set up other georegions:</i></summary>

```
* AMERICAS 
# First, secure copy the github keys from TOR04 bastion into tor01 node:
scp ~/.ssh/github* 10.202.111.14:.ssh/

# Second, from TOR04 bastion, ssh into tor01 node: 
ssh 10.202.111.14 
# You should see your transferred github keys in your /home directory

# Lastly, secure copy the github keys from tor01 node into dal10 node: 
scp ~/.ssh/github* 10.200.95.17:.ssh/


* EU
scp ~/.ssh/github* 10.201.47.15:.ssh/


* EASIA
scp ~/.ssh/github* 10.201.175.14:.ssh/

```
</details>

<br>











<b>5. <u>Login to the Vault node</u>:</b><br>
To set up QZ2:<br>
`ssh 10.200.95.45`

<details>
<summary><i>To set up other georegions:</i></summary>

```
* AMERICAS 
ssh 10.200.95.17

* EU
ssh 10.201.47.15

* EASIA
ssh 10.201.175.14

```
</details>

<br>


<b>_** NOTE **_ </b>
> Steps 6 and 7 below should be ran in each georegion node.<br>
> See ssh IPs used in the above steps for reference.

<br>

<b>6. <u>Add the SSH key to the ssh-agent so the following <i>git clone</i> commands succeed</u>:</b> <br>
```
cd ~/.ssh
eval $(ssh-agent) 
ssh-add ~/.ssh/github  
cd
```
<br>

<b>7. <u>Create a file in your home directory and copy/paste the following text there and execute the script:</u></b> <br>
```
vi vault_setup.sh
chmod +x vault_setup.sh
./vault_setup.sh &
```


```
REPO_DIR="${HOME}/go/src/github.ibm.com"
REPOS='gensec/operatorvault gensec/platform-inventory gensec/operatorvault-wiki.wiki cloudlab/platform-inventory'

mkdir "${HOME}/logs" > /dev/null 2>&1

if [[ ! -d "${REPO_DIR}" ]]; then
	echo "Creating ~/go/src/github.ibm.com ..."
	mkdir -p "${REPO_DIR}" > /dev/null 2>&1
fi

pushd "${REPO_DIR}" > /dev/null 2>&1
	for repo in ${REPOS}; do
		dir_name="$( echo $repo | cut -d'/' -f1 )"
		repo_name="$( echo $repo | cut -d'/' -f2 )"

		if [[ ! -d "${dir_name}" ]]; then
			mkdir "${dir_name}" > /dev/null 2>&1
		fi

		echo "Cloning ${repo} ..."
		pushd "${dir_name}" > /dev/null 2>&1
			git clone --quiet git@github.ibm.com:${repo}
		popd > /dev/null 2>&1

	done

popd > /dev/null 2>&1

cd > /dev/null 2>&1
ln -s "${REPO_DIR}/gensec/operatorvault/bin"
ln -s "${REPO_DIR}/gensec/operatorvault"
ln -s "${REPO_DIR}/gensec/platform-inventory"
```
> The actual source for the above [script](https://raw.github.ibm.com/gensec/operatorvault/master/docs/ssh/setup_user.sh?token=GHSAT0AAAAAAACAZL6FJMJF4N3VYDS7SSEMZQMIZEQ)

##### ### If you get an error message like below, see instructions [here](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Requesting-OperatorVault-repo-access) in steps 5 and 6 to request access to the "operatorvault.git" repo</i><br>

```
username@dal1-qz2-sr3-rk095-s15:~/go/src/github.ibm.com/gensec$ git clone git@github.ibm.com:gensec/operatorvault.git 
Cloning into 'operatorvault'... 
ERROR: Repository not found.
fatal: Could not read from remote repository.
Please make sure you have the correct access rights and the repository exists.
```





<br>


###### ### If you have issues running git pull and you have to run these commands manually to add your github keys everytime you try to `git pull` your two repos like below,
```
 eval $(ssh-agent -s)
ssh-add ~/.ssh/github
```
<br>

Add this code block to the `~/.bashrc` in each vault node for each georegion (Americas, EASIA, EU,  POK, QZ2). This will make it so every time you start a new session it adds your keys:
```
if [ -z "$SSH_AUTH_SOCK" ]; then
   eval $(ssh-agent -s)
   ssh-add ~/.ssh/github
fi
```

<br>



</details>




<details>
<summary><b>STEP #3 - <i>'vaultctl'</i> setup</summary>

<b>Note:</b><br>
<i>The steps below should be ran in each georegion node.</i><br>
<i>See ssh IPs used in the above steps for reference.</i>


1. <u>Create your 'vaultctl' directory:</u>:<br>
`mkdir ~/.vaultctl; cd ~/.vaultctl` 


1. <u>Copy and paste the file below into your "config.yaml":</u>:<br>
`vi ~/.vaultctl/config.yaml`

<details>
<summary>config.yaml</summary>

```
apiVersion: v1
kind: Config
contexts:
- name: sao-prod
  context:
    args:
      env: prod
      region: sao
      vaultcluster: sao-prod
    cluster: americas
    cmd: {}
    inventories: []
    namespace: nextgen
    session:
    user: americas
- name: wdc-prod
  context:
    args:
      env: prod
      region: wdc
      vaultcluster: wdc-prod
    cluster: americas
    cmd: {}
    inventories: []
    namespace: root
    session:
    user: americas
- name: tor-prod
  context:
    args:
      env: prod
      region: tor
      vaultcluster: tor-prod
    cluster: americas
    cmd: {}
    inventories: []
    namespace: root
    session:
    user: americas
- name: dal-prod
  context:
    args:
      env: prod
      region: dal
      vaultcluster: dal-prod
    cluster: americas
    cmd: {}
    inventories: []
    namespace: root
    session:
    user: americas
- name: lon-prod
  context:
    args:
      env: prod
      region: lon
      vaultcluster: lon-prod
    cluster: eu
    cmd: {}
    inventories: []
    namespace: root
    session:
    user: eu
- name: fra-prod
  context:
    args:
      env: prod
      region: fra
      vaultcluster: fra-prod
    cluster: eu
    cmd: {}
    inventories: []
    namespace: root
    session:
    user: eu
- name: par-prod
  context:
    args:
      env: prod
      region: par
      vaultcluster: par-prod
    cluster: eu
    cmd: {}
    inventories: []
    namespace: root
    session:
    user: eu
- name: tok-prod
  context:
    args:
      env: prod
      region: tok
      vaultcluster: tok-prod
    cluster: easia
    cmd: {}
    inventories: []
    namespace: root
    session:
    user: easia
- name: osa-prod
  context:
    args:
      env: prod
      region: osa
      vaultcluster: osa-prod
    cluster: easia
    cmd: {}
    inventories: []
    namespace: root
    session:
    user: easia
- name: syd-prod
  context:
    args:
      env: prod
      region: syd
      vaultcluster: syd-prod
    cluster: easia
    cmd: {}
    inventories: []
    namespace: root
    session:
    user: easia
- name: pok-dev
  context:
    args:
      env: dev
      region: pok
      vaultcluster: pok1-qz1
    cluster: pok-dev
    cmd: {}
    inventories: []
    namespace: root
    session:
    user: pok
- name: qz2-dev
  context:
    args:
      env: dev
      region: dal
      vaultcluster: qz2-dev
    cluster: qz2-dev
    cmd: {}
    inventories: []
    namespace: root
    session:
    user: qz2
- name: local-ent
  context:
    args:
      dc: us-south-1
      env: dev
      region: pok
      vaultcluster: local-ent
    cluster: local
    cmd: {}
    inventories:
    - ~/go/src/github.ibm.com/gensec/operatorvault/secops/v1/
    - ~/go/src/github.ibm.com/gensec/platform-inventory/secops/*
    namespace: nextgen
    session:
    user: localuser
clusters:
- name: local-ent
  cluster:
    certificate-authority: ""
    insecure-skip-tls-verify: true
    server: http://127.0.0.1:8200
- name: eu
  cluster:
    certificate-authority: ""
    server: https://127.0.0.1:8200
- name: pok-dev
  cluster:
    certificate-authority: ""
    server: https://9.114.87.48:8200
- name: qz2-dev
  cluster:
    certificate-authority: ""
    server: https://127.0.0.1:8200
- name: easia
  cluster:
    certificate-authority: ""
    server: https://127.0.0.1:8200
- name: americas
  cluster:
    certificate-authority: ""
    server: https://127.0.0.1:8200
current-context: ""
onePassword: null
users:
- name: americas
  user:
    client-certificate: ~/.vaultctl/americas/
    client-key: ~/.vaultctl/americas/
    username: ""
    password: ""
    roleID: ""
    secretID: ""
    ignore-namespace-on-auth: true
- name: eu
  user:
    client-certificate: ~/.vaultctl/eu/
    client-key: ~/.vaultctl/eu/
    username: ""
    password: ""
    roleID: ""
    secretID: ""
    ignore-namespace-on-auth: false
- name: pok
  user:
    client-certificate: ~/.vaultctl/pok/
    client-key: ~/.vaultctl/pok/
    username: ""
    password: ""
    roleID: ""
    secretID: ""
    ignore-namespace-on-auth: false
- name: qz2
  user:
    client-certificate: ~/.vaultctl/qz2/
    client-key: ~/.vaultctl/qz2/
    username: ""
    password: ""
    roleID: ""
    secretID: ""
    ignore-namespace-on-auth: true
- name: easia
  user:
    client-certificate: ~/.vaultctl/easia/
    client-key: ~/.vaultctl/easia/
    username: ""
    password: ""
    roleID: ""
    secretID: ""
    ignore-namespace-on-auth: false
- name: localuser
  user:
    client-certificate: ""
    client-key: ""
    username: ""
    password: ""
    roleID: ""
    secretID: ""
    ignore-namespace-on-auth: true
inventories:
- ~/go/src/github.ibm.com/gensec/platform-inventory/secops/*
- ~/go/src/github.ibm.com/gensec/operatorvault/secops/v1
```
</details>

<br>

<b>*** NOTE ***</b> <br>
<i><b>For EU ONLY -> copy and paste this "config.yaml":</b></i>


<details>
<summary>config.yaml</summary>

```
apiVersion: v1
kind: Config
contexts:
- name: sao-prod
  context:
    args:
      env: prod
      region: sao
      vaultcluster: sao-prod
    cluster: americas
    cmd: {}
    inventories: []
    namespace: nextgen
    session:
    user: americas
- name: wdc-prod
  context:
    args:
      env: prod
      region: wdc
      vaultcluster: wdc-prod
    cluster: americas
    cmd: {}
    inventories: []
    namespace: root
    session:
    user: americas
- name: tor-prod
  context:
    args:
      env: prod
      region: tor
      vaultcluster: tor-prod
    cluster: americas
    cmd: {}
    inventories: []
    namespace: root
    session:
    user: americas
- name: dal-prod
  context:
    args:
      env: prod
      region: dal
      vaultcluster: dal-prod
    cluster: americas
    cmd: {}
    inventories: []
    namespace: root
    session:
    user: americas
- name: lon-prod
  context:
    args:
      env: prod
      region: lon
      vaultcluster: lon-prod
    cluster: eu
    cmd: {}
    inventories: []
    namespace: root
    session:
    user: eu
- name: fra-prod
  context:
    args:
      env: prod
      region: fra
      vaultcluster: fra-prod
    cluster: eu
    cmd: {}
    inventories: []
    namespace: root
    session:
    user: eu
- name: par-prod
  context:
    args:
      env: prod
      region: par
      vaultcluster: par-prod
    cluster: eu
    cmd: {}
    inventories: []
    namespace: root
    session:
    user: eu
- name: mad-prod
  context:
    args:
      env: prod
      region: mad
      vaultcluster: mad-prod
    cluster: eu
    cmd: {}
    inventories: []
    namespace: root
    session:
    user: eu
- name: tok-prod
  context:
    args:
      env: prod
      region: tok
      vaultcluster: tok-prod
    cluster: easia
    cmd: {}
    inventories: []
    namespace: root
    session:
    user: easia
- name: osa-prod
  context:
    args:
      env: prod
      region: osa
      vaultcluster: osa-prod
    cluster: easia
    cmd: {}
    inventories: []
    namespace: root
    session:
    user: easia
- name: syd-prod
  context:
    args:
      env: prod
      region: syd
      vaultcluster: syd-prod
    cluster: easia
    cmd: {}
    inventories: []
    namespace: root
    session:
    user: easia
- name: pok-dev
  context:
    args:
      env: dev
      region: pok
      vaultcluster: pok1-qz1
    cluster: pok-dev
    cmd: {}
    inventories: []
    namespace: root
    session:
    user: pok
- name: qz2-dev
  context:
    args:
      env: dev
      region: dal
      vaultcluster: qz2-dev
    cluster: qz2-dev
    cmd: {}
    inventories: []
    namespace: root
    session:
    user: qz2
- name: local-ent
  context:
    args:
      dc: us-south-1
      env: dev
      region: pok
      vaultcluster: local-ent
    cluster: local
    cmd: {}
    inventories:
    - ~/go/src/github.ibm.com/gensec/operatorvault/secops/v1/
    - ~/go/src/github.ibm.com/gensec/platform-inventory/secops/*
    namespace: nextgen
    session:
    user: localuser
clusters:
- name: local-ent
  cluster:
    certificate-authority: ""
    insecure-skip-tls-verify: true
    server: http://127.0.0.1:8200
- name: eu
  cluster:
    certificate-authority: ""
    server: https://127.0.0.1:8200
- name: pok-dev
  cluster:
    certificate-authority: ""
    server: https://9.114.87.48:8200
- name: qz2-dev
  cluster:
    certificate-authority: ""
    server: https://127.0.0.1:8200
- name: easia
  cluster:
    certificate-authority: ""
    server: https://127.0.0.1:8200
- name: americas
  cluster:
    certificate-authority: ""
    server: https://127.0.0.1:8200
current-context: ""
onePassword: null
users:
- name: americas
  user:
    client-certificate: ~/.vaultctl/americas/
    client-key: ~/.vaultctl/americas/
    username: ""
    password: ""
    roleID: ""
    secretID: ""
    ignore-namespace-on-auth: true
- name: eu
  user:
    client-certificate: ~/.vaultctl/eu/
    client-key: ~/.vaultctl/eu/
    username: ""
    password: ""
    roleID: ""
    secretID: ""
    ignore-namespace-on-auth: false
- name: pok
  user:
    client-certificate: ~/.vaultctl/pok/
    client-key: ~/.vaultctl/pok/
    username: ""
    password: ""
    roleID: ""
    secretID: ""
    ignore-namespace-on-auth: false
- name: qz2
  user:
    client-certificate: ~/.vaultctl/qz2/
    client-key: ~/.vaultctl/qz2/
    username: ""
    password: ""
    roleID: ""
    secretID: ""
    ignore-namespace-on-auth: true
- name: easia
  user:
    client-certificate: ~/.vaultctl/easia/
    client-key: ~/.vaultctl/easia/
    username: ""
    password: ""
    roleID: ""
    secretID: ""
    ignore-namespace-on-auth: false
- name: localuser
  user:
    client-certificate: ""
    client-key: ""
    username: ""
    password: ""
    roleID: ""
    secretID: ""
    ignore-namespace-on-auth: true
inventories:
- ~/go/src/github.ibm.com/gensec/platform-inventory/secops/*
- ~/go/src/github.ibm.com/gensec/operatorvault/secops/v1
```
</details>


<br>





While you have your "config.yaml" file open, **look for the section "user" in the region you are currently setting up vault in** (i.e. "- name: qz2" vs. "- name: americas" etc.), and add in your `USERNAME.crt` and `USERNAME.key`. You will do this for all regions (QZ2, Americas, EU, and Easia):<br>

<details>
<summary>See example below:</summary>

```
- name: qz2
  user:
    client-certificate: ~/.vaultctl/qz2/USERNAME.crt
    client-key: ~/.vaultctl/qz2/USERNAME.key
    username: ""
    password: ""
    roleID: ""
    secretID: ""
    ignore-namespace-on-auth: true
```
</details>



Save the "config.yaml" file and quit:<br>
Click `ESC` + enter `:wq!`

<br>

4. <u>Submit a Jira SCM ticket to request for vault access</u>:<br>
[Example SCM-8690](https://jiracloud.swg.usma.ibm.com:8443/browse/SCM-8690)


5. <u>Once you receive your vault credentials, add your certificate and key into your <b>/.vaultctl/<region></b> directory</u>:<br>

```
cd ~/.vaultctl
mkdir <region>
cd <region>
vi USERNAME.crt
vi USERNAME.key
```

<details>
<summary>Reference for 'region' field above</summary>

```
REGIONS:
* qz2
* pok
* americas
* eu
* easia
```
</details>


<br>

6. <u>Test time!</u><br>

Test #1:<br>
`vaultctl` <br>
<i>(You should see options for running 'vaultctl' if successful.)</i>

Test #2:<br>
`vaultctl get secret genctl-demo-password -r <region> -e <env> -c <context> -n nextgen` <br>
<i>(Adjust the -r, -e, -c fields accordingly to region. See [Fields to Use for SCMs and CRs](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Fields-to-Use-for-SCMs-and-CRs) for reference.)</i>



**!! NOTE !!**
> If you encounter an error that <i>vaultctl</i> doesn't exist, try the following and test again:<br>
`vi ~/.bashrc`<br>
`export PATH=/home/USERNAME/bin:$PATH`<br>
`source ~/.bashrc`



 
---
&nbsp;

Related Material<br>
[VaultCTL Setup Guide](https://pages.github.ibm.com/iaas/s2-issue/workstreams/vault/vaultctl_setup_guide.html)