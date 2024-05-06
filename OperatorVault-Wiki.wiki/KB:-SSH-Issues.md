### If you come across issues logging into the bastion or ssh-ing into the nodes, please see the following past examples below for possible solutions first. However, if you are still in need of assistance, please raise an SRE ticket and/or reach out in the <b><i>#sl-fabric-sre</i></b> or <b><i>#genesis-ops-help</i></b> Slack channel for help.

<br>

***

<br>

<details>
<summary><b>BASTION LOGIN ERROR: 'unable to determine proxy type'</b></summary>

<i><u>Example:</u></i>

```ruby
jennicakwak@Jennicas-MacBook-Pro ~ % tsh -l jkwak --proxy=ca-tor.pylon.softlayer.local ssh jkwak@shellngtor0401.softlayer.local

			WARNING
			Detected potentially incompatible client and server versions.
			Minimum client version supported by the server is 11.0.0 but you are using 8.1.1.
			Please upgrade tsh to 11.0.0 or newer or use the --skip-version-check flag to bypass this check.
			Future versions of tsh will fail when incompatible versions are detected.
			If browser window does not open automatically, open it by clicking on the link:
 http://127.0.0.1:53797/87b2656d-ae4b-4aa8-aae2-b46d3f17c03f
ERROR: unable to determine proxy type 
```

<i><u>Solution:</u></i>
Upgrade your ```tsh-client``` from the [teleport link](https://goteleport.com/download/) drop-down list and download the tsh-client according to your machine type).

(NOTE: to check your current version in use, execute the command ```tsh version```)
</details>

<p>&nbsp;</p>

<details>
<summary><b>SSH LOGIN ERROR: 'permission denied, please try again'</b></summary>

<i><u>Example:</u></i>

```ruby
[jgovindan@shellnglon0401 ~]$ ssh 10.201.47.15
Authorized uses only. All activity may be monitored and reported. If you are not authorized to access this system you must disconnect immediately.
jgovindan@10.201.47.15's password: 
Permission denied, please try again.
jgovindan@10.201.47.15's password:
```
<i><u>Solution:</u></i>
Create an <i>SRE NexGen</i> type [Jira ticket](https://jiracloud.swg.usma.ibm.com:8443/secure/Dashboard.jspa):
<br>
* Project: "SRE - NexGen (SRE)"
* Issue Type: "SRE Task"

[Example SRE Jira (SRE-7339)](https://jiracloud.swg.usma.ibm.com:8443/browse/SRE-7339)

</details>

<p>&nbsp;</p>
