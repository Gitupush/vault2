
# Submitting a Vault Access Request
1. Login to [IBM Watson ServiceNow](https://watson.service-now.com)  
1. From the left-hand sidebar, scroll down until you see ```Global Change Calendar```. From the drop-down menu, click ```Standard Change Catalog```.  
![null](https://github.ibm.com/gensec/OperatorVault-Public/wiki/files/snow_images/snow-leftsidebar-create-change-request.png)  
1. After the page loads, on the top upper right-hand corner, search for "```vault```" next to the magnifying glass.
1. The screen will now load with several vault-related templates. Choose the <u><b>VAULT - Vault Access Request for Production Vault clusters</b></u> template. 
1. Fields with _red_ asterisks are required fields, such as _Location_ , _Assigned to_ , and _Description & Plan_ fields. (Assign to James Whiteley)
1. To select the Environment of the Vault cluster for this change request, click the magnifying glass  
![null](https://github.ibm.com/gensec/OperatorVault-Public/wiki/files/snow_images/specifying_the_region.png)  
**NOTE** a step to toggle the search pane **NOTE**
1. A pop-up window displays. For the "Global Catalog Environment Type" column enter **ibmcloud_region** (or **IBMCLOUD_REGION**) and hit return to get a list of all regions and choose the appropriate region for the change. For an access request to all clusters, simply select the DAL Region and list the remaining regions in the Description field.  
![null](https://github.ibm.com/gensec/OperatorVault-Public/wiki/files/snow_images/listing_ibmcloud_regions.png)    
1. Copy from the work note to the Description and Plan field and provide the information requested.
1. Once the fields are completed, click the 'Submit' button at the top right of the page or at the bottom left of the page under the scheduled dates section. 
1. Once submitted, your Vault Access Request CR should be <u><b>auto-approved</b></u>.  
1. ***Please make sure your MANAGER has written his/her note of approval in the CR.***
1. Now, you're done!  

> If at ANY time a creation needs to be cancelled, click the 'less than' button at the top of the task window   