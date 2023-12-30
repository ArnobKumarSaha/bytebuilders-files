
helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo update
helm install crossplane crossplane-stable/crossplane --namespace crossplane-system --create-namespace

https://appscode.com/blog/post/crossplane-provider-gcp/

https://docs.crossplane.io/v1.14/getting-started/provider-gcp/


```bash
$ kubectl api-resources  | grep crossplane
compositeresourcedefinitions      xrd,xrds     apiextensions.crossplane.io/v1         false        CompositeResourceDefinition
compositionrevisions              comprev      apiextensions.crossplane.io/v1         false        CompositionRevision
compositions                      comp         apiextensions.crossplane.io/v1         false        Composition
environmentconfigs                envcfg       apiextensions.crossplane.io/v1alpha1   false        EnvironmentConfig
configurationrevisions                         pkg.crossplane.io/v1                   false        ConfigurationRevision
configurations                                 pkg.crossplane.io/v1                   false        Configuration
controllerconfigs                              pkg.crossplane.io/v1alpha1             false        ControllerConfig
locks                                          pkg.crossplane.io/v1beta1              false        Lock
providerrevisions                              pkg.crossplane.io/v1                   false        ProviderRevision
providers                                      pkg.crossplane.io/v1                   false        Provider
storeconfigs                                   secrets.crossplane.io/v1alpha1         false        StoreConfig
```