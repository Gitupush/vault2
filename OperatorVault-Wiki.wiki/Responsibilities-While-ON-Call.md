CRITICAL: If an issue is noticed in production or blocking ipops from a production deploy, immediately open an urgent ticket with HashiCor and ask them to set up a zoom call. Link is here: https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Requesting-Support

Remember that when we are paged, it is for a high severity issue. The most important thing to do is to let ipops know that you are aware and either working the issue or trying to get help. Communication as soon as possible in ipops-production or ipops-staging is key.

Being on call for vault is something key for our team. Remember, when you are on call, you dont' always have to know the answer, but when you get paged or see something odd in #operator-vault-general, you have to help get to the answer. And there is always HashiCorp support as a fallback.

If you discover an item to be added to this runbook when you are on call, please do so. Or, If you discover that we need to document a runbook we dont' have documented, open an SCED issue under this epic to track that:
https://jiracloud.swg.usma.ibm.com:8443/browse/SCED-40452



## If Paged

Page outs typically  come from ipops and they are considered critical. They typically tell you in the issue what issue they are seeing and where (staging, for example). This is usually tied to  a deployment.

* Navigate to the PagerDuty incident and acknowledge it within 15 minutes.
* If a staging issue, check in #ipops-staging and ask where your help is needed immediately in that channel. Say you are from the vault team.
* If a production issue, check in #ipops-production and ask where your help is needed immediately. Say you are from the vault team.
* If unsure whether prod or staging ask in ipops-production where your help is needed. Let them know you are from the vault team.
* Work with ipips to understand the issue. It may not be related to vault at all if vault can't be reached. For example, a 403 error means we have  connection to vault and something else is going on.
* If there is doubt on whether we can help with the page, let ipops know that and that you are working on finding and post in vault-admin with an @here to help. If you get no response after 10 minutes, contact your manager. Use the phone if after hours or if they do not respond on slack immediately.
* If the incident is critical to production and you aren't sure what to do or can't find one of our team who does, immediately open an urgent ticket with HashiCorp and either get them to join a webex if one is already running or get them to start a zoom: 
https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Requesting-Support

## Check operator-vault channel

While on call need to monitor this  channel every few hours for issues. Twice a day if on the week end.

* If ipops reports an issue with production such as  "vault sealed in production", make sure they open N SCM ticket and page us. if no one from our team can help within 15 minutes, page out HashiCorp to help as already described. IN genral if there is an issue with vault and production and you aren't sure what to do, page HashiCorp. 
* If general questions like "how do I open a CR", then point folks to the  pinned items. These are not critical to answer on the week ends.