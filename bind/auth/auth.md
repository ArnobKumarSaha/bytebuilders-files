Contents :
- BindingProvider
- Sample `kubectl bind` output
- All the URLs visited in the OIDC authentication process
- Bindingresponse
- kubeConfig of Provider, its token's Payload
- Info from /authorize & /callback when using b3



## GET http://127.0.0.1:8080/export
{
    "kind": "BindingProvider",
    "apiVersion": "v1alpha1",
    "providerPrettyName": "example-backend",
    "version": "v0.3.0",
    "authenticationMethods": [
        {
            "method": "OAuth2CodeGrant",
            "oauth2CodeGrant": {
                "authenticatedURL": "http://127.0.0.1:8080/authorize"
            }
        }
    ]
}

## Example Output of the bind command in terminal

kubectl bind http://127.0.0.1:8080/export

To authenticate, visit in your browser:

	http://127.0.0.1:8080/authorize?c=5hW2mW&p=34961&s=4cgpcy

🔑 Successfully authenticated to http://127.0.0.1:8080/export
🔒 Created secret kube-bind/kubeconfig-q52n2 for host https://2aaba29a-79c8-4062-a513-6040a9246281.ap-west-2.linodelke.net:443, namespace bb-g9d5w
🚀 Executing: kubectl bind apiservice --remote-kubeconfig-namespace kube-bind --remote-kubeconfig-name kubeconfig-q52n2 -f -
✨ Use "-o yaml" and "--dry-run" to get the APIServiceExportRequest and pass it to "kubectl bind apiservice" directly. Great for automation.
🚀 Deploying konnector v0.3.0 to namespace kube-bind.
✅ Created APIServiceBinding mangodbs.mangodb.com

NAME                                                  PROVIDER   READY   MESSAGE   AGE
apiservicebinding.kube-bind.io/mangodbs.mangodb.com              False   Pending   0s










********************************************* bind process ************************************************

## Kubectl bind process steps

### open in browser
http://127.0.0.1:8080/authorize?c=8UJNtN&p=44321&s=4cgpcy

### Oauth page (login do dex)
http://127.0.0.1:5556/dex/auth
?client_id=kube-bind
&redirect_uri=http%3A%2F%2F127.0.0.1%3A8080%2Fcallback
&response_type=code
&scope=openid+profile+email+offline_access
&state=eyJyZWRpcmVjdFVSTCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDI0NDMvY2FsbGJhY2siLCJzaWQiOiI0Y2dwY3kiLCJjaWQiOiI4OUdFWm8ifQ%3D%3D

<Unregistered Redirect URI>
http://127.0.0.1:5556/dex/auth/mock
?client_id=kube-bind
&redirect_uri=http%3A%2F%2F127.0.0.1%3A8080%2Fcallback
&response_type=code
&scope=openid+profile+email+offline_access
&state=eyJyZWRpcmVjdFVSTCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDI0NDMvY2FsbGJhY2siLCJzaWQiOiI0Y2dwY3kiLCJjaWQiOiI4OUdFWm8ifQ%3D%3D


### Grant Access
http://127.0.0.1:5556/dex/approval?req=rptbz2n6iuztzicpmpdd3ttdn&hmac=GhfzDirRlLLx4XyVQJQOo86M8l2VAdys--6uLdo3X2g

### Bind with a resource
http://127.0.0.1:8080/resources?s=4cgpcy


### Success
http://localhost:36885/callback?response=<>

See next block for more details about the response




















********************************************* response-decode ************************************************

## response-decode 

