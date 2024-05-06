When resolving Jira SCMs and Snow CRs, you will run commands that require the `-r [region] -e [environment] -c [context] -n nextgen` fields to be entered. These fields will append after the usual `vaultctl` commands, so please be sure to adjust the command as needed. 

<br>

Here are a few example use cases:<br>
```
vaultctl get secret -r [region] -e [environment] -c [context] -n nextgen
vaultctl put secret -r [region] -e [environment] -c [context] -n nextgen apikey=xxxxx

REGION=[region] ENV=[environment] CONTEXT=[context] make generate-secrets
(for Makefile secret rotation)
```
<br>

**Refer to the fields below you can use to append at the end of the commands that you need to adjust based on the environment/region of each SCM/CR request:**

---

## DEVELOPMENT / INTEGRATION

<details>
<summary><b>QZ2 - Development (Dallas)</b></summary>

`-r dal -e dev -c qz2-dev -n nextgen`

</details>

<details>
<summary><b>QZ2 - Integration (Dallas)</b></summary>

`-r dal -e integration -c qz2-dev -n nextgen`

</details>

<details>
<summary><b>POK - Development</b></summary>

`-r pok -e dev -c pok-dev -n nextgen`

</details>

<br>

</details>



---


## STAGING / PRODUCTION

<details>
<summary><b>AMERICAS</b></summary>
&nbsp;

**DAL**
> `-r dal -e staging -c dal-prod -n nextgen`<br>
> `-r dal -e prod -c dal-prod -n nextgen`
<br>

**WDC**
> `-r wdc -e staging -c wdc-prod -n nextgen`<br>
> `-r wdc -e prod -c wdc-prod -n nextgen`
<br>

**TOR**
`-r tor -e prod -c tor-prod -n nextgen`
<br>

**SAO**
`-r sao -e prod -c sao-prod -n nextgen`
<br>

</details>





<details>
<summary><b>EU</b></summary>
&nbsp;

**LON**
`-r lon -e prod -c lon-prod -n nextgen`
<br>


**FRA**
`-r fra -e prod -c fra-prod -n nextgen`
<br>

**PAR/BNPP**
`-r par -e prod -c par-prod -n nextgen`
<br>

**MAD**
`-r mad -e prod -c mad-prod -n nextgen`
<br>

</details>






<details>
<summary><b>EASIA</b></summary>
&nbsp;

**TOK**
`-r tok -e prod -c tok-prod -n nextgen`
<br>

**OSA**
`-r osa -e prod -c osa-prod -n nextgen`
<br>

**SYD**
`-r syd -e prod -c syd-prod -n nextgen`
<br>

</details>


---

Return to [Resolving SCMs and CRs](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Resolving-SCMs-and-CRs) page.