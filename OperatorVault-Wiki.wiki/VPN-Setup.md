
## - Cisco AnyConnect VPN -
Cisco AnyConnect Secure Mobility Client VPN allows an IBMer to connect to the IBM Network. Cisco AnyConnect is the legacy method to connect because it uses a half tunnel security layer. When computers communicate with each other, data is transferred through two types of streams--a down stream (download) and an up stream (upload). AnyConnect only encrypts one of the two stream, so there is a possibility of it being compromised. Global Protect VPN (GPVPN) is the newer way to connect. _(See topic below.)_

* You will need your IBM w3 credentials to connect, which you will receive during your first meeting with your Manager.

_**ATTN!!!** PLEASE DO NOT attempt to use these setup instructions if you have not met with your Manager and received these credentials yet!_

* Below are instructions in setting up your Cisco VPN for your device:
> * [LINUX VPN SETUP](https://ibm.enterprise.slack.com/files/U02KA9R6ZT2/F02TDJPV7HS/vpn_guide_for_linux.pdf?origin_team=T7QJJ1GHW&origin_channel=C02RUPN11FG)
> * [MAC OS VPN SETUP](https://ibm.enterprise.slack.com/files/U02KA9R6ZT2/F02T8C901PX/vpn_guide_for_mac.pdf?origin_team=T7QJJ1GHW&origin_channel=C02RUPN11FG)
> * [WINDOWS VPN SETUP](https://ibm.enterprise.slack.com/files/U02KA9R6ZT2/F02TBA2UYDQ/vpn_guide_for_windows.pdf?origin_team=T7QJJ1GHW&origin_channel=C02RUPN11FG)




## - Global Protect VPN (GPVPN) -
Global Protect VPN is another way to securely connect to the IBM Network. Unlike Cisco AnyConnect VPN, GPVPN is more secure because it uses a full tunnel security layer where both the down and up streams are encrypted. More importantly, GPVPNs allow you to connect to both Power9 networks (Cisco AnyConnect can only connect to Power9) and all Softlayer internal networks, such as Jira and Confluence.

* You will first need to set up a Softlayer username and password. Follow the instructions [HERE](https://ibm.enterprise.slack.com/files/WDSPXU0HM/F02U9UP0EFK/iaas_request_new_or_modify_access.pdf).

* When it has been fully processed (takes up to 2 days), follow the instructions to download and configure the GPVPN client [HERE](https://ibm.enterprise.slack.com/files/WDSPXU0HM/F02U9UP0EFK/iaas_request_new_or_modify_access.pdf). 

_**Note:** You can only connect to ONE VPN at a time._






## - GPVPN Troubleshooting -
If you come across "Authentication Failed" errors, please try the following:

(a) Resynchronize your YubiKey. 
> * Go to [this page](https://vip.symantec.com/otpCheck) and type in your YubiKey serial in this format: UBHEXXXXXXXXX (X=numbers on your YubiKey).
> * On the next screen, press on your YubiKey’s gold contact: it will type it out a token in the field.
> * If synchronized, try logging in again.


(b) Switch to another portal.
> * Check which portal you are using: "am1.gp.softlayer.com" or "am2.gp.softlayer.com"
> * To change portals, click on the three-stacked dashes and then "Setting"
> * If you only see one of the two portals listed, click on the + and add in the other.
> * Try connecting with the other portal now.

If you still encounter issues, contact #**sl-helpdesk** on Slack.