{
  "kind": "BindingResponse",
  "apiVersion": "kube-bind.io/v1alpha1",
  "authentication": {
    "oauth2CodeGrant": {
      "sid": "4cgpcy",
      "id": "http://127.0.0.1:5556/dex/Cg0wLTM4NS0yODA4OS0wEgRtb2Nr"
    }
  },
  "kubeconfig": "YXBpVmVyc2lvbjogdjEKY2x1c3RlcnM6Ci0gY2x1c3RlcjoKICAgIGNlcnRpZmljYXRlLWF1dGhvcml0eS1kYXRhOiBMUzB0TFMxQ1JVZEpUaUJEUlZKVVNVWkpRMEZVUlMwdExTMHRDazFKU1VNdmFrTkRRV1ZoWjBGM1NVSkJaMGxDUVVSQlRrSm5hM0ZvYTJsSE9YY3dRa0ZSYzBaQlJFRldUVkpOZDBWUldVUldVVkZFUlhkd2NtUlhTbXdLWTIwMWJHUkhWbnBOUWpSWVJGUkplazFFVlhkUFJFVjRUVlJaTUU5R2IxaEVWRTE2VFVSVmQwNVVSWGhOVkZrd1QwWnZkMFpVUlZSTlFrVkhRVEZWUlFwQmVFMUxZVE5XYVZwWVNuVmFXRkpzWTNwRFEwRlRTWGRFVVZsS1MyOWFTV2gyWTA1QlVVVkNRbEZCUkdkblJWQkJSRU5EUVZGdlEyZG5SVUpCVFRKWUNqbFNOelpVU0hWamFVeE9XR2hWYW5GSmNtWkVUV05tUzFkTFFXeEpjbHBEZFcxemNUZGlRekZ4UW5ONFNWUXZNVlppUWpGVWJIaDZWMmxKYzJwQlYxQUtTMWd3Y1c0dllXWjZUMFphZDJjdlpsVlJRbWRtVDNWYVFuZ3hSRTR3UTFKbE5VSTVVa3BLYldsa1JVMTJaUzlSVFU5eVozaFlORzlWU2tvNFFrdFVPQXBvVm1jMFRtdEpjRzV5UkZGVVkwTmplSFIzVTJSc00wSkVPRXhVT0N0c1VYbHNiVVZTYW1JclQyb3phRkJXZUZOMFpFcGlVMmx6Ym05SGFVODNZeXROQ2pCTGRWbzRXakIyWVdod2MzWXJhRmhVV0ZCRlUzUXliMlZMVUhCU1luZFBNVVYzYkZkMWMxSm9ZVXMwVFZWS2VHZFRWRFJhYjJjeGFHRkRRVEJLV0ZJS2MwWTJWbUpKTUdsdmNXb3daM1ZTTDI1RWNFRXdhVVpSYjBsSlpuRm5RMDlLZFdkWmFVWm1iRlJaYlRjd2FFTlBkWFpYVVZZeU1YbDNlRkZZUTNKMmJncExZMVp1UVZvelZsUkhibGR2U205alkxUlZRMEYzUlVGQllVNWFUVVpqZDBSbldVUldVakJRUVZGSUwwSkJVVVJCWjB0clRVRTRSMEV4VldSRmQwVkNDaTkzVVVaTlFVMUNRV1k0ZDBoUldVUldVakJQUWtKWlJVWkVURTlqYzAxTk5uRldNRWxHVmpKVGNESlpTSGR0VVZNeFN6Uk5RbFZIUVRGVlpFVlJVVThLVFVGNVEwTnRkREZaYlZaNVltMVdNRnBZVFhkRVVWbEtTMjlhU1doMlkwNUJVVVZNUWxGQlJHZG5SVUpCU1dFemNGcFNUR0pMZURkc1pqQktVazVQTndwM2JHcGpSbGhxY0ZWNU56Wm1TMWxyU2pjck5VVnZZVEJZWjNoQmJqRndhRVpYY0RWWGJ6bHRTREZOUTFkQ1ZEbHhSSFZSUzNkSk5HSmhjVE00T0RSQkNrSk5UMVIzVnpVNFp5dExXSEZtVXpseWMwZGxTVVphT0d0UVQxaFpkV3RJUTJKYU5XaG9UelpRTVZSVk4zVTBVRk5XWVRGR2NETlhOREZ0ZVdWNWVEZ0taelZFU21Wbk0wNUtRWFo1T0cxRmNpdDJRVTlwUjFsTlNrOWplRVpHT0hkcmFHWnFiM1pSWW5sWlNVOUhhRFZHUkRocWFWZE9XRmhPZEZsb1FWTmlLd29yUVdRMVZGaDFTRnB4TldZd1EwbEtjMWxTYjA1c2VsTjZjMlZrYXl0dlNWWktkbFZYTkc1eUx6WXhLMFo0WlhoNU1uSjFZa1JHUm5oUlNGZEVkVUp0Q25FMVpDOVJLekp2SzBvek9FOUZSalphYjJaV1JEVmhlbFl5ZFdKa1QyMVpORTV5VVdsU1VVb3dURnBJY0ZoSFYwcDZja0UwWVdvd016aE9ibFJ2V0c0S01HMDRQUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09CiAgICBzZXJ2ZXI6IGh0dHBzOi8vMmFhYmEyOWEtNzljOC00MDYyLWE1MTMtNjA0MGE5MjQ2MjgxLmFwLXdlc3QtMi5saW5vZGVsa2UubmV0OjQ0MwogIG5hbWU6IGRlZmF1bHQKY29udGV4dHM6Ci0gY29udGV4dDoKICAgIGNsdXN0ZXI6IGRlZmF1bHQKICAgIG5hbWVzcGFjZToga3ViZS1iaW5kLXdycXRjCiAgICB1c2VyOiBkZWZhdWx0CiAgbmFtZTogZGVmYXVsdApjdXJyZW50LWNvbnRleHQ6IGRlZmF1bHQKa2luZDogQ29uZmlnCnByZWZlcmVuY2VzOiB7fQp1c2VyczoKLSBuYW1lOiBkZWZhdWx0CiAgdXNlcjoKICAgIHRva2VuOiBleUpoYkdjaU9pSlNVekkxTmlJc0ltdHBaQ0k2SWxGelRtYzFWblkyVURKelpHbDRNRXhhYW1KMWFqZ3RjRGhwU2pkRWNuTk9aRWt5ZUVwNU5VSmhiekFpZlEuZXlKcGMzTWlPaUpyZFdKbGNtNWxkR1Z6TDNObGNuWnBZMlZoWTJOdmRXNTBJaXdpYTNWaVpYSnVaWFJsY3k1cGJ5OXpaWEoyYVdObFlXTmpiM1Z1ZEM5dVlXMWxjM0JoWTJVaU9pSnJkV0psTFdKcGJtUXRkM0p4ZEdNaUxDSnJkV0psY201bGRHVnpMbWx2TDNObGNuWnBZMlZoWTJOdmRXNTBMM05sWTNKbGRDNXVZVzFsSWpvaWEzVmlaUzFpYVc1a1pYSWlMQ0pyZFdKbGNtNWxkR1Z6TG1sdkwzTmxjblpwWTJWaFkyTnZkVzUwTDNObGNuWnBZMlV0WVdOamIzVnVkQzV1WVcxbElqb2lhM1ZpWlMxaWFXNWtaWElpTENKcmRXSmxjbTVsZEdWekxtbHZMM05sY25acFkyVmhZMk52ZFc1MEwzTmxjblpwWTJVdFlXTmpiM1Z1ZEM1MWFXUWlPaUpqT1dWall6QXdaaTB6TTJOa0xUUmlNMkV0T1RnNVpTMWpaV001WlRGbVlXVXpNVEFpTENKemRXSWlPaUp6ZVhOMFpXMDZjMlZ5ZG1salpXRmpZMjkxYm5RNmEzVmlaUzFpYVc1a0xYZHljWFJqT210MVltVXRZbWx1WkdWeUluMC4xdmhqZ3JUc0MwXzFPTnpWYUNqWjlDRmNwY2JCekZ3Mnl2VHl0OGEwRDRQM2xOU1JYSkVDU1A0aExvekdZSzFQOXVFRWtTUFdhNkQwNHp5VzRteW5NT1YtVl9sWl9pbEk5U3I3UDNFOGdzMk5TOWpXWFFhSUpmUy1PVkh0MjJmcHRiNUxUano0Qm9fNjhpYzVBZkJiVDl4YnpFWXQ1WF92Wm9pdnEyLURBa25iNkxKZW1fTDBmQlMtcWF4enBveVQ3ZjVKbjJ4TDJ2Z0hNWHJYT1JtaHRHTUtZdkhWd2FKSm9FVG5qQUdJTUUxNVA0SWRERy1aX1JyRHB4cXBEdUgxN3labjNPTm1XbXNkRlVUX2NXVjRhSWNBQ3FFRUk5QmdzaHF0cE9iRnVuY05EeklFU1VNZ0J0VThrUnlMb2xHampJM3M4VzhWMURFNDhqTURwQ0s2OFEK",
  "requests": [
    {
      "kind": "APIServiceExportRequest",
      "apiVersion": "kube-bind.io/v1alpha1",
      "metadata": {
        "name": "mangodbs.mangodb.com"
      },
      "spec": {
        "resources": [
          {
            "group": "mangodb.com",
            "resource": "mangodbs"
          }
        ]
      },
      "status": {}
    }
  ]
}



