**After you have generated the reports for SCM tickets and CRs, you can crunch the numbers using the following steps below.**

_Note: You are analyzing metrics for the previous week of the generated reports._ 
(_See [Generate Vault Metrics Reports](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Generating-Vault-Metrics-Reports) to learn how to generate the reports._)

***

<details><summary>Jira (SCMs)</summary>

* <b>Total # of SCMs opened =</b> Section 1 + Section 3
* <b>Total # of SCMs closed =</b> Section 1 + Section 2
* <b>Total # of SCMs closed by US =</b> Section 1 US + Section 2 US
* <b>Total # of SCMs closed by IN =</b> Section 1 IN + Section 2 IN
* <b>Average Resolution Time =</b> See the given "Average" in Section 1 of "Business Days Consumed"

</details>


<details><summary>Change Requests (CRs)</summary>

* <b>Total # of CRs approved =</b> Click on the "Approved Date" column and the downward triangle filter button. Click "Ascending" or "Descending". Count the number of tickets that had been approved only during the specified week of analysis.

* <b>Total # of CRs closed =</b> Drag and count the number of cells labeled "Closed Successful" under the "Close code" column.

* <b>Total # of CRs closed by US =</b> Count the number of US team members' names under the "Closed by" column.

* <b>Total # of CRs closed by IN =</b> Count the number of IN team members' names under the "Closed by" column or simply subtract the 'Total number of CRs closed by US' from the 'Total number of CRs closed'.

* <b>Average time to complete in business days =</b> First, be sure to highlight the dates occurring in the specified week in the "Actual End" column. Then, drag those associated cells under the "Business Days Consumed" column to calculate the average time it took to complete within business days.

* <b>Average of days once completed =</b> First, be sure to highlight the dates occurring in the specified week in the "Actual End" column. Then, drag those associated cells under the "Days Gap" column.

* <b>Total # of CRs closed within a specific day of the week =</b> Under the "Actual End" column, filter the tickets that were closed on Monday, Tuesday, Wednesday, etc.


<i><b>Tip:</b> You can efficiently count the total number of cells you want by dragging the desired cells and looking at the bottom right corner.</i>

</details>





<details><summary>Top 5s</summary>

More to come (learning how to use the filter statement with this one on Jira)

</details>

