# User Access Types
Users authenticate with Vault via a X509 certificate or an approle.

### X509 Certificates
 - Only Vault administrators are provisioned with certificates.

### AppRoles
 - AppRoles are provisioned for 24x7 operational staff responsible for deploying, maintaining, and troubleshooting IBM Nextgen VPC cloud.   

_AppRole Definition_   
AppRoles are similar to the enterprise definition of 'service accounts'. AppRoles have a shared username, referred to as a role-id, but instead of a common password, a unique secret-id is provisioned for each user, which allows activity to be directly correlated to a user.

# Lifecycle Management
 - Every quarter, a reminder to execute the Continued-Business-Need (CBN) process is broadcast in the #vault-cbn-process Slack channel. A member of the channel creates a Story to track the CBN effort and posts a link to the Story in the #vault-cbn-process channel. The CBN process involves creating JIRAs for each manager that has an employee with Vault access. For each employee, the manager must indicate whether the employee still needs access in support of his/her role. Once the managers have completed the CBN process, a Security Change Management (SCM) JIRA issue is created for each user to either revoke access or rotate the credentials for the user. A Vault administrator then shares the information using a 1Password Vault specific to that user.