// This is the decode version of the above kubeconfig
// Here the server is the endpoint of linode k8s cluster

apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUMvakNDQWVhZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJek1EVXdPREV4TVRZME9Gb1hEVE16TURVd05URXhNVFkwT0Zvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTTJYCjlSNzZUSHVjaUxOWGhVanFJcmZETWNmS1dLQWxJclpDdW1zcTdiQzFxQnN4SVQvMVZiQjFUbHh6V2lJc2pBV1AKS1gwcW4vYWZ6T0Zad2cvZlVRQmdmT3VaQngxRE4wQ1JlNUI5UkpKbWlkRU12ZS9RTU9yZ3hYNG9VSko4QktUOApoVmc0TmtJcG5yRFFUY0NjeHR3U2RsM0JEOExUOCtsUXlsbUVSamIrT2ozaFBWeFN0ZEpiU2lzbm9HaU83YytNCjBLdVo4WjB2YWhwc3YraFhUWFBFU3Qyb2VLUHBSYndPMUV3bFd1c1JoYUs0TVVKeGdTVDRab2cxaGFDQTBKWFIKc0Y2VmJJMGlvcWowZ3VSL25EcEEwaUZRb0lJZnFnQ09KdWdZaUZmbFRZbTcwaENPdXZXUVYyMXl3eFFYQ3J2bgpLY1ZuQVozVlRHbldvSm9jY1RVQ0F3RUFBYU5aTUZjd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0hRWURWUjBPQkJZRUZETE9jc01NNnFWMElGVjJTcDJZSHdtUVMxSzRNQlVHQTFVZEVRUU8KTUF5Q0NtdDFZbVZ5Ym1WMFpYTXdEUVlKS29aSWh2Y05BUUVMQlFBRGdnRUJBSWEzcFpSTGJLeDdsZjBKUk5PNwp3bGpjRlhqcFV5NzZmS1lrSjcrNUVvYTBYZ3hBbjFwaEZXcDVXbzltSDFNQ1dCVDlxRHVRS3dJNGJhcTM4ODRBCkJNT1R3VzU4ZytLWHFmUzlyc0dlSUZaOGtQT1hZdWtIQ2JaNWhoTzZQMVRVN3U0UFNWYTFGcDNXNDFteWV5eDgKZzVESmVnM05KQXZ5OG1Fcit2QU9pR1lNSk9jeEZGOHdraGZqb3ZRYnlZSU9HaDVGRDhqaVdOWFhOdFloQVNiKworQWQ1VFh1SFpxNWYwQ0lKc1lSb05selN6c2VkaytvSVZKdlVXNG5yLzYxK0Z4ZXh5MnJ1YkRGRnhRSFdEdUJtCnE1ZC9RKzJvK0ozOE9FRjZab2ZWRDVhelYydWJkT21ZNE5yUWlSUUowTFpIcFhHV0p6ckE0YWowMzhOblRvWG4KMG04PQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==
    server: https://2aaba29a-79c8-4062-a513-6040a9246281.ap-west-2.linodelke.net:443
  name: default
