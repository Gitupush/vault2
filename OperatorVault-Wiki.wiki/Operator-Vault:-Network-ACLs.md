### Vault Cluster Communication Ports and Reference Diagram  
---
### VPC NG Deployers
Source | Destination | Port | Protocol | Direction | Purpose
--- | --- | :---: | :---: | --- | ---
NG Deployers | Vault Servers | 8200 | TCP | Outbound | Allow deployers to communicate with any available Vault node

---

### HPCS-HSM
Source | Destination | Port | Protocol | Direction | Purpose
--- | --- | :---: | :---: | --- | ---
Vault Servers | HPCS Endpoints | 9471 | TCP | Outbound | Enable HSM-service in support of FSBOA Financial Controls    

> IBM HPCS Endpoints: 166.9.0.0/16

---
### Vault Cross-Regional Replication
Source | Destination | Port | Protocol | Direction | Purpose
--- | --- | :---: | :---: | --- | ---
Any | Vault Servers | 8200 | TCP | Inbound | Allows communication from Vault clients
Vault Servers | Vault Servers | 8201 | TCP | Bidirectional | Replication traffic, HTTP/API request forwarding
*Consul Clients | Consul Clients | 7301 | TCP | Bidirectional | LAN gossip communication
*Consul Clients | Consul Clients | 7301 | UDP | Bidirectional | LAN gossip communication
*Consul Clients | Consul Servers | 7300 | TCP | Inbound | Consul RPC communication - currently only Vault servers also act as Consul clients
*Consul Servers | Consul Servers | 7300 | TCP | Inbound | Consul RPC communication
> * Not required at this time
---
![pic](https://www.datocms-assets.com/2885/1522735223-image_1.png?fm=png)
---
### References
* [Hashicorp's Vault Reference Architecture](https://learn.hashicorp.com/vault/operations/ops-reference-architecture#network-connectivity-details)