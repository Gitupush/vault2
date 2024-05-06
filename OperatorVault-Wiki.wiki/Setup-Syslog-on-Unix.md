1. SSH to **Vault server or Consul server** of the environment

2. Login as a **super user**

3. Create a directory as **rsyslog** under /etc directory

4. Go to LogDNA instance on cloud.ibm.com created and open **‘install instructions’ **

5. Go to rsyslog and select **TCP+TLS** tab

6. Download **root certificate** and **22-logdna.conf** 

7. Copy the content of root certificate to **logdna-root-ca.crt**

8. Move the file 22-logdna.conf to /etc/rsyslog.d file

9. Install **rsyslog-gnutls** using your package manager

10. Restart rsyslog using sudo /etc/init.d/rsyslog restart



_Repeat steps 1-10 for other vault and consul servers._
_You should be able to see the audit log details in the LogDNA Dashboard._
_Go to 'View' and add a category as 'Vault'._



***
**Return to the main [LogDNA page](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/LogDNA).**