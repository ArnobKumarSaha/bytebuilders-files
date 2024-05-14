#!/bin/bash


while IFS= read -r line; do
    crd_name=$(echo "$line" | awk '{print $1}')
    kubectl delete crd "$crd_name"
done < crds_installed.txt
