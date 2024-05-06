Recently with vault enabled for TLS only, we have seen complaints regarding deployment tools 

# Typical Error Shared


Hello,

I am seeing the below error while deploying kube 5, please take a look(the same was working until yesterday)
curl: (35) error:1407742E:SSL routines:SSL23_GET_SERVER_HELLO:tlsv1 alert protocol version
2021/11/19 14:14:59 [ERROR] Unable to read IBMCOS Secrets keys from Vault, status_code: 8960
2021/11/19 14:14:59 [ERROR] Error running kubedeploy: Error: Unable to read secret from vault.
Failed deploying add-on

real    0m52.640s
user    0m0.077s
sys     0m0.044s
### ERROR ### Deployment failed.
### ERROR ### Component that failed: kube_deploy
### ERROR ### Command that failed: kube-addon-release deployment

=====================================================================================
Deployment of the following components and packages to DAL10-mzone7123 was UNSUCCESSFUL:
    kube
        etcd-base-release              5.6.0_20210820T154325Z_67f0641   successful
        kube-base-release              5.6.0_20210823T203732Z_d0b8ce0   successful
        kube-define-release            5.6.0_20210826T155856Z_b1c1b0d   successful
        kube-addon-release             5.6.0_20210820T154615Z_afac7df   F

## What to Tell Customer

* Vault only works with deploy tools that are enabled for TLS 1.3.
* The latest version of MDS, for example. 
* If using DDT tool it is the responsibility of the person using that tool to make sure that tool is using TLS 1.3. Tag Sam Lee in the thread or ticket and encourage the customer to work with them.