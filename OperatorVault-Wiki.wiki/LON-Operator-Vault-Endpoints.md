## LON MZR


### Vault Nodes
DC | RIAS VIP | Loopback | Management | GenCTL VIP
--- | --- | --- | --- | ---
LON04 | 10.201.47.39 | 10.249.41.214 | 192.168.103.161 | 192.168.105.219
LON05 | 10.201.63.39 | 10.249.46.214 | 192.168.15.161 | 192.168.13.219
LON06 | 10.201.79.39 | 10.249.51.214 | 192.168.11.161 | 192.168.13.219

---

<details>
<summary><b>Consul Nodes</b></summary>


DC | Hostname | Hostname Shortcut | Node # | RIAS/MSS | Loopback | GenCTL/Mgt 
--- |  --- | --- | :---: | --- | --- | ---
LON04 | lon1-qz1-sr4-rk103-s16 | lon04-consul1 | 1 | 10.201.47.16 | 10.249.41.215 | 192.168.103.163 
LON04 | lon1-qz1-sr4-rk103-s17 | lon04-consul2 | 2 | 10.201.47.17 | 10.249.41.216 | 192.168.103.165 
LON05 | lon2-qz1-sr2-rk015-s16 | lon05-consul1 | 1 | 10.201.63.16 | 10.249.46.215 | 192.168.15.163
LON05 | lon2-qz1-sr2-rk015-s17 | lon05-consul2 | 2 | 10.201.63.17 | 10.249.46.216 | 192.168.15.165
LON06 | lon3-qz1-sr2-rk011-s16 | lon06-consul1 | 1 | 10.201.79.16 | 10.249.51.215 | 192.168.11.163    
LON06 | lon3-qz1-sr2-rk011-s17 | lon06-consul2 | 2 | 10.201.79.17 | 10.249.51.216 | 192.168.11.165 


</details>






---

### EU Root and Intermediate CA Certificates
> [EU Intermediate CA PEM](https://github.ibm.com/gensec/OperatorVault-Public/wiki/files/certs/eu-intermediate-ca.pem)  
> [EU Root CA PEM](https://github.ibm.com/gensec/OperatorVault-Public/wiki/files/certs/eu-root-ca.pem)  
> [EU Combo CA PEM](https://github.ibm.com/gensec/OperatorVault-Public/wiki/files/certs/eu-ca.pem)  
