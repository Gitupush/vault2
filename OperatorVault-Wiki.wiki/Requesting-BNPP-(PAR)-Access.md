In order to better support BNPP (PAR) operational tasks and security incidents, a request for temporary access to BNPP must be made to access Paris nodes. Please follow the instructions below.


***


PREREQUISITE: You must already have the group “eu-fr2-shellng” added in your AccessHub “IaaS Access Management” prior to all of these steps below. If not, you must be added to that first.


***

## Step 1 - Softlayer JIRA BASTION Issue Request
<details>
<summary>Create a Softlayer Jira BASTION ticket</summary>
<i>Purpose: You need to create a Softlayer Jira BASTION ticket which you will copy and paste the ticket URL into the "Reference URL" in STEP 2 below.</i><br>

Example: [BASTION-43536](https://jira.softlayer.local/browse/BASTION-43536)

1. Sign into [Jira Softlayer](https://jira.softlayer.local/secure/Dashboard.jspa)
1. Click "Create" to open a new issue
1. Fill in the fields:

> <p><u>Project</u> - BastionHost (BASTION)<br>
> <u>Issue Type</u> - Bastion Access Request<br>
> <u>Summary</u> - Access to NG servers to support BNPP Services<br>
> <u>Business Justification</u> - Require access to BNPP to support IBM Cloud critical baremetal services.<br>
> <u>Assignee</u> - to yourself<br>
> <u>Component/s</u> - NG team<br>
> <u>Change Start Date</u> - date you need access from<br>
> <u>Change End Date</u> - 4 days after the Change Start Date</p>

4. Click "Create" at the bottom
5. Ask a team member to validate your ticket

<br>
</details>

## Step 2 - Softlayer IMS Security Request
<details>
<summary>Create a Softlayer IMS Security Request ticket</summary>
Example: [IMS #1094756](https://internal.softlayer.com/SecurityLevel/editRequest/1094756)


1. Sign into [IMS Softlayer](https://internal.softlayer.com/SecurityLevel/createRequest)
1. Click "Create new Request" in the "Links" row to open a new security request
1. Fill in the fields:

> <p><u>Security Level</u> - BNPP<br>
> <u>Start Date</u> - date you need access from<br>
> <u>End Date</u> - 4 days after the Start Date<br>
> <u>Reference URL</u> - copy and paste your BASTION ticket URL created in the above section<br>
> <u>Accessing System ID</u> - shellngpar0401, shellngpar0501, shellngpar0601<br>
> <u>Justification</u> - Need to access the VPC NG service components in PAR MZR to continue build activities for our VPC NG service that is not yet production. We’ve consulted w/ Mark Ball who confirmed that 5 days is the maximum allowed window for temporary access request for BNPP Ded MZR.<br>
> <u>Select Employees</u> - enter the name(s) of individuals who need access<br>


4. Click "Create" at the bottom
5. Wait until the ticket is approved to access BNPP
6. Once the ticket's status changes from "Approved" to "ACTIVE", log into PAR:

`tsh -l jkwak --proxy=eu-fr2a.pylon.softlayer.local ssh jkwak@shellngpar0401.softlayer.local`

<br>
</details>



## Step 3 - Add Yourself to the AccessHub Group for BNPP
<details>
<summary>Create an AccessHub group request</summary>
<i>Make sure you are added into the BNPP AccessHub group 

*  [https://ibm.idaccesshub.com/ECMv6/request/requestHome](https://ibm.idaccesshub.com/ECMv6/request/requestHome)

<br>
</details>