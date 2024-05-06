## FRA MZR


> FRA is part of the **EU** georegion and uses the [EU Root and Intermediary CA](LON-Operator-Vault-Endpoints#EU-Root-and-Intermediary-CA-Certificates)

### Vault Nodes
DC | RIAS VIP | Loopback | Management | GenCTL VIP
--- | --- | --- | --- | ---
FRA02 | 10.201.159.25 | 10.223.60.14 | 192.168.182.157 | 192.168.181.219 | TBA
FRA04 | 10.201.127.25 | 10.223.61.14 | 192.168.72.157 | 192.168.71.219 | TBA
FRA05 | 10.201.143.25 | 10.223.62.14 | 192.168.96.157 | 192.168.97.219 | TBA

---

<details>
<summary><b>Consul Nodes</b></summary>


DC | Hostname | Hostname Shortcut | Node # | RIAS/MSS | Loopback | GenCTL/Mgt 
--- |  --- | --- | :---: | --- | --- | ---
FRA02 | fra1-qz1-sr6-rk182-s16 | fra02-consul1 | 1 | 10.201.159.16 | 10.223.60.16 | 192.168.182.161
FRA02 | fra1-qz1-sr6-rk182-s17 | fra02-consul2 | 2 | 10.201.159.17 | 10.223.60.17 | 192.168.182.163 
FRA04 | fra2-qz1-sr2-rk072-s16 | fra04-consul1 | 1 | 10.201.127.16 | 10.223.61.16 | 192.168.72.161
FRA04 | fra2-qz1-sr2-rk072-s17 | fra04-consul2 | 2 | 10.201.127.17 | 10.223.61.17 | 192.168.72.163
FRA05 | fra3-qz1-sr2-rk096-s16 | fra05-consul1 | 1 | 10.201.143.16 | 10.223.62.16 | 192.168.96.161    
FRA05 | fra3-qz1-sr2-rk096-s17 | fra05-consul2 | 2 | 10.201.143.17 | 10.223.62.17 | 192.168.96.163 


</details>


