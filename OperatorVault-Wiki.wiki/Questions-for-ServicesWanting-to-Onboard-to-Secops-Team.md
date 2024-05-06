This is currently a draft for discussion.

This document takes into account best practices being used by [ipops](https://pages.github.ibm.com/cloudlab/internal-docs/ops-readiness-requirements.html). However, I have tried to simplify what is needed here since not all items apply.

Please create a document that uses the below template to our onboarding repo (need to create one) as a PR to begin engagement with the secops team. We are here to partner and help, so help us help you by answering some initial questions. We can then meet to discuss further steps. 


Please answer all questions, even if the resource is not available.

It is hard to write a template for every service, as every service is different. For example, some may have a UI while some a CLI. Some may only need to be checked on weekly, some daily.


## Development Documents


*  Is there a scope document available for this service so the ops team can understand the service?
*  If so, what is the location:
* Is there an architecture diagram available?
*  If so, what is the location:
* What are other useful education links?

## Service Customers

* List Service Customers both
   internal and external to IBM
* What are the customer expectations for coverage?

## Alerting

*  are their  generated alerts for this service
* If so are their dashboards to monitor
* Are there slack channels?
* If no automatic alerting, what are the manual processes for determining if issues and how often should they be run?

## Contacting the Service Team 

* Is there aPagerDuty team to page out for high severity items?
* If so, what is the  link to this PagerDuty team?
* How do we determine what is a high severity item? Do standard IBM definitions apply?
* If PagerDuty is not available, how does the secops team contact development for escallations?
* What is the OLA for service team coverage? In other words, if there is an issue, when will the service team be available and what is their expected response time?
* What is the jira or git projects to open issues against the development team or teams?

## Operational Runbooks

* Are there operational Runbooks for review?
* Has ipops been trained and if so, where is that documentation?

Some examples of what we will need, depending on the service are:
* A runbook or runbooks describing how to determine outages and if so how to fix them. Ideally there needs to be generated alerts we can monitor. If not, we will need the steps to determine if an outage is happening and how to fix them. Or, if we can't, who to page. What we will need depends on the  service's complexity.
