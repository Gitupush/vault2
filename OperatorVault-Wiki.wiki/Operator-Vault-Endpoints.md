VPC NextGen Vault services are either Multi-MZR Vault Clusters (defined below) or Standalone instances. The following Endpoint listing covers all Vault services: standalone/multicluster and production/staging/integration/development.

## Table of Contents
- [Georegions](#georegions)
- [MZR Endpoints](#mzr-endpoints)

---

## Georegions
A Georegion is a grouping of Vault MZR clusters loosely based on their geographic location. Within a georegion, Secrets are updated in near real-time between the georegion members.
Georegion members share the following:
  - PKI Root and Intermediary CA  
       > Example: WDC uses the same PKI certificates as DAL
  - Authentication credentials
       > Example: approles and certificates are the same
  - Secrets
       > Example: WDC includes the DAL Secrets within its structure and vice versa

---

## MZR Endpoints
### Americas Georegion
- [DAL](../wiki/DAL-Operator-Vault-Endpoints)  (Primary)
- [WDC](../wiki/WDC-Operator-Vault-Endpoints)  
- [SAO](../wiki/SAO-Operator-Vault-Endpoints)  
- [TOR](../wiki/TOR-Operator-Vault-Endpoints) 

### Europe Georegion
- [LON](../wiki/LON-Operator-Vault-Endpoints)  (Primary)
- [FRA](../wiki/FRA-Operator-Vault-Endpoints)  
- [MAD](../wiki/MAD-Operator-Vault-Endpoints)  
- [PAR](../wiki/PAR-Operator-Vault-Endpoints)  

### East Asia Georegion
- [TOK](../wiki/TOK-Operator-Vault-Endpoints)  (Primary)
- [SYD](../wiki/SYD-Operator-Vault-Endpoints)  
- [OSA](../wiki/OSA-Operator-Vault-Endpoints)  

### **Integration and Development**
- [DAL QZ2](../wiki/QZ2-Operator-Vault-Endpoints)
- [POK](../wiki/POK-Operator-Vault-Endpoint)   

---

### Each Vault cluster's Certificate Expiration Date
|MZR|Expiration
|:---|---
|*DAL*|`Oct 03 10:33:48 2024 GMT`
|*FRA*|`Jan 31 15:42:28 2024 GMT`
|*LON*|`Oct 18 16:25:14 2023 GMT`
|*MAD*|`Mar 01 10:37:50 2024 GMT`
|*OSA*|`Oct 16 13:43:33 2024 GMT`
|*PAR*|`Nov 03 01:42:51 2023 GMT`
|*POK*|`Jul 30 18:01:48 2024 GMT`
|*QZ2*|`Oct 16 02:01:43 2024 GMT`
|*SAO*|`Apr 18 03:30:13 2024 GMT`
|*SYD*|`Jul 02 13:26:08 2024 GMT`
|*TOK*|`Jun 03 15:16:25 2024 GMT`
|*TOR*|`Jan 14 23:38:35 2024 GMT`
|*WDC*|`Oct 03 10:09:37 2024 GMT`
