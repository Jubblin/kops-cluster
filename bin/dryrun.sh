#!/usr/bin/env bash

set -euo pipefail

distFolder="dist"

kops replace --force -f "$distFolder/${KOPS_CLUSTER_NAME}.yaml"
kops create secret sshpublickey admin -i "$(realpath "${KOPS_SSH_PUBLIC_KEY_FILE}")"
kops update cluster