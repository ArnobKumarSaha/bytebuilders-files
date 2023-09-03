helm upgrade -i kube-prometheus-stack prometheus-community/kube-prometheus-stack \
  --namespace monitoring --create-namespace

helm repo add falcosecurity https://falcosecurity.github.io/charts

helm upgrade -i falco falcosecurity/falco \
-n falco --create-namespace \
--set tty=true --set driver.kind=modern-bpf --set falco.modern_bpf.cpus_for_each_syscall_buffer=1 \
--set falcosidekick.enabled=true --set falcosidekick.webui.enabled=true \
--set falco.json_output=true --set falco.json_include_output_property=true \
--set falco.http_output.enabled=true --set falco.http_output.url=http://falco-ui-server:8080/falcoevents --set falco.http_output.insecure=true \
--set falco.grpc.enabled=true --set falco.grpc_output.enabled=true

helm upgrade -i falco-ui-server appscode/falco-ui-server -n falco

helm upgrade -i falco-exporter falcosecurity/falco-exporter \
-n falco --create-namespace \
--set serviceMonitor.enabled=true \
--set serviceMonitor.additionalLabels.release=kube-prometheus-stack \
--set service.annotations=null \
--set prometheusRules.enabled=true

kubectl port-forward -n monitoring svc/kube-prometheus-stack-prometheus 9090
kubectl port-forward -n monitoring svc/kube-prometheus-stack-grafana 9091:80

