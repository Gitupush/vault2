# Vault Operations Common and Not-so-common Scenarios

# [Unsealing Vault](#errors)

## Normal Unseal for Non-America Production Vault Clusters
        $ vault operator unseal
        Unseal Key (will be hidden):  
```

---

## Error: licensing is in an invalid state, restart required
> Cause: the new Vault licensing scheme will disable the ability to unseal Vault after 30 minutes. If 30 minutes have passed, simply restart the Vault process and perform the unseal steps again.
```
        $ vault operator unseal
        Unseal Key (will be hidden):  
        Error unsealing: Error making API request.  
        URL: PUT https://127.0.0.1:8200/v1/sys/unseal  
        Code: 500. Errors:  
        licensing is in an invalid state, restart required
```
