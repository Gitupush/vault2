# Submit a Production/Staging Vault Secret Change Request





***
&nbsp;

## !!! <b>ATTENTION</b> !!!
1. YOU MUST USE THE ***CORRECT TEMPLATE*** (or else you'll need to cancel and recreate them).<n>
1. ALL PROD/STAGING CRS REQUIRE ***VP APPROVAL*** in the comments BEFORE they are implemented by the Vault team.
1. ***CHANGES CANNOT BE COPIED OVER!***
1. All service teams are accountable for ensuring that after a Secret is changed, the appropriate verification steps are included either in the SNOW CR or as part of the Secret's script.

&nbsp;
***


**Prerequisite:**<br>

<details>
<summary>How to get access to create Secret Rotation Change Requests (for Genctl)</summary>

Once you have access to create a Change Request in general, you need to request access to the IaaS Vault Certs Rotation template in order to follow the steps in How to Submit a Production or Staging Vault Secret Change Request

Request access to is-ng-vault-requestors by contacting "_Jennica Kwak_" (Slack: _jennicakwak_) directly and asking to be added to that group. This is a "non-ticketing" group (so a SNOW ticket can not be created against it) and is required to see the secret change request template.<br>

</details>

***


!!! <b><i>PLEASE FOLLOW THE INSTRUCTIONS CAREFULLY</i></b> !!!
<br>

<details>
<summary>Find the correct template</summary>

1. Login to [IBM Watson ServiceNow](https://watson.service-now.com)<br>  

1. From the top menu bar, click "**All**" and scroll down in the left-hand sidebar and click:<br> 
**_Change -> <u>Global Change Calendar</u> -> Standard Change -> Standard Change Catalog_**<br>  
![null](https://github.ibm.com/gensec/OperatorVault-Public/wiki/files/snow_images/snow-leftsidebar-create-change-request.png)<br>

1. The following screen will list all "Standard Changes" templates. From the top right, search for '**vault**'
![null](https://github.ibm.com/gensec/OperatorVault-Wiki/blob/master/assets/vault%20search.png)<br>
 
1. You should now see a list of Vault Standard Change templates. * **Select "<u>IaaS Vault Secret Request</u>" template** *
![null](https://github.ibm.com/gensec/OperatorVault-Wiki/blob/master/assets/IaaS%20Vault%20Secret%20Request.png)<br>

</details>



<details>
<summary>Choose your task-based template</summary>

1. Scroll down to the bottom of the template, and click the <i>three dots</i> button on the bottom right corner of the page ![null](https://github.ibm.com/gensec/OperatorVault-Wiki/blob/master/assets/Three%20Dots%20for%20CR%20Process.png)<br>

1. Choose the template appropriate to your task's needs:<br>
> * If it's for a CERT ROTATION, choose "<u>IaaS Vault Cert Rotation</u>"<br> 
> * If it's for a SECRET CHANGE, choose "<u>IaaS Secret Request</u>"
![null](https://github.ibm.com/gensec/OperatorVault-Wiki/blob/master/assets/Templates%20based%20on%20task.png)<br>
 
_NOTE a: If you aren't able to see the template(s), send a Slack message to Jennica Kwak for access to them._<br>

_NOTE b: Upon gaining access from Jennica Kwak, if you still can't see the template(s) listed at the bottom of the screen, please check that the template bar is toggled ON by clicking the button with three dots in the upper right-hand corner._<br>

</details>


<details>
<summary>Fill in the template</summary>

<br> 

1. Select your desired Vault template and once the page refreshes with updated fields, fill in the following:   
> * Location (_see below for WDC-Staging instructions_)
> * Explanation of Impact During Change Implementation
> * Purpose/Goal
> * Description & Plan
> * Backout plan
> * Schedule Planned Start/End Dates

_Note: The "Deployment Readiness Check" should already be checked._<br><br>

>  **WDC-STAGING requests:**<br>
>  _Please enter in the following fields for "Location":_
> > * Location: _Washington DC Region_
> > * Service Environment: _Pre-prod_
> > * Service Environment Detail: _Staging_<br>


> TIPS for filling in:<br>
> * **LOCATION** - Select the _Environment_ by clicking the magnifying glass  
![null](https://github.ibm.com/gensec/OperatorVault-Public/wiki/files/snow_images/specifying_the_region.png)  
 A pop-up window displays. For the "Global Catalog Environment Type" column enter **IBMCLOUD_REGION** and hit return to get a list of all regions and choose the appropriate region for the change  
![null](https://github.ibm.com/gensec/OperatorVault-Public/wiki/files/snow_images/listing_ibmcloud_regions.png)<br>
_FYI: DAL-STAGING is "IBM Yellow Staging 1 (YS1) STAGING"_
> * **SCHEDULE** - DO NOT set the Schedule the "Planned Start Date" and "Planned End Date" for longer than 24 hours  
![null](https://github.ibm.com/gensec/OperatorVault-Public/wiki/files/snow_images/required_field-dates.png)<br>
> * **ASSIGNED TO** - Assign the CR to _'James Whiteley'_

2. Click the 'Submit' button at the top right of the page or at the bottom left of the page under the scheduled dates section<br>
 
3. Upon clicking "Submit", your CR should be AUTO-APPROVED. 

</details>
