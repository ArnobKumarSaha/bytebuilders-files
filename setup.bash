#!/bin/bash


kubectl delete mg,pg,mariadb -n demo --all
helm uninstall -n kubedb kubedb
kubectl delete crds -l 'app.kubernetes.io/name=kubedb'

sleep 5

helm install kubedb kubedb-v2024.6.4.tgz \
  --version v2024.6.4 \
  --namespace kubedb --create-namespace \
  --set-file global.license=/home/arnob/yamls/license/kind.txt \
  --wait --burst-limit=10000 --debug

kubectl apply -f ~/go/src/github.com/Arnobkumarsaha/bytebuilders-files/db/mongo.yaml
kubectl apply -f ~/go/src/github.com/Arnobkumarsaha/bytebuilders-files/db/pg.yaml
kubectl apply -f ~/go/src/github.com/Arnobkumarsaha/bytebuilders-files/db/maria.yaml

sleep 120

kubectl get pg,mg,mariadb -n demo -oyaml > ~/go/src/github.com/Arnobkumarsaha/bytebuilders-files/db/all_dbs.yaml

echo "Now see provisioner logs..."
sleep 30

kubectl apply -f https://raw.githubusercontent.com/kubedb/installer/v2024.7.11-rc.1/crds/kubedb-catalog-crds.yaml
kubectl apply -f https://github.com/kubeops/petset/raw/v0.0.6/crds/apps.k8s.appscode.com_placementpolicies.yaml
# kubectl create -f https://github.com/kubeops/petset/raw/v0.0.6/crds/apps.k8s.appscode.com_petsets.yaml


helm upgrade -i kubedb kubedb-v2024.7.11-rc.1.tgz \
  --version v2024.7.11-rc.1 \
  --namespace kubedb --create-namespace \
  --set-file global.license=/home/arnob/yamls/license/kind.txt \
  --wait --burst-limit=10000 --debug

