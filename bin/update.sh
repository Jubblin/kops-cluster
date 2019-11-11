#!/usr/bin/env bash

set -euo pipefail

kops update cluster --yes

kops export kubecfg
kops validate cluster --wait 1000s

kops rolling-update cluster