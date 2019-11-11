#!/usr/bin/env bash

set -euo pipefail

DIST_FOLDER="dist"

kops create cluster \
  --name "${KOPS_CLUSTER_NAME}" \
  --state "${KOPS_STATE_STORE}" \
  --cloud aws \
  --topology private \
  --bastion \
  --master-size "${KOPS_MASTER_SERVER_TYPE}" \
  --master-count 3 \
  --master-zones "${KOPS_REGION}"a,"${KOPS_REGION}"b,"${KOPS_REGION}"c \
  --networking calico \
  --node-size "${KOPS_NODES_SERVER_TYPE}" \
  --node-count "${KOPS_NODES_MIN_SIZE}" \
  --zones "${KOPS_REGION}"a,"${KOPS_REGION}"b,"${KOPS_REGION}"c \
  --ssh-public-key ~/.ssh/id_rsa.pub \
  --dry-run \
  --output yaml > "${DIST_FOLDER}/${KOPS_CLUSTER_NAME}.yaml"