contexts:
- context:
    cluster: default
    namespace: kube-bind-wrqtc
    user: default
  name: default
current-context: default
kind: Config
preferences: {}
users:
- name: default
  user:
    token: eyJhbGciOiJSUzI1NiIsImtpZCI6IlFzTmc1VnY2UDJzZGl4MExaamJ1ajgtcDhpSjdEcnNOZEkyeEp5NUJhbzAifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLWJpbmQtd3JxdGMiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlY3JldC5uYW1lIjoia3ViZS1iaW5kZXIiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoia3ViZS1iaW5kZXIiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC51aWQiOiJjOWVjYzAwZi0zM2NkLTRiM2EtOTg5ZS1jZWM5ZTFmYWUzMTAiLCJzdWIiOiJzeXN0ZW06c2VydmljZWFjY291bnQ6a3ViZS1iaW5kLXdycXRjOmt1YmUtYmluZGVyIn0.1vhjgrTsC0_1ONzVaCjZ9CFcpcbBzFw2yvTyt8a0D4P3lNSRXJECSP4hLozGYK1P9uEEkSPWa6D04zyW4mynMOV-V_lZ_ilI9Sr7P3E8gs2NS9jWXQaIJfS-OVHt22fptb5LTjz4Bo_68ic5AfBbT9xbzEYt5X_vZoivq2-DAknb6LJem_L0fBS-qaxzpoyT7f5Jn2xL2vgHMXrXORmhtGMKYvHVwaJJoETnjAGIME15P4IdDG-Z_RrDpxqpDuH17yZn3ONmWmsdFUT_cWV4aIcACqEEI9BgshqtpObFuncNDzIESUMgBtU8kRyLolGjjI3s8W8V1DE48jMDpCK68Q





