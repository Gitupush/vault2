# Submit Dev/Integration Secret Change Request
**Process for deploying, updating, deleting any secrets or development or integration vault clusters.**

> SCM Jira requests apply for (QZ2) DAL-DEV, (QZ2) DAL-INTEGRATION, and POK-DEV.

1. Go to the URL: [IBM VPC NextGen JIRA](https://jiracloud.swg.usma.ibm.com:8443/)
1. Create a JIRA Issue per the usual method (Click "Create" button or type 'c')
1. For **Project**, select `Security Change Management (SCM)`
1. For **Issue Type**, select `Deploy Secret`
1. Provide a **Summary** of the request and a **Description** and please specify the environment (i.e. ```dal-dev``` and/or ```pok-dev``` and/or ```dal-integration``` — OR — ```wdc-staging```)
1. For **Deployment Priority**, select one of the follow options:
    1. `Development Blocked` - Critical blocker
    1. `Deployment at Risk` - An upcoming deadline must be met or the priority will be escalated to blocker
    1. `Normal`
    1. `Future Deployment` - Typically done for non-Production requests with potentially code that is not using the Secret(s) yet
1. Secret Metadata URL
    1. For an existing Secret, populate the URL with the link to the Secret's metadata in the [**Secret Metadata Repo**](https://github.ibm.com/gensec/platform-inventory) repo
    1. For a new Secret, submit a PR with the required metadata to the [**Secret Metadata Repo**](https://github.ibm.com/gensec/platform-inventory) repo
1. For **Target Deploy Environment**, select an option for each field
    1. The first field defines the Multi-MZR Vault cluster
    1. The second field designates the MZR's deployment path
    1. Deployment clusters and paths: [**Operator Vault Endpoints**](https://github.ibm.com/gensec/OperatorVault-Public/wiki/Operator-Vault-Endpoints)
1. When completed, Vault admins will review request and confirm when new values are updated (if applicable) or work with requestor to populate Vault with new Secret Value.