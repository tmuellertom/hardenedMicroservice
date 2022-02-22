#!/bin/bash -e

for namespace in $(kubectl --kubeconfig ../starter/kube_config_cluster.yml get namespaces -A -o json | jq -r '.items[].metadata.name'); do
  kubectl --kubeconfig ../starter/kube_config_cluster.yml patch serviceaccount default -n ${namespace} -p "$(cat account_update.yaml)"
done