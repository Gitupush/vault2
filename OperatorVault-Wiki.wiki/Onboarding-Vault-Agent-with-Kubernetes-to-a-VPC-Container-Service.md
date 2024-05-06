### Table of Contents

<details><summary><i>Click here</i></summary>

**[Overview](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Onboarding-Vault-Agent-with-Kubernetes-to-a-VPC-Container-Service#overview)**

**[Shared Secrets Framework](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Onboarding-Vault-Agent-with-Kubernetes-to-a-VPC-Container-Service#shared-secrets-framework)**

&nbsp;&nbsp;&nbsp;_**[Concepts](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Onboarding-Vault-Agent-with-Kubernetes-to-a-VPC-Container-Service#concepts)**_<br>
* [Secrets Registration](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Onboarding-Vault-Agent-with-Kubernetes-to-a-VPC-Container-Service#secrets-registration)<br>
* [Secrets File Watcher](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Onboarding-Vault-Agent-with-Kubernetes-to-a-VPC-Container-Service#secrets-file-watcher)<br>
* [Validators](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Onboarding-Vault-Agent-with-Kubernetes-to-a-VPC-Container-Service#validators)<br>
* [Secrets Finalizers](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Onboarding-Vault-Agent-with-Kubernetes-to-a-VPC-Container-Service#secrets-finalizers)<br>
* [Observability Metrics](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Onboarding-Vault-Agent-with-Kubernetes-to-a-VPC-Container-Service#observability-metrics)<br>

&nbsp;&nbsp;&nbsp;_**[Onboarding to Vault Agent Runbook](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Onboarding-Vault-Agent-with-Kubernetes-to-a-VPC-Container-Service#onboarding-to-vault-agent-runbook)**_<br>


&nbsp;&nbsp;&nbsp;_**[Step 1. Configure the platform-inventory for your service to use Vault Agent](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Onboarding-Vault-Agent-with-Kubernetes-to-a-VPC-Container-Service#step-1--configure-the-platform-inventory-for-your-service-to-use-vault-agent)**_<br>


&nbsp;&nbsp;&nbsp;_**[Step 2. Configure your service workspace to use vault agent by modifying appropriate files and fields](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Onboarding-Vault-Agent-with-Kubernetes-to-a-VPC-Container-Service#step-2--configure-your-service-workspace-to-use-vault-agent-by-modifying-appropriate-files-and-fields)**_<br>


&nbsp;&nbsp;&nbsp;_**[Step 3. Configure your service container using the new framework](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Onboarding-Vault-Agent-with-Kubernetes-to-a-VPC-Container-Service#step-3-configure-your-service-container-using-the-new-framework)**_<br>


&nbsp;&nbsp;&nbsp;_**[Step 4. Test the service](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Onboarding-Vault-Agent-with-Kubernetes-to-a-VPC-Container-Service#step-4-test-the-service)**_<br>


&nbsp;&nbsp;&nbsp;_**[Step 5. Verify sysdig metrics and set up a dashboard](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Onboarding-Vault-Agent-with-Kubernetes-to-a-VPC-Container-Service#step-5-verify-sysdig-metrics-and-set-up-a-dashboard)**_<br>


&nbsp;&nbsp;&nbsp;_**[Step 6. Set up service alerts appropriate for your service when secrets rotation fails](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Onboarding-Vault-Agent-with-Kubernetes-to-a-VPC-Container-Service#step-6-set-up-service-alerts-appropriate-for-your-service-when-secrets-rotation-fails)**_<br>


&nbsp;&nbsp;&nbsp;_**[Step 7. Provide service-specific runbooks, if required, for your service secrets rotation failure alerts](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Onboarding-Vault-Agent-with-Kubernetes-to-a-VPC-Container-Service#step-7-provide-service-specific-runbooks-if-required-for-your-service-secrets-rotation-failure-alerts)**_<br>

</details>

***

# Overview

The technology of choice to automate rotation of VPC secrets for Kubernetes container services is [Hashicorp’s Vault Agent](https://developer.hashicorp.com/vault/docs/agent-and-proxy/agent), which is client daemon software which provides auto-renewal of VPC public key infrastructure (PKI) Vault certificates and caching of other types of secrets stored on Vault.  The Vault Agent runs as a sidecar in a Kubernetes service pod and, when configured in your workspace deployment file, is injected by [razee](https://razee.io/) on pod initialization as both an Vault Agent init container and the Vault Agent container.

Running the Vault Agent with your containerized service provides part of the solution for automated rotation.  While Vault Agent delivers renewed certificates and updated secrets in your service’s ephemeral pod file storage, your service must also monitor these secrets cached in pod file storage for changes and, upon change, consume and activate them in the service. Please refer to [Vault Agent Based Secret Delivery and Consumption for VPC services #2134](https://github.ibm.com/cloudlab/srb/pull/3941) for a technical description of Vault Agent with Kubernetes services. 

The guidance provided on this wiki describes how to enable Vault Agent with your Kubernetes service, how to enable Public Key infrastructure (PKI) Vault certificates and certificate renewals for your service, and how to consume PKI certificates and other secrets from Vault Server via Vault Agent.  This guidance is intended to be a comprehensive list of required steps for a service that has completed no prior work on Vault Agent adoption.  Service teams may be at various stages of Vault Agent adoption so depending on the adoption status of a given service, some of the steps may already be completed in your service.

# Shared Secrets Framework

<i>Github Repo:  [secret-shared-framework](https://github.ibm.com/genctl/secret-shared-framework)</i>

In order to provide a common Vault Agent secrets consumption pattern for all teams to use, a golang secrets management framework has been provided. The framework consists of a secrets watcher which watches for changes on all pod file secrets that have been registered with the framework.  When a secret file in pod storage changes, the framework will validate the new secret is valid and take the appropriate actions for both valid and invalid secrets.  The framework provides a fully pluggable design to allow service teams to build custom validators and custom finalizers that are called to activate a valid secret in the service.

The shared secrets framework is a shared library for loading, validating and monitoring of secrets.  The shared library is written in golang and provides a common pattern for all VPC service teams to use in  combination with Hashicorp Vault Agent.  By implementing both Vault Agent and the shared secrets framework in your service, you will achieve full automation for the delivery and consumption of secrets in your service.

The shared secrets framework provides:

* Secret watchers to detect when Vault Agent has updated a secret file in Kubernetes pod storage<br>
* A standard set of validators to validate common secret types, such as x.509 digital certificates and IAM API keys, before a new secret is activated within the service.  Validators are intended to reduce service outages by detecting invalid secrets before they are activated for use within a service.<br>
* A standard set of finalizers that initiate actions to activate a given secret in the service<br>
* Thorough and detailed service log coverage to aid in debug of certificate rotation issues<br>
* A standard set of sysdig metrics intended to provide observability into secret rotations and to enable alerts when rotation errors are encountered.<br>
* Customizable interfaces to provide custom validators and finalizers for any type of secret<br>

The shared secrets framework is intended to be a collaborative effort across all VPC pillars and VPC service teams to provide secrets validators and finalizers.  Service teams that have built validators or finalizers that would be of value to other service teams are encouraged to submit a PR to the [shared secrets framework](https://github.ibm.com/genctl/secret-shared-framework) to standardize their work within the framework.

***

## Concepts

Note: For more details on these concepts, refer to the README file here:  [https://github.ibm.com/genctl/secret-shared-framework](https://github.ibm.com/genctl/secret-shared-framework)

### Secrets Registration

Secrets are maintained in a Secret Store and there is one store per service.  Secrets added to the Secret Store via an AddSecret function.  Once in the store, the current, vetted version is maintained in memory and is replaced once a new version is provided by the Vault Agent and vetted by the appropriate secret validator.  We also have the concept of a Secret Set which is useful when secrets are related such as a certificate, key, and CA certificate chain.  Only when all of the secrets in a Secret Set entry are vetted as valid are the secrets made available for consumption.

### Secrets File Watcher

The Secrets File Watcher checks for changes to all registered secrets on a configurable interval.  This is done by comparing the checksum of the secret file in the mounted volumes to the secret in memory.  If a change is detected, the new secret is vetted by a validator and if it passes the checks, is written into the Secret Store.  If it fails the validation checks, it is not written into memory and a message is written out into the log with information which identifies the bad secret.  The previous secret is retained in memory and returned if that secret is asked for.

### Validators

Validators are golang functions which check the validity of a specific secret type.  We provide standard validators which check the validity of x509 certificates, and IAM API keys.  The x509 validator uses the a golang library to check that all of the certificate material is correct.  The IAM API key validator tries to use the provided API key to get a token from IAM to verify that the API key is valid. We also allow custom validators written by the individual service teams to be used.

### Secrets Finalizers

We allow teams to determine what action should be taken after a secret is rotated via an “OnRotation” function.  Actions could be to doing nothing (for those that retrieve the secret every time it is used), restarting an HTTP client to pick up the new secret, or causing a rolling restart of all of the pods in the service.  As with validators, we allow custom “OnRotation” functions to be written to give teams the flexibility to take whatever action they deem appropriate when a secret is rotated. 

### Observability Metrics

We provide a standard set of SysDig metrics to allow users to validate that their rotations are working correctly or alert on failed rotations.  We also provide a metric that tracks the time remaining on certificates to allow alerting if the auto-rotation has failed and manual intervention is necessary.

***

## Onboarding to Vault Agent Runbook

This section provides a step-by-step guide to assist service teams with onboarding to Vault Agent.

Onboarding a VPC service to Vault Agent requires the following steps:

1. Configure the service to use Vault Agent<br>
1. Configure the deployment yaml with secrets to inject the Vault Agent sidecar<br>
1. Register the service’s secrets in the service mainline<br>
1. Change all secrets access within the service to be done via the framework<br>
1. Establish validators for the service secrets<br>
1. Establish a finalizer for each registered secret<br>
1. Test the service<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a. Acquiring its secrets via the framework on start up and normal operation<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b. Rotation of each registered secret<br>
1. Set up service alerts appropriate for your service when secrets rotation fails<br>
1. Provide service-specific runbooks, if required, for your service secrets rotation failure alerts<br>

***

## Step 1.  Configure the platform-inventory for your service to use Vault Agent

<i>This section documents the fields required in configuring a Kubernetes service account with Vault. For any assistance or further questions, please contact <b>James Whiteley (@james)</b> or <b>John Kevlin (@jkevlin)</b> on Slack channel <b>#vault-agent-onboarding-vpc</b>.</i>

<i>The first step in on-boarding a Kubernetes container service to Vault Agent is to properly configure the service account in Vault. This must be done once for each container service.  For demonstration purposes, please refer to this [K8 service account example](https://github.ibm.com/gensec/platform-inventory/blob/main/secops/v1/ngserviceaccount/genctl-acadia-agent.yaml).</i>

*[Demo recording](https://ibm.ent.box.com/file/1344142117264)*

&nbsp;

**Step 1a.** Fork the [github.ibm.com/gensec/platform-inventory](https://github.ibm.com/gensec/platform-inventory) repository to your IBM personal repository.<br>

&nbsp;

**Step 1b.** Add a PKIRole that creates specific policies for the service account and defines the service’s secret names.<br>
_A single PKIRole file covering the entire service account is created in the [/platform-inventory/secops/v1/ngserviceaccount](https://github.ibm.com/gensec/platform-inventory/tree/main/secops/v1/ngserviceaccount) folder. Start by making a copy of the [Keylore PKIRole](https://github.ibm.com/gensec/platform-inventory/blob/main/secops/v1/ngserviceaccount/genctl-genctl-keylore.yaml) file, rename it for your service, and edit the PKIRole file as appropriate for your service._<br>

_Fields that should be modified and should not modified are as follows:_

&nbsp;&nbsp;&nbsp;&nbsp; **A. Fields that SHOULD be modified**<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_a. Replace [metadata.name](https://github.ibm.com/gensec/platform-inventory/blob/39ff94540bfc917608b0c1f83e4791008d5f9f80/secops/v1/ngserviceaccount/genctl-genctl-keylore.yaml#L4) with the new name for your service’s PKIRole_<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_b. Replace [nameTemplate](https://github.ibm.com/gensec/platform-inventory/blob/39ff94540bfc917608b0c1f83e4791008d5f9f80/secops/v1/ngserviceaccount/genctl-genctl-keylore.yaml#L6) with ???? (your service name?)_<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_c. [SecretNames](https://github.ibm.com/gensec/platform-inventory/blob/39ff94540bfc917608b0c1f83e4791008d5f9f80/secops/v1/ngserviceaccount/genctl-genctl-keylore.yaml#L12) must list all of the secrets that are required in your service. The secret names must match the files names that are created in the Secretmeta folder as described below. You will notice in the [Keylore example PKIRole file](https://github.ibm.com/gensec/platform-inventory/blob/main/secops/v1/ngserviceaccount/genctl-genctl-keylore.yaml) the secrets bear the names of the [genctl-keylore](https://github.ibm.com/gensec/platform-inventory/blob/main/secops/v1/secretmeta/) Secretmeta files, less the .yaml extension. Update the SecretNames as you create your Secretmeta files in step 1c below._<br>
 
&nbsp;&nbsp;&nbsp;&nbsp;**B. Fields that SHOULD NOT be modified**<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_a. roleTemplateName_<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_b. policyTemplateName_<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_c. policyNames_<br>

&nbsp;

**Step 1c.** For each secret required by your service:<br>
_Step 1c-i. Create a [Secretmeta](https://github.ibm.com/gensec/platform-inventory/blob/main/secops/v1/secretmeta/genctl-featureflags-tls.yaml#L11) file_<br>
* The file is created in the the [secretmeta](https://github.ibm.com/gensec/platform-inventory/tree/main/secops/v1/secretmeta) folder<br>
* Its file type is yaml<br>
* The [github file name](https://github.ibm.com/gensec/platform-inventory/blob/main/secops/v1/secretmeta/genctl-keylore-tls-cert-secrets.yaml) and [metadata.name](https://github.ibm.com/gensec/platform-inventory/blob/39ff94540bfc917608b0c1f83e4791008d5f9f80/secops/v1/secretmeta/genctl-keylore-tls-cert-secrets.yaml#L11) both must match the [secretName specified in the PKIRole](https://github.ibm.com/gensec/platform-inventory/blob/39ff94540bfc917608b0c1f83e4791008d5f9f80/secops/v1/ngserviceaccount/genctl-genctl-keylore.yaml#L18), less any .yaml extension<br>
* Specify the [metadata.annotations.original-kvpath](https://github.ibm.com/gensec/platform-inventory/blob/39ff94540bfc917608b0c1f83e4791008d5f9f80/secops/v1/secretmeta/genctl-keylore-tls-cert-secrets.yaml#L6) and [metadata.annotations.original-path](https://github.ibm.com/gensec/platform-inventory/blob/39ff94540bfc917608b0c1f83e4791008d5f9f80/secops/v1/secretmeta/genctl-keylore-tls-cert-secrets.yaml#L7)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_How does one determine the correct value?_<br>
* The [spec.kvPath.keys.name](https://github.ibm.com/gensec/platform-inventory/blob/39ff94540bfc917608b0c1f83e4791008d5f9f80/secops/v1/secretmeta/genctl-keylore-tls-cert-secrets.yaml#L23) is the name of the secret<br>
* Add a pkiConfig section, such as this [example](https://github.ibm.com/gensec/platform-inventory/blob/39ff94540bfc917608b0c1f83e4791008d5f9f80/secops/v1/secretmeta/genctl-keylore-tls-cert-secrets.yaml#L14).<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_a. The [docURL](https://github.ibm.com/gensec/platform-inventory/blob/39ff94540bfc917608b0c1f83e4791008d5f9f80/secops/v1/secretmeta/genctl-keylore-tls-cert-secrets.yaml#L18) describes how to rotate the secret (for manual rotation cases where a cert is currently generated via [makefile](https://github.ibm.com/gensec/platform-inventory/blob/main/secops/src/vault_pki/genctl-keylore-tls-cert-secrets/Makefile)). [Keylore docURL Example](https://github.ibm.com/gensec/platform-inventory/blob/main/secops/docs/genctl-keylore-tls-cert-secrets.md)_<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_b. The [kvpath](https://github.ibm.com/gensec/platform-inventory/blob/39ff94540bfc917608b0c1f83e4791008d5f9f80/secops/v1/secretmeta/genctl-keylore-tls-cert-secrets.yaml#L21) describes the secrets that will be included in this file_<br>
* secretmeta examples<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a. [Vault PKI certificate secretmeta](https://github.ibm.com/gensec/platform-inventory/blob/main/secops/v1/secretmeta/genctl-keylore-tls-cert-secrets.yaml)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. [Other secret types secretmeta](https://github.ibm.com/gensec/platform-inventory/blob/main/secops/v1/secretmeta/genctl-keylore-service-account-secret.yaml), such as API key or other service secret types<br>


_Step 1c.ii. If the secretmeta file describes a Vault PKI digital certificate, create a PKIRole file for the secret._<br>

_This PKIRole file will have a different policy structure for PKI Certificates versus other secrets comprised of key:value pairs.<br> 
Its file type is yaml and file name should start with "kc-" (required for automation); the rest of the filename must match the name of secretmeta file for the secret as well as the metadata.name and spec.pkiConfig.roleName fields in the secretmata file._<br>
* Example: [Vault PKI Certificate](https://github.ibm.com/gensec/platform-inventory/blob/main/secops/v1/pkirole/kc-genctl-keylore-tls-cert-secrets.yaml)<br>
* The spec.vaultSecretType will be “pki” for PKI Vault certs and "Programmatic" for non-PKI secrets

&nbsp;
**Step 1d.** Make sure to add a reference for each secret to the new Secretmeta in [NGServiceAccounts](https://github.ibm.com/gensec/platform-inventory/tree/main/secops/v1/ngserviceaccount)<br>

&nbsp;
**Step 1e.** Submit a Pull Request similar to this [example](https://github.ibm.com/gensec/platform-inventory/pull/790)

&nbsp;
**Step 1f.** Update your Jira with a link to the PR

&nbsp;
(**NOTE:** _The vault team have a nightly job that will download all new PKI roles. If you want to new PKI role downloaded to your mzone the vault team can do that you if you ask them on the <b>#operatorvault-general</b> channel._)


***

## Step 2.  Configure your service workspace to use vault agent by modifying appropriate files and fields

<i>Now you will make change to your workspace to enable Vault Agent. Changes are made to files in the workspace’s < repository >/hack/deploy/razee/genctl folder.</i>

*[Demo recording - go to 6:48](https://ibm.ent.box.com/file/1344142117264)*

**Step 2a.** Update the service-account.yaml file which defines the service account<br>

* **The metadata.name must match the nameTemplate field from the NGServiceAccount file**<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_a. Example: [Keylore NGServiceAccount](https://github.ibm.com/gensec/platform-inventory/blob/main/secops/v1/ngserviceaccount/genctl-genctl-keylore.yaml)_<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_b. Example: [Keylore service-account.yaml](https://github.ibm.com/genctl/keylore/blob/dev-integration/hack/deploy/razee/genctl/service-account.yaml)_<br>


* **Update the config map yaml file**<br>
_**NOTE** DO NOT SET A TTL in your vault-agent configuration. If you need to adjust your PKI TTL, you must adjust it in gensec/platform-inventory under your ```PKIRole```. When setting the ```ttl``` value in your PKIRole, set ```ttl``` and ```maxTTL``` to the same value._ <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_a. Add a vaultConfig stanza.  [Keylore example](https://github.ibm.com/genctl/keylore/blob/4de8a54dd52191671ae5e09b8869b482ba466869/hack/deploy/razee/genctl/keylore-cm-mtp.yaml#L42)_<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_b. The template section is service-specific and depends on the secrets defined for the service._<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_c. Define the Vault templates in the service config map._<br>

_The last segment of the secret path must match the pkirole file name (minus the .yaml extension), the metadata.name field in the pkirole file, and the nameTemplate.  The roleName in the secretmeta file should also match.  All values should be the same._<br>

_Examples:_<br>
&nbsp;&nbsp;* [Keylore config map Vault template](https://github.ibm.com/genctl/keylore/blob/4de8a54dd52191671ae5e09b8869b482ba466869/hack/deploy/razee/genctl/keylore-cm-mtp.yaml#L108)<br>
&nbsp;&nbsp;* [Keylore pkirole file](https://github.ibm.com/gensec/platform-inventory/blob/2f6edb647e955410970963d1a74de099dcd884ce/secops/v1/pkirole/kc-genctl-keylore-tls-cert-secrets.yaml#L4)<br>
&nbsp;&nbsp;* [Keylore secretmeta file roleName](https://github.ibm.com/gensec/platform-inventory/blob/2f6edb647e955410970963d1a74de099dcd884ce/secops/v1/secretmeta/genctl-keylore-tls-cert-secrets.yaml#L16)<br>


* **Update the deployment yaml file and configure the Vault Agent**<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_a. [Vault Agent Configuration](https://github.ibm.com/genctl/keylore/blob/4de8a54dd52191671ae5e09b8869b482ba466869/hack/deploy/razee/genctl/deployment.yaml#L113)_<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_b. [volumeMounts](https://github.ibm.com/genctl/keylore/blob/4de8a54dd52191671ae5e09b8869b482ba466869/hack/deploy/razee/genctl/deployment.yaml#L134)_<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_c. The configuration is standard aside from the [volumeMounts.mountPath](https://github.ibm.com/genctl/keylore/blob/4de8a54dd52191671ae5e09b8869b482ba466869/hack/deploy/razee/genctl/deployment.yaml#L135) and the [volumeMounts.name](https://github.ibm.com/genctl/keylore/blob/4de8a54dd52191671ae5e09b8869b482ba466869/hack/deploy/razee/genctl/deployment.yaml#L136)_<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_d. This [example](https://github.ibm.com/genctl/keylore/blob/4de8a54dd52191671ae5e09b8869b482ba466869/hack/deploy/razee/genctl/deployment.yaml#L209) shows Vault Agent init container and Vault Agent sidecar startup being controlled by a globals flag_<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_e. This [code block](https://github.ibm.com/genctl/keylore/blob/4de8a54dd52191671ae5e09b8869b482ba466869/hack/deploy/razee/genctl/deployment.yaml#L300) reads secrets from Kube Secrets when Vault Agent is not being used_<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_f. This [code block](https://github.ibm.com/genctl/keylore/blob/4de8a54dd52191671ae5e09b8869b482ba466869/hack/deploy/razee/genctl/deployment.yaml#L439) reads secrets from files when Vault Agent is being used (The key and path configurations match the templates defined in the config map yaml file)_<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_g. Configure the Vault Agent container to utilize the templates similar to this [example](https://github.ibm.com/genctl/keylore/blob/4de8a54dd52191671ae5e09b8869b482ba466869/hack/deploy/razee/genctl/deployment.yaml#L144)_<br>

&nbsp;
(**NOTE:** _Once step 2 is completed, your service is now using Vault Agent acquire the service’s secrets._)


***

## Step 3. Configure your service container using the new framework

<i>The next step is to make necessary changes to the service container itself using the shared secrets framework.</i>

*[Process to add Vault Agent's PKI support to your workspace](https://github.ibm.com/genctl/keylore/blob/460c29e3b67f615fe5241a94f0df95bd833082de/vault_instruction.md)*

*[Demo](http://%20https//ibm.box.com/s/zqu1tsif45g4fwodrdv1uv7oth5mfap0)*


**Step 3a.** Create a list of secrets used by the application

**Step 3b.** Initialize the framework and create a Secret store
```
ssf.Init()
ssf.SetWatcherInterval(30)
secretStore = ssf.NewSecretStore()
```

**Step 3c.** Add secrets to the Secret store
```
err = secretStore.AddSecretFromFile(apiKeyFile, ssf.FileSecret, "api-key-file")
if err != nil {
       panic(err)
}
```
_A secret can be a File, X509 Certificate or a Secret Set._


**Step 3d.** Add validators relevant to the application for the Secret
```
secretStore.GetSecret("api-key-file").AddValidator(func(s ssf.Secret) bool {
    return len(s.Get()) == 44
})
```

**Step 3e.** Add finalizer for the Secret. This function is called after successful rotation
```
secretStore.GetSecret("api-key-file").SetOnRotationFunc(func() {
    log.Info("Reloading api key file")
     // Code to reload api key
})
```

**Step 3f. [OPTIONAL]** Set the panic flag for the Secret
```
secretStore.GetSecret("api-key-file").SetPanicOnInvalid(true)
```
_This sets if the application should panic when the Secret becomes invalid._


**Step 3g. [OPTIONAL]** Set the threshold timestamp for the Secret
```
secretStore.GetSecret("api-key-file").SetThresholdTimestamp(time.Now().Add(time.Duration(24 * 3600)))
```
_This set the timestamp after which the Secret should be rotated._


**Step 3h.** Start the watcher go routines
```
secretStore.StartWatchers()
```


**Step 3i.** To access the Secret from the Secret store, use the Get call
```
secretStore.GetSecret("api-key-file").Get() // returns a byte slice
```
_Service must always get their secret via the Secret store.  Doing so ensures the service always gets the latest successfully validated secret._




***

## Step 4. Test the service<br>
* Acquiring its secrets via the framework on start up and normal operation<br>
* Rotation of each registered secret<br>


## Step 5. Verify sysdig metrics and set up a dashboard


## Step 6. Set up service alerts appropriate for your service when secrets rotation fails

## Step 7. Provide service-specific runbooks, if required, for your service secrets rotation failure alerts