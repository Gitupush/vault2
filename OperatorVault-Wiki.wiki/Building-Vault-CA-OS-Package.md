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

1. Clone this git repo.

    `git clone git@github.ibm.com:gensec/operatorvault.git`

2. Set the BUILD_ROOT environment variable to a desired path where you want the package to be placed after build.

    `export BUILD_ROOT=<custom_path>`

*Note: if BUILD_ROOT ev is not set, then the package is will be created under `operatorvault/installation/building_vaultpki_pkg/vault_pki_certs/debian/build` directory*

3. Execute build_pkg.sh script to build the vaultpkicert. The script is at path `installation/building_vaultpki_pkg/vault_pki_certs/debian` inside the cloned repo.

    example: If executing inside root of the cloned repo, the run below command:
    `. operatorvault/installation/building_vaultpki_pkg/vault_pki_certs/debian/build_pkg.sh`

*Note: By default, debian installers pack Vault CA certs for prod regions only. To build the debian package for development Vault CAs, update
`operatorvault/installation/building_vaultpki_pkg/vault_pki_certs/hack/ci/target.txt` to `dev` from `prod`*

4. If above command ran successfully, the debian package, vaultpkicerts.deb, would have been created under `$BUILD_ROOT/build` directory.

### Installing the debian package

1. Copy the built vaultpkicerts.deb package to the required Ubuntu host.
2. Install the pki certificates for Vault servers across all regions by running below command:

    `dpkg -i <path to the debian file>/vaultpkicerts.deb`

### Package files
../wiki/files/building_vaultpki_pkg
 * [debian](files/building_vaultpki_pkg/debian)
   * [build](files/building_vaultpki_pkg/debian/build)
     * [vaultpkicerts_dev_1.1.1_amd64.deb](files/building_vaultpki_pkg/debian/build/vaultpkicerts_dev_1.1.1_amd64.deb)
     * [vaultpkicerts_prod_1.1.1_amd64.deb](files/building_vaultpki_pkg/debian/build/vaultpkicerts_prod_1.1.1_amd64.deb)
   * [build_pkg.sh](files/building_vaultpki_pkg/debian/build_pkg.sh)
   * [vaultpkicerts](files/building_vaultpki_pkg/debian/vaultpkicerts)
   * [DEBIAN](files/building_vaultpki_pkg/debian/vaultpkicerts/DEBIAN)
   * [control](files/building_vaultpki_pkg/debian/vaultpkicerts/DEBIAN/control)
   * [postinst](files/building_vaultpki_pkg/debian/vaultpkicerts/DEBIAN/postinst)
   * [postrm](files/building_vaultpki_pkg/debian/vaultpkicerts/DEBIAN/postrm)
 * [hack](files/building_vaultpki_pkg/hack)
   * [ci](files/building_vaultpki_pkg/hack/ci)
   * [build.yaml](files/building_vaultpki_pkg/hack/ci/build.yaml)
   * [target.txt](files/building_vaultpki_pkg/hack/ci/target.txt)
   * [version.txt](files/building_vaultpki_pkg/hack/ci/version.txt)
 * [README.md](files/building_vaultpki_pkg/README.md)

## Authors

* **Smruti Soumitra Khuntia** - *Initial work*

## Acknowledgments

* etc
