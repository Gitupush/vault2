## - Access to IaaS Management -

**In order to gain access to IaaS vault servers, [START HERE](https://confluence.swg.usma.ibm.com:8445/display/OKB/SL+Active+Directory+Group+Mapping+and+Access+for+VPC+NextGen+IaaS+VPC#SLActiveDirectoryGroupMappingandAccessforVPCNextGenIaaSVPC-NGVPCGroups(WhatisinuseinSALTtoday)).**

**You may also follow the steps below:**

 **1) Get a Softlayer account(IAAS Access Management)**: This request will be initiated by your Manager.

  **2) Get Shellng Access**: This is to log into shellng servers across DAL,TOK, LON and QZ2 datacenters namely. However, this cannot be done until you have Softlayer/IaaS access management access first!

> Note: To access the DAL region, FSBOA access needs to be raised.

> Note: For initial FSBOA access, the Manager needs to raise a request for the new joinee by using the [IMS Security Level Access](https://ibm.box.com/s/05dko9fp2l4691zjh9ls9vme2o3wxvls) document. 

> Sample Access Request](https://ibm.box.com/s/93iby6kd3qdjfqzn12shqtc4yjscdrk9))

> Once FSBOA is granted for the user, the user needs to raise a [JIRA request](https://jira.softlayer.local/browse/BASTION-18690) in order to login to the DAL region sample.

> Once a Softlayer account is raised, you should be able to manage your requests from the [IaaS Access Management Home](https://ibm.idaccesshub.com/ECMv6/request/requestHome).

  **3) Add the GROUPS (regions) below from IaaS Management Access by sending in your requests [HERE](https://ibm.idaccesshub.com/ECMv6/request/manageRequest).**


|  GROUPS TO ADD         |                        |
|:-----------------:     |:----------------------:| 
| softlayer-shellng      | softlayer-shellngqztwo |
| us-east-shellng        | us-east-shellngqztwo   |
| us-south-shellng       | us-south-shellngqztwo  |
| au-syd-shellng         | au-syd-shellngqztwo    |
| eu-de-shellng          | eu-de-shellngqztwo     |
| eu-gb-shellng          | eu-gb-shellngqztwo     |
| jp-tok-shellng         | jp-tok-shellngqztwo    |
| jp-osa-shellng         | jp-osa-shellngqztwo    |
| br-sao-shellng         | br-sao-shellngqztwo    |
| ca-tor-shellng         | ca-tor-shellngqztwo    |
| eu-fr2-shellng         | NG-SECOPT              |

> **Note:** When adding in the "Business Justification" message, be very clear and specific in terms of what you require and why. 

> **Sample "Business Justification" message 1:** _As a member of Security Operations, I need access to the jump servers in the NG Regions. Thank you!_

> **Sample "Business Justification" message 2:** _I am raising access for the jumphosts. As part of VPC security and operations team we need to support vault operations across requested servers. Our responsibility is to maintain the control to vault across multiple datacenters based in NextGen VPC. Therefore, I kindly request you to grant access to the selected jumphosts._ 


  **4) NextGen (VPC) JIRA/Confluence Software Users** - From Access Hub, request new access by adding NextGen (VPC) JIRA/Confluence Software Users from the search list.

  **5) PagerDuty - Add/Remove from Teams** - From Access Hub, request new access by adding NextGen (VPC) JIRA/Confluence Software Users from the search list. The team to get added to is **VPC Secops**.
> [PagerDuty Instructions](https://ibm.box.com/s/mitsp7ydziwhlkmqosicww2ksk2vs)
