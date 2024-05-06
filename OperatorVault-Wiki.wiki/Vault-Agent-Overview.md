### Scope

Vault agent minimizes human error for the configuration of secrets by automatically provisioning PKI certificates and renewing certificates at 70% of their life, automatically reading secrets from Vault and populating them for a service, and allowing the secrets managed by Vault to be changed and automatically updated within 5 minutes.

### Business Drivers
Service teams onboarding to vault agent with automated generation and deployment of new digital certificates containing renewed expiration dates will address the following recurring problems:

* _Customer Impacting Events (CIEs) due to expired digital certificates_:  There has been several examples recently of service outages with root cause being expired certificate(s).  Human factors prevented digital certificate rotation from occurring prior to certificate expiry.  Once a certificate expires, it can no longer be used to establish secure network connections.
* _Customer Impacting Events (CIEs) due to human errors during the process of generating new certificates_:  Issues also occur in the devops CI/CD pipeline due to human errors encountered during certificate generation and rotation.
* _Emergency "secrets-only" deployments in the VPC continuous deployment pipeline being caused by human factors_:  There have been several occurrences where service teams have brought forward a late and urgent request for an emergency secrets deployment to rotate digital certificates in order to prevent a service outage.  Such disruptions impact the delivery pipeline cadence and velocity.
* _Added maintenance costs associated with manually rotating digital certificates_:  Automating certificate rotation frees IBM Cloud engineers from performing a manual process and allows them to spend time on new enhancements and automations.

IBM Service onboarding to vault agent is a key 2023 initiative for IBM Cloud to improve reliability and availability of cloud services and to reduce maintenance costs

### Vault Agent Adoption Program
- Program Lead: Jim Fall
- Vault Lead: Jennica Kwak

#### Pending Review
Vault Agent Configuration
* [Razee ConfigMap](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Razee-ConfigMap)
