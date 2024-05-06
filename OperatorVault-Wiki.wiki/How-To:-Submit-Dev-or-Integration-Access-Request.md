# Request for Vault access
1. Go to the URL: [IBM VPC NextGen JIRA](https://jiracloud.swg.usma.ibm.com:8443/)
1. Create a JIRA Issue per the usual method (Click "Create" button or type 'c')
1. For **Project**, select `Security Change Management (SCM)`
1. For **Issue Type**, select `Vault Access Request`
1. Provide a **Summary** of the request and a **Description**
1. For **Access Type**, select one of the follow options:
    1. `Development` - Developing code that will use Operator Vault
    1. `Deployment` - Access is necessary to perform genctl, kube, or rias deployments
    1. `Administration` - **Reserved for Vault Administrators and requires Manager approval**
1. For **Vault Environment**, select from the _[**available Vault environments**](https://github.ibm.com/gensec/OperatorVault-Public/wiki/Operator-Vault-Endpoints)_
>***For Production Access, manager approval is required via email attachment or comment to the SCM.**
><br>***If you don't see the "Vault Access Request" template appear, please slack @jennicakwak to be granted access.**</br>
***