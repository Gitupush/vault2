<br>

<b>NOTE</b> - <u>Skip `STEP #1` below IF</u> you have already set it up on your local machine following the steps in the [Vault Setup Instructions](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Setup-a-Unix-Account-for-Vault-Tasks/_edit#vault-setup-instructions), and start with `STEP #2` to set up your Vault environment in Poughkeepsie (POK-development).

<br>

---

## POK Vault Setup Instructions:

<details>
<summary><b>STEP #1 - Git SSH keys setup</b> (SKIP this step if you have Git SSH keys)</summary>

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
Change the "USERNAME" field to your Softlayer Active Directory username accordingly. </i>

<br>

<b>1. <u>Create a new user in POK and set up a temporary password</u>:</b><br>
_NOTE - You do not run these steps!_<br>
Reach out to a fellow admin with sudo access to help you set up a new user account in POK and ask them to run the commands below:<br>
```
sudo useradd -m -d /home/username -s /bin/bash USERNAME
sudo passwd USERNAME 
sudo passwd --expire USERNAME
```

<br>


<b>2. <u>Log in to POK to update your login password</u>:</b><br>
_NOTE - You will run this step from your local machine._<br>
ssh into POK. You will be prompted for your temporary password and asked to create a new one.<br>
```
ssh USERNAME@9.114.87.48
```

<br>


<b>3. <u>From POK, create an `ssh` directory</u>:</b><br>
Create the `~/.ssh` directory and exit from POK:<br>
```
mkdir ~/.ssh
exit
```

<br>

<b>4.<u>From your LOCAL machine, copy your github keys into POK</u>:</b> <br>
```
scp ~/.ssh/github* USERNAME@9.114.87.48:~/.ssh/
```

<br>



<b>5. <u>Log in to POK to add your identity</u>:</b><br>
Add your identity to your github keys in your `~/.ssh` directory where your github keys live<br>
```
ssh USERNAME@9.114.87.48
cd ~/.ssh 
eval $(ssh-agent)
ssh-add ~/.ssh/github
cd
```

<br>



<b>6. <u>Create a file in your home directory and copy/paste the following text there and execute the script:</u></b> <br>
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

##### # If you get an error message like below, see instructions [here](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Requesting-OperatorVault-repo-access) in steps 5 and 6 to request access to the "operatorvault.git" repo</i><br>

```
username@dal1-qz2-sr3-rk095-s15:~/go/src/github.ibm.com/gensec$ git clone git@github.ibm.com:gensec/operatorvault.git 
Cloning into 'operatorvault'... 
ERROR: Repository not found.
fatal: Could not read from remote repository.
Please make sure you have the correct access rights and the repository exists.
```

</details>




<details>
<summary><b>STEP #3 - <i>'vaultctl'</i> setup</summary>


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


While you have your "config.yaml" file open, **look for the section `user` under the `- name: pok` section**, and add in your `USERNAME.crt` and `USERNAME.key`:<br>

<details>
<summary>See example below:</summary>

```
- name: pok
  user:
    client-certificate: ~/.vaultctl/pok/USERNAME.crt
    client-key: ~/.vaultctl/pok/USERNAME.key
    username: ""
    password: ""
    roleID: ""
    secretID: ""
    ignore-namespace-on-auth: false
```
</details>



Save the "config.yaml" file and quit:<br>
Click `ESC` + enter `:wq!`

<br>

4. <u>Submit a Jira SCM ticket to request for POK vault access</u>:<br>
[Example SCM-8690](https://jiracloud.swg.usma.ibm.com:8443/browse/SCM-8690)


5. <u>Once you receive your POK vault credentials, add your certificate and key into your <b>`~/.vaultctl/pok`</b> directory</u>:<br>

```
cd ~/.vaultctl
mkdir pok
cd pok
vi USERNAME.crt
vi USERNAME.key
```



<br>

6. <u>Test time!</u><br>

Test #1:<br>
`vaultctl` <br>
<i>(You should see options for running 'vaultctl' if successful.)</i>

Test #2:<br>
```
vaultctl get secret genctl-demo-password -r pok -e dev -c pok-dev -n nextgen
```


**!! NOTE !!**
> If you encounter an error that <i>vaultctl</i> doesn't exist, try the following and test again:<br>
`vi ~/.bashrc`<br>
`export PATH=/home/USERNAME/bin:$PATH`<br>
`source ~/.bashrc`



 
---
&nbsp;

Related Material<br>
[VaultCTL Setup Guide](https://pages.github.ibm.com/iaas/s2-issue/workstreams/vault/vaultctl_setup_guide.html)