## Running app

## Table of Contents

* [General Information](#general-information)
* [Project Description](#project-description)
* [Technical Stack](#technical-stack)
* [Provisioning Kubernetes Cluster](#provisioning-kubernetes-cluster)
* [Installation and running](#installation-and-running)
* [CICD using GitLab](#cicd-using-gitlab)
* [Contact](#contact)

## General Information
This is a simple Vaadin application that lets users add information about their running performance. 
The main purpose of this application is to apply the knowledge gained about Kubernetes while learning this tool.

## Project Description
The main purpose of this project is to use Kubernetes to deploy the application. 
The project involves the following steps:

* Creating simple Vaadin application
* Provisioning Google Kubernetes Cluster using Terraform
* Creating a Dockerfile to build an application image according to best practices (multi-stage building, non-root user)
* Pushing the image to the repository(DockerHub)
* Creating Kubernetes object files (Deployment, Service, Ingress) to deploy application on cluster (used Google Kubernetes Engine)
* Creating Simple CI/CD pipeline using GitLab

## Technical Stack

* Vaadin
* Docker
* Kubernetes
* Helm
* Terraform
* Gitlab
* Bash

## Provisioning Kubernetes Cluster

The cluster was created using Infrastructure as Code (IaaC) to facilitate automation and reusability. Terraform was used for this task.

The code used to create the Google Kubernetes Cluster (GKE) can be viewed here [Terraform](https://github.com/jakubkoziel992/runs-app/tree/master/Terraform)

**I used the provider configuration approach as an environment variable.**\ 
You can find details in [.env](https://github.com/jakubkoziel992/runs-app/blob/master/Terraform/.env)

**Steps to be taken to provision GKE using Terraform:**

**1.Terraform Installation**\
**2.Loading environment variables**
```bash
   cd Terraform
   source .env
```
**3.Execution of Terraform commands**
```bash
   terraform init
   terraform plan
   terraform apply
```
Terraform apply sucessfully completed.

![Image](https://raw.githubusercontent.com/jakubkoziel992/runs-app/master/.github/terraform_apply.png)

GKE is visible from GCP console level.

![Image](https://raw.githubusercontent.com/jakubkoziel992/runs-app/master/.github/gke_console.png)

**4. GKE removal**
To avoid charges, I recommend removing the GKE after the work is completed.
```bash
   terraform destroy
```

For my purposes, I reduce the number of cluster nodes to 0 which reduces the cost significantly.
```bash
   terraform apply -var="my_nodes=0"
```

![Image](https://raw.githubusercontent.com/jakubkoziel992/runs-app/master/.github/gke_console2.png)


## Installation and running

**To run the application, you can use one of three methods.**

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

**All work releted to Kubernetes is done using Google Kubernetes Engine.**

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

![Image](https://raw.githubusercontent.com/jakubkoziel992/runs-app/master/.github/ingress_appliction.png)


**To stop the application run following commands:**

```
kubectl delete -f k8s/running-app-deployment.yml -f k8s/running-app-svc.yml -f k8s/ingress-resource.yml
```

```
kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.9.6/deploy/static/provider/cloud/deploy.yaml

**3.Deploy the application on Kubernetes cluster using Helm Chart.**
While in the main directory of the application, run the following commands:
```bash
cd Helm
helm install running-app ./running-app-custom-chart
```
**To stop the application run following commands:**

```bash
helm uninstall running-app
```


## CICD using GitLab

I used GitLab to create a CI/CD pipeline, which consists of two steps:
* build Docker Image and publish to registry(internal Gitlab registry)
* deployment of application in the Kubernetes cluster

Pipeline is run after every push to the GitLab repository.
![Image](https://raw.githubusercontent.com/jakubkoziel992/runs-app/master/.github/pipeline.png)




Here you can check the pipeline configuration file [gitlab](https://github.com/jakubkoziel992/runs-app/blob/master/.gitlab-ci.yml)

## Contact

[Jakub Koziel](https://www.linkedin.com/in/jakubkozieł/) - feel free to contact me!
