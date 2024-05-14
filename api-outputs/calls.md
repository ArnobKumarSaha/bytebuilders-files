1) layout.json <- https://api.arnob-fvnhz.bytebuilders.xyz/api/v1/clusters/admin/stash-linode/proxy/meta.k8s.appscode.com/v1alpha1/resourcelayouts/kubedb.com-v1alpha2-mongodbs-kubedb -- kubedb.com-v1alpha2-monogdbs-kubedb


2) db.json <- https://api.arnob-fvnhz.bytebuilders.xyz/api/v1/clusters/admin/stash-linode/proxy/kubedb.com/v1alpha2/namespaces/demo/mongodbs/repl6?ctag=1715660126360  -- repl6?ctag=1715660126360

3) resourcegraph.json <- https://api.arnob-fvnhz.bytebuilders.xyz/api/v1/clusters/admin/stash-linode/proxy/meta.k8s.appscode.com/v1alpha1/resourcegraphs
 -- resourcegraphs

4) access-review.json <- https://api.arnob-fvnhz.bytebuilders.xyz/api/v1/clusters/admin/stash-linode/proxy/authorization.k8s.io/v1/selfsubjectaccessreviews -- selfsubjectaccessreview

5) render-self.json <- https://api.arnob-fvnhz.bytebuilders.xyz/api/v1/clusters/admin/stash-linode/proxy/meta.k8s.appscode.com/v1alpha1/renders?q=
{"apiVersion":"meta.k8s.appscode.com/v1alpha1","kind":"Render","request":{"convertToTable":true,"layoutName":"kubedb.com-v1alpha2-mongodbs-kubedb","pageName":"Overview","renderBlocks":["Self","SubTable"],"source":{"ref":{"name":"repl6","namespace":"demo"},"resource":{"group":"kubedb.com","name":"mongodbs","version":"v1alpha2"}}}}  -- renders?<that big query paramater>

6) render-connection.json <- https://api.arnob-fvnhz.bytebuilders.xyz/api/v1/clusters/admin/stash-linode/proxy/meta.k8s.appscode.com/v1alpha1/renders?q={"apiVersion":"meta.k8s.appscode.com/v1alpha1","kind":"Render","request":{"convertToTable":true,"layoutName":"kubedb.com-v1alpha2-mongodbs-kubedb","pageName":"Overview","renderBlocks":["Connection"],"source":{"ref":{"name":"repl6","namespace":"demo"},"resource":{"group":"kubedb.com","name":"mongodbs","version":"v1alpha2"}}}} -- renders?<that big query paramater>

7) summaries.json <- https://api.arnob-fvnhz.bytebuilders.xyz/api/v1/clusters/admin/stash-linode/proxy/core.k8s.appscode.com/v1alpha1/resourcesummaries?convertToTable=true&labelSelector=k8s.io%2Fgroup%3Dkubedb.com&ctag=1715660171115 -- resourcesummaries?convertToTable=true&labelSelector=<kubedb-group>?ctag=<>

8) genericresource.json <- https://api.arnob-fvnhz.bytebuilders.xyz/api/v1/clusters/admin/stash-linode/proxy/core.k8s.appscode.com/v1alpha1/genericresources?convertToTable=true&labelSelector=k8s.io%2Fgroup%3Dkubedb.com&ctag=1715660171115 -- resourcesummaries?convertToTable=true&labelSelector=<kubedb-group>?ctag=<>

