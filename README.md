# Kubernetes cluster

Build kubernetes cluster using `kops`.

## Running locally

> run `make help` to see all commands

### Prerequisites

* docker
* docker-compose
* make

Run `make setup` to create `.env` and `docker-compose.local.yml` files.

### Commands 

* `make generate-from-template` - generate `kops` yaml template
* `make dryrun` - test your `kops` configuration
* `make update` - deploy cluster