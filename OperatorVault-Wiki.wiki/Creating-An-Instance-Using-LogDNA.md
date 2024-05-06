> _**Prerequisite** If you have not created an IBM Cloud account, follow these [instructions](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Registering-for-an-IBM-Cloud-Account)._
> If you are unable to select **IBM DevSecOps** from the drop-down menu, contact James Whiteley (Slack @james).

## Using the IBM Cloud Web Interface</b></summary>

1. Log into [cloud.ibm.com](https://cloud.ibm.com)
1. Click on **Catalog** from the top bar
1. In the **Category** search bar, search for "IBM Log Analysis"
1. Select a location (drop-down)
1. Select a pricing plan (drop-down) (7-day)
1. Create a service name ('MZR'-LogAnalysis)
1. Select a resource group (drop-down)
   1. If the necessary resource group does not exist, click on 'Manage' in the top-right menu bar, then 'Account'. In the updated left panel, select 'Resource Groups' and then create a new resource group with the appropriate name.
1. Check the license agreement box and click **Create**

<details>
<summary><b>Using the IBM Cloud CLI</b></summary>

1. If necessary, install the [IBM Cloud CLI](https://cloud.ibm.com/docs/cli?topic=cli-getting-started)
1. Login to your account:  
`ibmcloud login -sso`
1. For team related activities, choose the _IBM DevSecOps_ account
1. Ensure the resource group exists for the destination MZR by listing the current groups:  
`ibmcloud resource groups` (Example output below)
```
Name             ID                                 Default Group   State   
TOR-Vault        0a0effb8fdce48a3afdc04a12a67e23e   false           ACTIVE   
QZ2-Vault        178eed54083e4dc5bf080df324ea8122   false           ACTIVE
```
5. If the resource group does not exist, create it:  
`ibmcloud resource group-create <MZR>-Vault`  
6. Set the new resource group as the target for following commands:  
`ibmcloud target -g <MZR>-Vault`
7. Set the region associated with the MZR:  
`ibmcloud target -r <region>`  
&nbsp;(_For the list of regions, execute `ibmcloud regions`_)

 
</details>

***
**Return to the main [LogDNA page](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Creating-an-MZR's-LogDNA-Instance)**
