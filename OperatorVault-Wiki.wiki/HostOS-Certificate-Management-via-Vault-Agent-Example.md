
## Overview:

> _For HostOS, certificates are renewed each time to retrieve certificates on demand whenever the service has been stopped and restarted. This way, there is zero downtime. 
For demonstration purposes, please refer to this [HostOS example file](https://github.ibm.com/cloudlab/hostos-config-payloads/blob/master/resource/vagent/templ.conf) screenshot shown below._

<details>
<summary>HostOS Fabcon Example</summary>

![HostOS Fabcon Example Part 1](https://github.ibm.com/gensec/OperatorVault-Wiki/blob/master/assets/HostOS%20Fabcon%20Example.png)
![HostOS Fabcon Example Part 2](https://github.ibm.com/gensec/OperatorVault-Wiki/blob/master/assets/HostOS%20Fabcon%20Example%20part%202.png)


Breakdown of fields:

> systemctl stop vagentx<p>
> systemctl start vagentx<p>
> manipulate TTL to manage certificate's expiration</p>

<p>&nbsp;</p>

* destination - location of certificate

* domain - service account which it generates

* hostname - machine

* fqdn - fully qualified domain name 

* san - alias which cert can be accessed through (always access via localhost)

* with secret - details of what the cert generates 

<p>&nbsp;</p>

_[Note: In this case, certificates are not used as with Kubernetes; only bundles are used (i.e. cert-bundle.pem), but they are similar as in the case of intermediary.]_

</details>


<p>&nbsp;</p>
<p>&nbsp;</p>

## Possible Certificate Rotation Scenarios:

> _On account of trial and error, we may need to raise successful and failing certification rotation situations, such as the following possible scenarios below:_


<details>
<summary>1. Error cases arising despite having a good bundle and key injected into vault agent:</summary>
<p>
</p>

* Error Case A - certificate and key do not match the bundle/cert (mismatch)<p>
* Error Case B - certificate is in the wrong format<p>
* Error Case C - certificate provided has expired<p>
* Error Case D - you are getting the same certificate (bug found)<p>
* Error Case E - certificate is valid but is rejected by remote servers</p>

</details>


<details>
<summary>2. Error cases arising due to the certificate expiration being shorter than the present certificate expiration date</summary>
</details>



<details>
<summary>3. Error cases arising due to certificate denial</summary>
</details>



<p>&nbsp;</p>


***


_[Return to Razee ConfigMap](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Razee-ConfigMap)._


