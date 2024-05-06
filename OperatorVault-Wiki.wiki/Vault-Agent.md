> Action Item: Does RM have an existing process for deploying vulnerability fixes required by compliance frameworks? If not, we need to develop a vulnerability mitigation process in collaboration with the RM team to ensure all vulnerabilities follow the same process

* [Troubleshooting](#Troubleshooting)
* [Upgrade Process](Upgrading-Vault-Agent)
* [Vault Agent Dashboards (how to use this dashboard?)](https://9.114.87.41:8060/rds?mode=last-24&tab=prod)

---

### Troubleshooting

<details>
<summary>Troubleshooting Vault Agent Issues</summary>

```
How many nodes do you have in your mzone?
How many pods per node? (Problems can arise if the number of pods is above 100 on a single node. (110 is k8s max)
Have you successfully accessed vault from a node with the failing pods?
If not, have you exec'd into a pod and tested connectivity to vault?

kubectl -c <container> -n <genctl|rias> logs <pod>
kublectl get pods -A | grep vault
kubectl describe pod/vault-agent-injector-97f5c4559-5f976
kubectl -c <container> vault-agent-init

from one of the broken pods:
kubectl -n genctl exec <pod identified> -- /bin/sh -c "timeout 4 nc -nvz <vault ip address> 8200"

Find pods with multiple containers (vault-agent may be one of the containers)
kubectl get pods -n genctl |grep -E '/2|/3'

Check if vault-agent is a container (for the example I use the pod acadia-agent-qscwg)
kubectl -n genctl describe pod acadia-agent-qscwg

To get only the container names
kubectl -n genctl get pod acadia-agent-qscwg -o json |jq -rc '.spec.containers[].name'

To get the logs from the container in a pod
kubectl -c vault-agent -n genctl logs acadia-agent-qscwg
```
</details>
