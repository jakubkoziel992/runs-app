# Running app

# Table of Contents
[General Information](#information)/
[Project Description](#description)/
[Technical Stack](#stack)/
[Installation and running](#running/)
[CI/CD using GitLab](#ci/cd)/
[Contact](#contact)/

<a name="information"/>
# General Information
It's a simple Vaadin application that allows the user to add information about their running performance.\
The main purpose of this application was to use the knowledge about Kubernetes gained during learning this tool.
<a name="description"/>
# Project Description
The main purpose of this project is to use Kubernetes to deploy the application.
The project has included the following steps:
* Creating simple Vaadin application
* Creating a Dockerfile to build an application image according to best practices (multi-stage building, non-root user)
* Pushing the image to the repository(DockerHub)
* Creating Kubernetes object files (Deployment, Service, Ingress) to deploy application on cluster (used Google Kubernetes Engine)
* Creating Simple CI/CD pipeline using GitLab
<a name="stack"/>
# Technical Stack
* Vaadin
* Docker
* Kubernetes
* Helm 
* Gitlab
<a name="running"/>
# Installation and running

**To run the application, you can use one of two methods.**

**1.Launching the application from the Docker container**

The application's image is available on [DockerHub](https://hub.docker.com/r/kozijakinfo/run-app/tags). To run the container with the application, use the below command:

```
docker container run -d --name running-app --rm -p 8080:8080 kozijakinfo/run-app:2.0
```

To check that the container has been created correctly and is working, use the following command:

```
docker container ls
```
Command's output should be similar to:
![Image](https://raw.githubusercontent.com/jakubkoziel992/runs-app/master/.github/container_ls.png)

The application will be available in your browser at [http://localhost:8080](http://localhost:8080)

![Image](https://raw.githubusercontent.com/jakubkoziel992/runs-app/master/.github/application.png)

**2.Deploy the application on Kubernetes cluster.**

**All work releted to Kubernetes is done using Google Kubernetes Engine.\**

Ingress is used to expose the application to external users.\
It is required to install Ingress Nginx Controller first. You can do it using following comman[[Id:


```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.9.6/deploy/static/provider/cloud/deploy.yaml
```
Then executing the following command:

```
kubectl apply -f k8s/running-app-deployment.yml -f k8s/running-app-svc.yml -f k8s/ingress-resource.yml
```

To get the public IP address you need to execute the command:

```
kubectl get ingress
```
In my case the address is as follow.

![Image](https://raw.githubusercontent.com/jakubkoziel992/runs-app/master/.github/ingress.png)

The application will be available in browser using that IP.

![Image](https://raw.githubusercontent.com/jakubkoziel992/runs-app/master/.github/ingress_application.png)


**To stop the application run commands:**

```
kubectl delete -f k8s/running-app-deployment.yml -f k8s/running-app-svc.yml -f k8s/ingress-resource.yml
```

```
kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.9.6/deploy/static/provider/cloud/deploy.yaml
```
<a name="ci/cd"/>
# CI/CD with GitLab
TODO

<a name="contact"/>
# Contact
[Jakub Koziel](https://www.linkedin.com/in/jakubkozie%C5%82/) - feel free to contact me!
