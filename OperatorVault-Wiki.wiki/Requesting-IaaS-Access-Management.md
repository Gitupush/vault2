### Before you set up your vault environment properly, you will need access to the following IaaS Management groups for _Shellng_ access. This is to log into shellng servers across Americas, EU, East Asia, and QZ2 datacenters. Please follow the steps below:

> _**PRE-REQ:**_<br>
> _Request for a Softlayer account (IaaS Access Management). This is initiated by your Manager._

1. Go to [IBM AccessHub](https://ibm-support.saviyntcloud.com/ECMv6/request/requestHome)

1. Click on ```Request New Access``` 

1. In the search bar, type in "IaaS Access Management" and click on ```Request New Account``` when you hover over the group name.

1. Click on the blue URL: ```NextGen AccessHub URL``` 

1. If you already have an existing Iaas Access Management account, it will appear. Click on the ```Modify``` button on the bottom right-hand corner.

1. **Add the following GROUPS below** by clicking on ```Add``` : 

<br>


|  GROUPS TO ADD         |                        |
|:-----------------:     |:----------------------:| 
| au-syd-shellng      | au-syd-shellngqztwo |
| br-sao-shellng        | br-sao-shellngqztwo  |
| ca-tor-shellng       | ca-tor-shellngqztwo  |
| eu-de-shellng         | eu-de-shellngqztwo    |
| eu-fr2-shellng          | eu-fr2-shellngzqtwo     |
| eu-gb-shellng         | eu-gb-shellngqztwo |
| es-mad-shellng         | es-mad-shellngqztwo |
| jp-osa-shellng         | jp-osa-shellngqztwo     |
| jp-tok-shellng         | jp-tok-shellngqztwo    |
| SECOPT                 | NG-SECOPT              |
| ngvault-americas-deploy | ngvault-easia-deploy |
| ngvault-eu-deploy | ngvault-qz2-deploy |
| softlayer-shellng | softlayer-shellngqztwo |
| us-east-shellng  | us-east-shellngqztwo  |
| us-south-shellng | us-south-shellngqztwo |
| fabng-feddev-ucnat | - |

8. Click ```Done```


<br>



9. Copy and paste the Business Justification language below and click ```Review and Submit``` 

> **Sample "Business Justification" message 2:** 
_I am raising access for the jumphosts. As part of VPC security and operations team we need to support vault operations across requested servers. Our responsibility is to maintain the control to vault across multiple datacenters based in NextGen VPC. Therefore, I kindly request you to grant access to the selected jumphosts._ 