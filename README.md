# Running app

# General Information
It's a simple Vaadin application that allows the user to add information about their running performance.\
The main purpose of this application was to use the knowledge about Kubernetes gained during learning this tool.
# Project Description
The main purpose of this project is to use Kubernetes to deploy the application.
The project has included the following steps:
* Creating simple Vaadin application
* Creating a Dockerfile to build an application image according to best practices (multi-stage building, non-root user)
* Pushing the image to the repository(DockerHub)
* Creating Kubernetes object files (Deployment, Service, Ingress) to deploy application on cluster (used Google Kubernetes Engine)
* Creating Simple CI/CD pipeline using GitLab

# Technical Stack
* Vaadin
* Docker
* Kubernetes
* Helm 
* Gitlab

# Installation and running

**To run the application, you can use one of two methods.**

1.Launching the application from the Docker container

The application's image is available on [DockerHub](https://hub.docker.com/r/kozijakinfo/run-app/tags). To run the container with the application, use the below command:

```
docker container run -d --name running-app --rm -p 8080:8080 kozijakinfo/run-app:2.0
```

To check that the container has been created correctly and is working, use the following command:

```
docker container ls
```

The application will be available in your browser at [http://localhost:8080](http://localhost:8080)

2.Deploy the application on Kubernetes cluster.
All work releted to Kubernetes has been done using Google Kubernetes Engine.
Ingress is used to expose the application to external users.
It is required to install Ingress Nginx Controller first. You can do it using following command:


```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.9.6/deploy/static/provider/cloud/deploy.yaml
```
Then executing the following command:\

```
kubectl apply -f k8s/running-app-deployment.yml -f k8s/running-app-svc.yml -f k8s/ingress-resource.yml
```

To get the public IP address you need to execute the command:\

```
kubectl get ingress
```

