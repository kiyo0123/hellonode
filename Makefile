GCLOUD_PROJECT:=$(shell gcloud config list project --format="value(core.project)")

PHONY: build
build:
	gcloud container builds submit --tag  gcr.io/${GCLOUD_PROJECT}/hellonode:v1 .

PHONY: gae-deploy
gae-deploy:
	gcloud app deploy

PHONY: gke-deploy
gke-deploy:
	kubectl apply -f hellonode-deployment.yaml
	kubectl apply -f hellonode-service.yaml


