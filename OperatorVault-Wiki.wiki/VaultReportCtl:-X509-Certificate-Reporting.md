[**VaultReportCtl**](https://github.ibm.com/iaas/vaultreportctl) is a tool for generating various types of reports for X509 certificates stored in Vault.

**Notes**
- Should be run daily
- Should be run as user with read-only access to Secrets (confined to the nextgen namespace only)
- Should only be run by the 'vault' user
  - Should not be run from within a specific user's home directory

**Report output**
- Generates a text file containing list of expired certificates
