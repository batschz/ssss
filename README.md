# SSSS - Server Side Swift in Scale

## Start with local development

`git clone git@github.com:batschz/ssss.git`

### Install vapor

```
brew tap vapor/tap
brew install vapor/tap/vapor
```

and create a Xcode project via vapor cli

`vapor xcode`

Open the project in Xcode and run the `Run` target. Try out your endpoints using [http://localhost:8080]() in your browser.

## Docker

### Install docker

Download docker: [https://store.docker.com/editions/community/docker-ce-desktop-mac]()

### Build docker image
`docker build -t ssss:latest .`

### Run docker image
`docker run -p 8080:8080 -t ssss:latest` and try it out in your browser [http://localhost:8080]()

### Kill all docker container
`docker kill $(docker ps -q)`

## Kubernetes

Helpful medium post that helps to understand kubernetes and it parts: [https://medium.com/@awkwardferny/getting-started-with-kubernetes-ingress-nginx-on-minikube-d75e58f52b6c]()

## Minikube

> Minikube is a tool that makes it easy to run Kubernetes locally. Minikube runs a single-node Kubernetes cluster inside a VM on your laptop for users looking to try out Kubernetes or develop with it day-to-day.

### Install
[https://kubernetes.io/docs/tasks/tools/install-minikube/]()

### Run
`minikube run`

### Switch Docker context to Docker inside minikube
`eval $(minikube docker-env)` or switch back to local Docker context `eval $(docker-machine env -u)`

### Build docker images in k8s docker registry
`docker build -t ssss:1 .`

### List all docker images in current registry
`docker images`

### Create deployment and start pods
`kubectl apply -f kc-deployment.yaml`

`kubectl get po` to monitor the pods

### Create service
`kubectl apply -f kc-service.yaml`

`kubectl get svc` to monitor the services

### Create ingress
`kubectl apply -f kc-ingress.yaml`

`kubectl get ingress` to monitor the ingress

### Get Cluster IP
`minikube ip`

and open the ip in your browser to test

### Deploy a update
`docker build -t ssss:2 .`

change the version of the image in the `kc-deployment.yaml` file and run `kubectl apply -f kc-deployment.yaml`

You can monitor the rolling update via `kubectl get po -w`

### Deploy another micro service (google greeter)
`kubectl apply -f kc-deployment-greeter.yaml`

`kubectl apply -f kc-service-greeter.yaml`

add the following lines to the `kc-ingress.yaml` file:

```
- path: /greeter
	backend:
	  serviceName: greeter
	  servicePort: 8080
```
and deploy it via `kubectl apply -f kc-ingress.yaml`


