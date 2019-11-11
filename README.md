# Kubernetes cluster

Build kubernetes cluster using `kops`.

It can be customized with value files but the commited version will:
* deploy kubernetes cluster in private VPC
* bastion instance group
* two instance groups - one, on demand with PreferNoSchedule taint, second mixed spot instances

## Running locally

> run `make help` to see all commands

### Prerequisites

* docker
* docker-compose
* make

1. Run `make setup` to create `.env` and `docker-compose.local.yml` files.
2. Populate `.env` file with 
  - your AWS credentials
  - cluser name (should be a dns zone, the kops can operate on)
  - kops state s3 bucket


### Commands 

* `make generate-from-template` - generate `kops` yaml template
* `make dryrun` - test your `kops` configuration
* `make update` - deploy cluster
