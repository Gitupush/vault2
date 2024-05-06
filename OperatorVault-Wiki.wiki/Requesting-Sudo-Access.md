### To request for sudo access, please follow the steps below to create an SRE JIRA ticket:

***


**1. Open JIRA and click on "Create".**

**2. Fill in the appropriate fields:**
* _Project_ - SRE (NexGen) SRE
* _Issue Type_ - SRE Task
* _Summary_ - Not in sudo group for [specify vault node(s)]
* _Description_ - 

```
Username: jkwak

As a vault admin, I need sudo access to perform vault operational tasks and duties. However, I don't have sudo access for [specify vault/consul node and IP address].

For example, I get this message when trying to sudo:
$ sudo su -vault

[sudo] password for jkwak: 

jkwak is not in the sudoers file.  This incident will be reported.
```


(_Example SRE ticket requesting sudo access: [SRE-4635](https://jiracloud.swg.usma.ibm.com:8443/browse/SRE-4635)_)


**3. Assign it to Misty Brumfield and Slack her.**