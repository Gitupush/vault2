## WDC MZR
> WDC is part of the **Americas** georegion using the [Americas Root and Intermediary CA](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/DAL-Operator-Vault-Endpoints#americas-root-and-intermediary-ca-certificates)

### Vault Nodes
DC | RIAS VIP | Loopback | Management | GenCTL VIP
--- | --- | --- | ---  | ---
WDC04 | 10.201.15.39| 10.249.26.214 | 192.168.208.161 | 192.168.206.219
WDC06 | 10.200.175.39 | 10.249.31.214 | 192.168.137.161 | 192.168.147.219
WDC07 | 10.200.191.39 | 10.249.36.214 | 192.168.101.161 | 192.168.103.219

---

<details>
<summary><b>Consul Nodes</b></summary>

DC | Hostname | Hostname Shortcut | Node # | RIAS/MSS | Loopback | GenCTL/Mgt 
--- |  --- | --- | :---: | --- | --- | ---
WDC04 | wdc04-consul1 | wdc1-qz1-sr7-rk208-s16 | 1 | 10.201.15.16 | 10.249.26.215 | 192.168.208.163  
WDC04 | wdc04-consul2 | wdc1-qz1-sr7-rk208-s17 | 2 | 10.201.15.17 | 10.249.26.216 | 192.168.208.165  
WDC06 | wdc06-consul1 | wdc2-qz1-sr2-rk137-s16 | 1 | 10.200.175.16 | 10.249.31.215 | 192.168.137.163
WDC06 | wdc06-consul2 | wdc2-qz1-sr2-rk137-s17 | 2 | 10.200.175.17 | 10.249.31.216 | 192.168.137.165  
WDC07 | wdc07-consul1 | wdc3-qz1-sr2-rk101-s16 | 1 | 10.200.191.16 | 10.249.36.215 | 192.168.101.163  
WDC07 | wdc07-consul2 | wdc3-qz1-sr2-rk101-s17 | 2 | 10.200.191.17 | 10.249.36.216 | 192.168.101.165    


</details>
