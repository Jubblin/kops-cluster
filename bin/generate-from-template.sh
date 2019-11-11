#!/usr/bin/env bash

set -euo pipefail

distFolder="dist"

mkdir -p "$distFolder"

envsubst < "clusters/values-${KOPS_CLUSTER_TEMPLATE_NAME}.yaml" > "${distFolder}/values.yaml"

kops toolbox template \
  --template "clusters/templates/cluster.yaml" \
  --values "${distFolder}/values.yaml" \
  --set cluster.name="${KOPS_CLUSTER_NAME}" \
  --set cluster.stateStore="${KOPS_STATE_STORE}" \
  --output "$distFolder/${KOPS_CLUSTER_NAME}.yaml"
