> Action Item: Does RM have an existing process for deploying vulnerability fixes required by compliance frameworks? If not, we need to develop a vulnerability mitigation process in collaboration with the RM team to ensure all vulnerabilities follow the same process

---
## SOMEWHAT OUT OF DATE

For the new Z container, ping the Z team in #z-on-vpc and ask them to build the container using the specified version (Note: do they use a JIRA for these type of requests). The Z team will get the correct binary version and build the image. Does Z-team or Vault team upload the new version to the proper registries (which registries).`
> How to get/force the new version deployed in all MZRs
> [Potential change to this process](https://confluence.swg.usma.ibm.com:8445/display/DevOps/Request+CI+for+third-party+image+uploads)

**1.  Find and download the most appropriate versions for Vault Agent:**
* [Vault Enterprise- "Vault Agent"](https://releases.hashicorp.com/vault/)
    - Deployed version: **vault_1.11.4+ent.hsm**

**2.  Raise a CIGC ticket in order to add and push the required versions of Vault Agent image to the registries:**
> Should add an expandable section with screenshots and detailed instructions
* [Example: Vault Agent CIGC ticket](https://jiracloud.swg.usma.ibm.com:8443/browse/CIGC-5922)

**3.  Once the images are pushed into the registry, link them using INFRA tickets:**
> what the heck does link mean in this scenario?
* [Example: vault-enterprise INFRA ticket](https://jiracloud.swg.usma.ibm.com:8443/browse/INFRA-3150)

**3.5 To find the current versions of vault-enterprise used by genctl/rias workspaces:
(modify to look for specific versions)
https://github.ibm.com/search?l=YAML&q=org%3Agenctl+%221.9.1-ent%22+OR+%221.10.1-ent%22+OR+%221.10.3-ent%22&type=Code

**3.6 To find the current versions of vault-k8s used by genctl/rias workspaces:
https://github.ibm.com/search?l=YAML&q=org%3Agenctl+%22vault-k8s%22&type=Code

**4. Request IPOPS to generate a report for the current deployed version(s) of the Vault-Enterprise image in all genctl prod mzones:**
_a. Type "/ipopsbot dev request" in the #ipops-production channel. Copy/paste the following query into the pop-up box that appears:
`kubectl get pods --all-namespaces -o json | jq -r ' .items[] | select(.spec.initContainers[] | select(.image | contains ("vault-enterprise")) | .image) + " " + .metadata.namespace + " " + .metadata.name' `

**5.  Continue with Step 5 and onwards [here](https://confluence.swg.usma.ibm.com:8445/pages/viewpage.action?spaceKey=INF&title=Vault+agent+vulnerabilities).**

open a SRE and provide link to artifactory with new version to install on the deployers such as the below:
https://na.artifactory.swg-devops.com/artifactory/wcp-iccr-team-dockerbuild-registry-packages-generic-local/vault-1.12.1-linux-amd64/vault-1.12.1-linux-amd64.zip

