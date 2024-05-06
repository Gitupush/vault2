After you have set up your <code>vaultrptctl</code> following the steps mentioned in [Vaultrtpctl Tool Usage](https://confluence.swg.usma.ibm.com:8445/display/SSO/Vaultrtpctl+Tool+Usage) (or [these steps](https://github.ibm.com/iaas/vaultreportctl/blob/master/installers/macos/v2/README.md#installation-of-binary)), you can generate reports on expiring certificates.

***

**To create the report, run the 'vaultrptctl' with the following commands:**

> <code>vaultrptctl -m <mount_point> -p <vault_path></code>
> <br><code>Eg. vaultrptctl -m /genctl/ -p 'dal/qz2/'</code></br>

A '.csv' report file will be generated in same directory called:
> <code><region>_<env>_vault_cert_exp_<mount_point>_<generation_date_time>.csv</code>



_<br>Please refer to <code>vaultrptctl --help</code> for more options.</br>_