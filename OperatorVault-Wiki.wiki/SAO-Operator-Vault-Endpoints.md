## SAO MZR
> SAO is part of the **Americas** georegion using the [Americas Root and Intermediary CA](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/DAL-Operator-Vault-Endpoints#americas-root-and-intermediary-ca-certificates)

### Vault Nodes
DC | RIAS VIP | Loopback | Management | GenCTL VIP
--- | --- | --- | --- | --- 
SAO01 | 10.203.79.27 | 10.12.184.14 | 192.168.151.157 | 192.168.150.219
SAO04 | 10.202.223.27 | 10.12.67.14 | 192.168.83.157 | 192.168.84.219
SAO05 | 10.202.255.27 | 10.12.92.14 | 192.168.61.157 | 192.168.60.219

---

<details>
<summary><b>Consul Nodes</b></summary>


DC | Hostname | Node # | RIAS/MSS | Loopback | GenCTL/Mgt 
--- |  --- | :---: | --- | --- | ---
SAO01 | sao1-qz1-sr2-rk151-s16 | 1 | 10.203.79.16 | 10.12.184.16 | 192.168.151.161 
SAO01 | sao1-qz1-sr2-rk151-s17 | 2 | 10.203.79.17 | No route to host | No route to host
SAO04 | sao2-qz1-sr1-rk083-s16 | 1 | 10.202.223.16 | 10.12.67.16 | 192.168.83.161
SAO04 | sao2-qz1-sr1-rk083-s17 | 2 | 10.202.223.17 | No route to host | No route to host
SAO05 | sao3-qz1-sr1-rk061-s16 | 1 | 10.202.255.16 | 10.12.92.16 | 192.168.61.161  
SAO05 | sao3-qz1-sr1-rk061-s17 | 2 | 10.202.255.17 | 10.12.92.17 | 192.168.61.163    


</details>