// kubeconfig token's PayLoad looks like this : 
{
  "iss": "kubernetes/serviceaccount",
  "kubernetes.io/serviceaccount/namespace": "bbb-95snp",
  "kubernetes.io/serviceaccount/secret.name": "kube-binder",
  "kubernetes.io/serviceaccount/service-account.name": "kube-binder",
  "kubernetes.io/serviceaccount/service-account.uid": "70d768e6-9aed-4bfa-83ee-8d916b71c763",
  "sub": "system:serviceaccount:bbb-95snp:kube-binder"
}












<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Info when authorizing with B3 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
## Info for B3

1) In handleAuthorize()  => Authorization URl : http://accounts.bb.test:3000/login/oauth/authorize
?client_id=b13a686a-71f7-417d-84f7-4f7024edb8f4&
redirect_uri=http%3A%2F%2F127.0.0.1%3A8080%2Fcallback
&response_type=code&scope=openid+profile+email+offline_access
&state=eyJyZWRpcmVjdFVSTCI6Imh0dHA6Ly9sb2NhbGhvc3Q6MzU5NTEvY2FsbGJhY2siLCJzaWQiOiI0Y2dwY3kiLCJjaWQiOiI1aFcybVcifQ%3D%3D 


2) In handleCallback()   => Session State : {
CreatedAt:2023-05-15 11:40:43.34523543 +0600 +06 m=+19.865946919 
ExpiresOn:2023-05-15 12:40:43.345219695 +0600 +06 m=+3619.865931188 
AccessToken: <jwt-token>
IDToken:{
"aud":"b13a686a-71f7-417d-84f7-4f7024edb8f4",
"exp":1684132843,
"iat":1684129243,
"iss":"http://accounts.bb.test:3000/",
"sub":"2",
"name":"appscode",
"preferred_username":"appscode",
"profile":"http://bb.test:5998/appscode",
"picture":"https://secure.gravatar.com/avatar/e5e3e9e940cb58c9c8aa29c9cf4d6ecf?d=identicon",
"locale":"en-US",
"updated_at":1684125294,
"email":"admin@appscode.com",
"email_verified":true
} 
RefreshToken: <jwt-token>
RedirectURL:http://localhost:35951/callback 
SessionID:4cgpcy ClusterID:5hW2mW} 







