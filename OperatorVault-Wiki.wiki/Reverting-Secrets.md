<i>This page documents the procedure for Vault admins to safely revert secrets as a proper rollout plan across all regions whenever it is required by Service teams. The following below shows best practices that needs to be followed when rolling out changes with post validation steps executed after completion of each Change Request.</i><br>

***

<details>
<summary>Overview of Secret rotation and reverting requests</summary>

> Under normal circumstances, the Vault team securely pushes secrets into Vault upon receiving a request (_through a SNOW Change Request or Jira SCM_) from the Service team. In special cases where issues are found with rotated secrets, the Vault team can revert any changes made and return to previous versions whenever it is required. However, please note that the Vault team simply updates/rotates/deletes secrets based on modifications and validations previously made by the Service teams.<br>

</details>



<details>
<summary>Service team's responsibility prior to a 'Revert Secret' request</summary>

&nbsp;

<b>Service teams must always validate their secrets prior/after sharing them with the Vault team.</b>
* <i>Because the Vault team does not have any way to verify or validate secrets, this step is crucial for Service teams when sharing any secret with the Vault team, so we can minimize issues where we need to revert secrets. The Vault team is solely responsible for updating/rotating/deleting secrets as we do not have any right to modify keys or certificates unless instructed to do so by the Service team via a SNOW Change Request or Jira SCM.</i>

&nbsp;

<b>Service teams designate when changes can happen.</b>

* <i>The Vault team is only responsible for ensuring that secrets have been rotated as requested. Service teams must fill out the "Impact" section if there is one since the vault team cannot verify keys or certificates. Additionally, slowing the rollout of a Secret change doesn't impact a service. A pod must be restarted before the new Secret is ingested. Services can verify the API/Certificate before performing a rolling upgrade. If the Secret fails, the pod would 'crash' preventing the running pods from shutting down. Finally, the service would alert that it failed because of an invalid Secret. This is the optimum method for ensuring minimal impact.</i>

&nbsp;

<b>Service teams must raise a CR or SCM ticket in order to revert a secret.</b>

* <i>Upon raising a CR/SCM ticket, the Vault team will rollback the changes to any impacted mzone(s)/region(s) within 24 hours after having been assigned to their Vault Snow queue.</i>
* [Example SCM for reverting a secret in a Development/Integration environment](https://jiracloud.swg.usma.ibm.com:8443/browse/SCM-6769)
* [Example CR for reverting a secret in a Production/Dal-Staging environment](https://watson.service-now.com/change_request.do?sys_id=3c72933047c43110a7c069b3636d437a&sysparm_record_list=123TEXTQUERY321%3dkaustubh%5estart_dateSTARTSWITH2023-07-14%5e123TEXTQUERY321%3dkaustubh%5ecmdb_ci.u_tribe.u_segment.u_type%3dcloud%5eORDERBYzztextsearchyy&sysparm_record_row=1&sysparm_record_rows=1&sysparm_record_target=change_request&sysparm_view=default&sysparm_view_forced=true)

</details>



<details>
<summary>Steps to rollback a Secret</summary>

<b><i>A Vault admin will perform the following steps to safely rollback a secret to a previous version:</i></b>

1. Look into the metadata for all versions of a secret to include the created date:<br>
`vault kv get metadata -namespace=nextgen rias/wdc/staging/riaascore/rias-ingress-default-tls`

2. Depending on how many versions there were, enter the command below # of times to find the correct version to rollback to:<br>
`vault kv get -version=# -field=tls.crt -namespace=nextgen rias/wdc/staging/riaascore/rias-ingress-default-tls > tlsv#.crt`

3. Rollback to the desired version:<br>
`vault kv rollback -version=2 -namespace=nextgen rias/wdc/staging/riaascore/rias-ingress-default-tls`

</details>

***
