_**Note:** For a quick overview, see the video clip on [Introduction to HashiCorp Vault](https://learn.hashicorp.com/tutorials/vault/getting-started-intro?in=vault%2Fgetting-started&amp;wvideo=v8vcu8xcch)._

# TABLE OF CONTENTS

| Chapters                            | 
| ---------------------------------   | 
| [A. What is HashiCorp Vault?](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Introduction-to-HashiCorp-Vault#a-what-is-hashicorp-vault)         |
| [B. Why do we need Vault?](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Introduction-to-HashiCorp-Vault#b-why-do-we-need-vault)           |
| [C. How does Vault work?](https://github.ibm.com/gensec/OperatorVault-Wiki/wiki/Introduction-to-HashiCorp-Vault#c-how-does-vault-work)             |
| D. To be continued...               |



***


## A. What is HashiCorp Vault?
**Vault** is an identity-based secrets and encryption management system. 
> * A secret management system is a system that manages a set of credentials (a.k.a. "secrets")
> * A secret is anything that allows authentication and authorization-- in other words, things you want to tightly control access to
> > _Examples of secrets are usernames and passwords, API encryption keys, API tokens, or certificates._


Vault provides encryption services that are gated by authentication and authorization methods. Through Vault’s UI, CLI, or HTTP API, access to secrets and other sensitive data can be securely stored and managed, tightly controlled (restricted), and auditable.


***



## B. Why do we need Vault?
In a nutshell, Vault is ideal for managing secrets and protecting sensitive data within your organization. 

As technology advances, a modern system requires access to a multitude of secrets: database credentials, API keys for external services, credentials for service-oriented architecture communication, etc. 

Keeping track of who accessed which secrets in addition to key rolling, secure storage, and detailed audit logs is almost impossible without a custom solution. This is where Vault steps in.

Vaults are great in that they...
> * centralize all secrets--place all secrets in one location instead of them being sprawled everywhere
> * encrypt all secrets--encrypts them "at rest" and "in transit"
> * use access control--ACLS to allow or deny access
> * use audit trails--to keep logs of access providing more visibility and control




***



## C. How does Vault work?

### Overview of the Three Types of Vault Interfaces
Imagine you are a manager of a very large hotel. Most likely, there will be different entrances to the hotel that is convenient for different groups of people (i.e. guests, employees, catering companies, etc.)

> * Just like the hotel, the Vault has different ways you can interact with it or enter it--the CLI, UI, and API (3 different interfaces).
> * The API is generally used for machine to machine integrations and authorizations.
> * The UI is generally used for human integrations and authorizations.
> * The CLI is generally used for both machines and humans.
 


### (1) Vault Authentication
Regardless of who you are (i.e. employee or guest), you'll need an identity card or form of authentication to identify yourself when you're on the hotel premises. For example, if you're a guest, you'll need to show the hotel receptionist your government-issued ID to validate your identity. Once validated, the receptionist gives you your room key that will allow you access to certain areas and amenities in the hotel, such as your room, the gym, the pool, etc. 


Similar to this scenario, the Vault must first authenticate the client or user before it allows the client to interact with it. There are different types of authentication methods before you can access the Vault, such as by using a username and password, role ID and secret ID, TLS certificate, or integrated Cloud credentials.


### (2) Generate a Token
Once you are successfully authenticated, a **token** will be generated for you. The Vault token acts like the hotel room key you are given when you are fully validated by the hotel receptionist. 


Furthermore, just as the hotel room key has an expiration date--in other words, your check out date--the Vault authentication method also has a **TTL (Time to Live)**, the lifespan of the token. 


Once you have validated your identity and have received a token, you can access the specified Vault path(s) using that token with a specific TTL (i.e. you don't need to go back to the hotel receptionist to be re-authenticated in order to use the hotel gym, but you simply use the key card to access it for the duration of your stay).


### (3) Vault Path(s)
Just like in a hotel, you are allowed in certain rooms using that given access key, using the token provided to you, you may now operate the Vault according to your given policy(ies) or roles. For example, you can obtain a secret, read, write, or execute to a particular path, generate data, etc. 


Tokens are used to access backend secrets engines or vault paths.


### (4) Token Usage
In a sample scenario, if a client wants to retrieve data from a specific path (i.e. kv/apps/secret), the client will provide Vault with its token. Vault would check to see whether the token is valid, unexpired, and has permissions for the path requested. If yes to all, Vault will send the client its requested data without having to authenticate all over again.