helm upgrade -i kube-prometheus-stack prometheus-community/kube-prometheus-stack \
  --namespace monitoring --create-namespace --set grafana.image.tag=7.5.5 \
  --set kube-state-metrics.metricLabelsAllowlist[0]=pods='[*]' --set kube-state-metrics.metricLabelsAllowlist[1]=persistentvolumeclaims='[*]'

# - --metric-labels-allowlist=pods=[*]

cd ~/go/src/github.com/opencost/opencost-helm-chart

helm upgrade -i opencost oci://r.byte.builders/charts/opencost --version=1.18.1 \
-n opencost --create-namespace \
-f /home/arnob/yamls/opencost/values.yaml


kubectl port-forward -n monitoring svc/prometheus-operated 9092:9090
kubectl port-forward -n opencost svc/opencost 9003 9097:9090 


Prometheus: http://localhost:9090
OpenCost UI at http://localhost:9091
API: http://localhost:9003/allocation/compute?window=60m


