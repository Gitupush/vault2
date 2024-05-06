

## Create Dockerfile 
``` 
FROM ubuntu

RUN apt-get update

RUN apt-get install -y git

RUN mkdir /root/.ssh/

ADD repo-key /root/.ssh/id_rsa
ADD repo-key.pub /root/.ssh/id_ras.pub


RUN echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

RUN git clone git@github.ibm.com:gensec/OperatorVault-Wiki.git
RUN mkdir -p files/CA/

RUN touch files/CA/ca.crt
RUN cat OperatorVault-Wiki.wiki/files/certs/*.*  >> files/CA/ca.crt 

ADD vault /usr/bin/vault
```

## 2. Host Machine Preparation
1. Copy the above Dockerfile to 'docker build directory' 
1. Download respective vault binary and save it in 'docker build directory'

## 3. Build Container Image

1. Execute `docker build -t vault_pki_image:1 .` command to generate contianer image 

```
# docker build -t vault_pki_image:1 .
Sending build context to Docker daemon  279.9MB
Step 1/11 : FROM ubuntu
 ---> f643c72bc252
Step 2/11 : RUN apt-get update
 ---> Using cache
 ---> 96aab2377f43
Step 3/11 : RUN apt-get install -y git
 ---> Using cache
 ---> 64de06c2a0df
Step 4/11 : RUN mkdir /root/.ssh/
 ---> Using cache
 ---> c0a5267a6666
Step 5/11 : ADD repo-key /root/.ssh/id_rsa
 ---> Using cache
 ---> 7167c6b053d3
Step 6/11 : RUN echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config
 ---> Using cache
 ---> 792a81f6200e
Step 7/11 : RUN git clone git@github.ibm.com:gensec/OperatorVault-Wiki.wiki.git
 ---> Using cache
 ---> 4719ba79859a
Step 8/11 : RUN mkdir -p files/CA/
 ---> Using cache
 ---> 5803d059e18b
Step 9/11 : RUN touch files/CA/ca.crt
 ---> Using cache
 ---> f2fc1eecd20e
Step 10/11 : RUN cat OperatorVault-Wiki.wiki/files/certs/*.*  >> files/CA/ca.crt
 ---> Using cache
 ---> 87fb94460af2
Step 11/11 : ADD vault /usr/bin/vault
 ---> 9f882d898c68
Successfully built 9f882d898c68
Successfully tagged vault_pki_image:1
```

```
# docker images
REPOSITORY              TAG       IMAGE ID       CREATED          SIZE
vault_pki_image         1         9f882d898c68   41 seconds ago   390MB
```

## 4. Pod with Init Container

PodVaultPki.yaml

```
apiVersion: v1
kind: Pod
metadata:
  name: vault-pki-pod
spec:
  containers:
  - name: vault-container
    image: vault_pki_image:1
    command: ["/bin/sh","-c"]
    args: ["cat /workdir/ca.crt >> /etc/ssl/certs/ca-certificates.crt && sleep 40000"]
    volumeMounts:
    - mountPath: /workdir
      name: workdir
    imagePullPolicy: IfNotPresent
    #imagePullPolicy: Never
  initContainers:
  - name: init-container
    image: vault_pki_image:1
    command: ['sh', '-c', 'mkdir /workdir; cp files/CA/ca.crt /workdir/ca.crt']
    volumeMounts:
    - mountPath: /workdir
      name: workdir
    imagePullPolicy: IfNotPresent
  volumes:
  - name: workdir
    emptyDir: {}
```

## 5. Creating POD 

```
$ kubectl apply -f pod_vault_pki.yaml pod/vault-pki-pod created
```

```

administrators-MacBook-Pro:issue_336 admin$ kubectl get pods
NAME            READY   STATUS    RESTARTS   AGE
vault-pki-pod   1/1     Running   0          15s
```

## 6. Getting into POD
```
$  kubectl exec --stdin --tty vault-pki-pod -- /bin/bash
root@vault-pki-pod:/# 
```
## 7. Validating Vault Login

```
$ kubectl cp Thiru_POK.crt  vault-pki-pod:/root/Thiru_POK.crt
$ kubectl cp Thiru_POK.key  vault-pki-pod:/root/Thiru_POK.key
```

```
$ VAULT_ADDR="https://9.114.87.48:8200" vault login -method=cert -client-key=<client key> -client-cert=<client crt> 
Success! You are now authenticated. The token information displayed below
is already stored in the token helper. You do NOT need to run "vault login"
again. Future Vault requests will automatically use this token.

WARNING! The following warnings were returned from Vault:

  * TTL of "768h" exceeded the effective max_ttl of "4h"; TTL value is capped
  accordingly

Key                            Value
---                            -----
```