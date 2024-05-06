## MAD MZR


> MAD is part of the **EU** georegion and uses the [EU Root and Intermediary CA](LON-Operator-Vault-Endpoints#EU-Root-and-Intermediary-CA-Certificates)

### Vault Nodes
DC | RIAS VIP | Loopback | Management | GenCTL VIP
--- | --- | --- | --- | ---
MAD02 | 10.203.111.27 | 10.0.145.11 | 192.168.60.189 | 192.168.59.219
MAD04 | 10.203.127.27 | 10.22.147.11 | 192.168.48.189 | 192.168.47.219
MAD05 | 10.203.143.27 | 10.22.197.11 | 192.168.60.189 | 192.168.59.219

---


<details>
<summary><b>Consul Nodes</b></summary>


DC | Hostname | Hostname Shortcut | Node # | RIAS/MSS | Loopback | GenCTL/Mgt 
--- |  --- | --- | :---: | --- | --- | ---
MAD02 | mad1-qz1-sr1-rk060-s34 | mad02-consul1 | 1 | 10.203.111.16 | 10.0.145.13 | 192.168.60.197
MAD02 | mad1-qz1-sr1-rk060-s36 | mad02-consul2 | 2 | 10.203.111.17 | 10.0.145.14 | 192.168.60.201
MAD04 | mad2-qz1-sr1-rk048-s34  | mad04-consul1 | 1 | 10.203.127.16 | 10.22.147.13 | 192.168.48.197
MAD04 | mad2-qz1-sr1-rk048-s36  | mad04-consul2 | 2 | 10.203.127.17 | 10.22.147.14 | 192.168.48.201
MAD05 | mad3-qz1-sr1-rk060-s34  | mad05-consul1 | 1 | 10.203.143.16 | 10.22.197.13 | 192.168.60.197
MAD05 | mad3-qz1-sr1-rk060-s36  | mad05-consul2 | 2 | 10.203.143.17 | 10.22.197.14 | 192.168.60.201


</details>
