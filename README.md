# Running app

# General Information
It's a simple Vaadin application that allows the user to add information about their running performance.\
The main purpose of this application was to use the knowledge about Kubernetes gained during learning this tool

# Technical Stack
* Vaadin
* Docker
* Kubernetes
* Helm 
* Gitlab

# Installation and running

**To run the application, you can use one of two methods.**

1.Launching the application from the Docker container

The application's image is available on DockerHub. To run the container with the application, use the below command:

`docker container run -d --name running-app --rm -p 8080:8080 kozijakinfo/run-app:2.0`
