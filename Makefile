GCLOUD_PROJECT:=$(shell gcloud config list project --format="value(core.project)")

PHONY: build
build:
	gcloud builds submit --tag  gcr.io/${GCLOUD_PROJECT}/hellonode:v1 .

PHONY: gae-standard-deploy
gae-standard-deploy:
	gcloud app deploy gae/standard/app.yaml

PHONY: gae-flex-deploy
gae-flex-deploy:
	gcloud app deploy gae/flex/app.yaml

PHONY: gke-deploy
gke-deploy:
	kubectl apply -f k8s/hellonode-deployment.yaml
	kubectl apply -f k8s/hellonode-service.yaml


