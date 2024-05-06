**Prerequisite:** [Requesting Bastion Host Access](https://confluence.softlayer.local/pages/viewpage.action?spaceKey=HELPDESKPUB&title=AccessHub+-+Requesting+New+or+Modify+Access+With+Bastion+Host+Access)

---

## Connecting to a vault node is a two step process:

### Step #1: <i>Connect to a bastion host for that MZR</i>

Substitute `USERNAME` with your Softlayer Active Directory username


<details>
<summary><b>QZ2</b></summary>

<i>Please use DAL12 (shellngqztwodal1201) for your QZ2 bastion setup.</i>

```
tsh -l USERNAME --proxy=us-south.pylon.softlayer.local ssh USERNAME@shellngqztwodal1001.softlayer.local
tsh -l USERNAME --proxy=us-south.pylon.softlayer.local ssh USERNAME@shellngqztwodal1201.softlayer.local
tsh -l USERNAME --proxy=us-south.pylon.softlayer.local ssh USERNAME@shellngqztwodal1301.softlayer.local
```
</details>




<details>
<summary><b>Americas</b></summary>

<i>Please use TOR04 (shellngtor0401) for your Americas bastion setup.</i>

<details>
<summary>&nbsp;&nbsp;&nbsp;&nbsp;TOR</summary>

<i>Do NOT use TOR01 bastion(BROKEN).</i>
```
***DO NOT USE*** tsh -l USERNAME --proxy=ca-tor.pylon.softlayer.local ssh USERNAME@shellngtor0101.softlayer.local</s>
tsh -l USERNAME --proxy=ca-tor.pylon.softlayer.local ssh USERNAME@shellngtor0401.softlayer.local
tsh -l USERNAME --proxy=ca-tor.pylon.softlayer.local ssh USERNAME@shellngtor0501.softlayer.local
```
</details>

<details>
<summary>&nbsp;&nbsp;&nbsp;&nbsp;SAO</summary>

```
tsh -l USERNAME --proxy=br-sao.pylon.softlayer.local ssh USERNAME@shellngsao0101.softlayer.local
tsh -l USERNAME --proxy=br-sao.pylon.softlayer.local ssh USERNAME@shellngsao0401.softlayer.local
tsh -l USERNAME --proxy=br-sao.pylon.softlayer.local ssh USERNAME@shellngsao0501.softlayer.local
```
</details>


</details>

<details>
<summary><b>EU</b></summary>

<i>Please use LON04 (shellnglon0401) for your EU bastion setup.</i>

<details>
<summary>&nbsp;&nbsp;&nbsp;&nbsp;LON</summary>

```
tsh -l USERNAME --proxy=eu-gb.pylon.softlayer.local ssh USERNAME@shellnglon0401.softlayer.local
tsh -l USERNAME --proxy=eu-gb.pylon.softlayer.local ssh USERNAME@shellnglon0501.softlayer.local
tsh -l USERNAME --proxy=eu-gb.pylon.softlayer.local ssh USERNAME@shellnglon0601.softlayer.local
```
</details>

<details>
<summary>&nbsp;&nbsp;&nbsp;&nbsp;FRA</summary>

```
tsh -l USERNAME --proxy=eu-de.pylon.softlayer.local ssh USERNAME@shellngfra0201.softlayer.local
tsh -l USERNAME --proxy=eu-de.pylon.softlayer.local ssh USERNAME@shellngfra0401.softlayer.local
tsh -l USERNAME --proxy=eu-de.pylon.softlayer.local ssh USERNAME@shellngfra0501.softlayer.local
```
</details>
</details>

<details>
<summary><b>EASIA</b></summary>

<i>Please use TOK04 (shellngtok0401) for your EASIA bastion setup.</i>

<details>
<summary>&nbsp;&nbsp;&nbsp;&nbsp;TOK</summary>


```
tsh -l USERNAME --proxy=jp-tok.pylon.softlayer.local ssh USERNAME@shellngtok0201.softlayer.local
tsh -l USERNAME --proxy=jp-tok.pylon.softlayer.local ssh USERNAME@shellngtok0401.softlayer.local
tsh -l USERNAME --proxy=jp-tok.pylon.softlayer.local ssh USERNAME@shellngtok0501.softlayer.local
```
</details>

<details>
<summary>&nbsp;&nbsp;&nbsp;&nbsp;OSA</summary>

```
tsh -l USERNAME --proxy=jp-osa.pylon.softlayer.local ssh USERNAME@shellngosa2101.softlayer.local
tsh -l USERNAME --proxy=jp-osa.pylon.softlayer.local ssh USERNAME@shellngosa2201.softlayer.local
tsh -l USERNAME --proxy=jp-osa.pylon.softlayer.local ssh USERNAME@shellngosa2301.softlayer.local
```
</details>

<details>
<summary>&nbsp;&nbsp;&nbsp;&nbsp;SYD</summary>

```
tsh -l USERNAME --proxy=au-syd.pylon.softlayer.local ssh USERNAME@shellngsyd0101.softlayer.local
tsh -l USERNAME --proxy=au-syd.pylon.softlayer.local ssh USERNAME@shellngsyd0401.softlayer.local
tsh -l USERNAME --proxy=au-syd.pylon.softlayer.local ssh USERNAME@shellngsyd0501.softlayer.local
```
</details>
</details>

<details>
<summary><b>Special Access Request MZRs</b></summary>

<details>
<summary>&nbsp;&nbsp;&nbsp;&nbsp;FSBOA (DAL/WDC)</summary>

Follow the [FSBOA](https://github.ibm.com/gensec/OperatorVault-Public/wiki/files/docs/FSBOA-IMS_Security_Level_Access_Request.pdf) instructions for accessing the FSBOA MZRs (DAL and WDC)
<br>[Example ticket](https://jira.softlayer.local/browse/BASTION-27472)

</details>

<details>
<summary>&nbsp;&nbsp;&nbsp;&nbsp;BNPP (PAR)</summary>


[Request for BNPP access](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Requesting-BNPP-(PAR)-Access)

</details>
</details>

<br>

### Step #2: <i>From the bastion, connect to the desired vault or consul node</i>

<details>
<summary>Connect to the vault node</summary

_example:_ `ssh 10.200.95.45`

</details>


<br>

***
Return to [Vault Admin Party](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Welcome-to-the-Vault-Admin-Party)
