
build:
	docker build -t foxylion/rabbitmq:3.6-autocluster .

push:
	docker push foxylion/rabbitmq:3.6-autocluster

deploy-kubernetes:
	kubectl apply -f examples/kubernetes.yml
