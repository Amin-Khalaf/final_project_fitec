deploy:
	kubectl apply -f db-deployment.yaml
	kubectl apply -f db-service.yaml
	kubectl apply -f app-deployment.yaml
	kubectl apply -f app-service.yaml
	kubectl apply -f pvc-db-claim.yaml
	kubectl apply -f pvc-conf-claim.yaml
	kubectl apply -f pvc-docs-claim.yaml
	kubectl apply -f db-pv-volume.yaml
	kubectl apply -f docs-pv-volume.yaml
	kubectl apply -f conf-pv-volume.yaml
