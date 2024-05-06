# Vault PKI Certificates package builder

**Vault PKI Certificates package builder** provides the automation of building installable debian package. The build debian package when installed on a Ubuntu based host, it will add the vault pki certificates to the host's truststore to facilitate trusted access to Vault servers across regions. This will elimate the manual process of downloading certificates from OperatorVault-Wiki to access Vault servers.

## Getting Started

These instructions will help you to build a debian package on your ubuntu host and that when installed will add the vault pki certificates to the host's truststore.

### Prerequisites

Following prerequisites are required for building the vaultpkicert.deb package:

* The build machine OS must be Ubuntu.
* The build machine should be on IBM network.

Following prerequisites are required for installing the vaultpkicert.deb package:

* The host machine OS must be Ubuntu.
* The installer (Ubuntu OS user) should have sudo access.

### Building the debian package

1. Clone OperatorVault-Wiki git repo.

    `git clone git@github.ibm.com:gensec/OperatorVault-Wiki.git`

2. Set the BUILD_ROOT environment variable to a desired path where you want the package to be placed after build.

    `export BUILD_ROOT=<custom_path>`

*Note: if BUILD_ROOT ev is not set, then the package is will be created under `OperatorVault-Wiki/vault_pki_certs/debian/build` directory*

3. Execute build_pkg.sh script to build the vaultpkicert. The script is at path `OperatorVault-Wiki/vault_pki_certs/debian` inside the cloned repo.

    example: If executing inside root of the cloned repo, the run below command:
    `. OperatorVault-Wiki/vault_pki_certs/debian/build_pkg.sh`

4. If above command ran successfully, the debian package, vaultpkicerts.deb, would have been created under `$BUILD_ROOT/build` directory.

### Installing the debian package

1. Copy the built vaultpkicerts.deb package to the required Ubuntu host.
2. Install the pki certificates for Vault servers across all regions by running below command:

    `dpkg -i <path to the debian file>/vaultpkicerts.deb`



## Authors

* **Smruti Soumitra Khuntia** - *Initial work*

## Acknowledgments

* etc
