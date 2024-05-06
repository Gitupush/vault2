## DAL MZR


### Developers (Vault Endpoints)
DC | Genctl VIP | RIAS VIP | Loopback | Management
--- | --- | --- | --- | ---
DAL10 | ```192.168.115.219``` | ```10.200.95.104``` | ```10.249.21.3``` | - 
DAL12 | ```192.168.213.219``` | ```10.203.95.40``` | ```10.249.14.24``` | - 
DAL13 | ```192.168.172.219``` | ```10.200.143.104``` | ```10.249.6.250``` | - 

<details>
<summary><b>Consul Nodes</b></summary>

DC | Hostname | Hostname Shortcut | Node # | RIAS/MSS | Loopback | GenCTL/Mgt 
--- |  --- |  --- |:---: | --- | --- | ---
DAL10 | dal1-qz1-sr3-rk095-s15 | dal10-consul1 | 1 | 10.200.95.15 | 10.249.21.214 | 192.168.95.161  
DAL10 | dal1-qz1-sr3-rk095-s16 | dal10-consul2 | 2 | 10.200.95.16 | 10.249.21.215 | 192.168.95.163 
DAL12 | dal2-qz1-sr2-rk219-s15 | dal12-consul1 | 1 | 10.200.127.15 | 10.249.14.214 | 192.168.219.161   
DAL12 | dal2-qz1-sr2-rk219-s16 | dal12-consul2 | 2 | 10.200.127.16 | 10.249.14.215 | 192.168.219.163  
DAL13 | dal3-qz1-sr1-rk403-s15 | dal13-consul1 | 1 | 10.200.143.15 | 10.249.6.214 | 192.168.147.161 
DAL13 | dal3-qz1-sr1-rk403-s16 | dal13-consul2 | 2 | 10.200.143.16 | 10.249.6.215 | 192.168.147.163  


</details>



***


### Americas Root and Intermediate CA Certificates

> [Americas Intermediate PEM](https://github.ibm.com/gensec/OperatorVault-Public/wiki/files/certs/americas-intermediate-ca.pem)  
> [Americas Root CA PEM](https://github.ibm.com/gensec/OperatorVault-Public/wiki/files/certs/americas-root-ca.pem)  
> [Americas Combo CA PEM](https://github.ibm.com/gensec/OperatorVault-Public/wiki/files/certs/americas-ca.pem)  


---


<br>


<details>
<summary>CSRE (Vault/Consul Endpoints)</summary>

### CSRE (Vault/Consul Nodes)
DC | Vault Hostname | Vault | Consul 1 | Consul 2
--- | --- | --- | --- | ---
DAL10 | dal1-qz1-sr3-rk095-s17 | ```10.200.95.17``` | ```10.249.21.214``` | ```10.249.21.215```
DAL12 | dal2-qz1-sr2-rk219-s17 | ```10.200.127.17``` | ```10.249.14.214``` | ```10.249.14.215```
DAL13 | dal3-qz1-sr1-rk403-s17 | ```10.200.143.17``` | ```10.249.6.214``` | ```10.249.6.215``` 

</details>



<details>
<summary>Load Balancers</summary>

### Load Balancers
DC | Hostname | Load Balancer 
--- | --- | --- 
DAL10 | dal1-qz1-sr3-rk115-s46-lb01 | ```192.168.115.216``` 
DAL10 | dal1-qz1-sr3-rk113-s46-lb02 | ```192.168.113.220```
DAL12 | dal2-qz1-sr2-rk213-s46-lb01 | ```192.168.213.216``` 
DAL12 | dal2-qz1-sr2-rk214-s46-lb02 | ```192.168.214.220```
DAL13 | dal3-qz1-sr1-rk428-s45-lb01 | ```192.168.172.216```
DAL13 | dal3-qz1-sr1-rk431-s45-lb02 | ```192.168.175.220```

</details>



<br>
