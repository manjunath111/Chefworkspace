# Habitat Quick Start Guide 

Welcome to the Habitat Quick Start Guide! This guide will walk you through the process of using Habitat, an open-source project by Chef, that enables you to package your applications and manage their configuration and behavior seamlessly.

## Introduction

Habitat moves an application's configuration, management, and behavior into the application itself, rather than relying on the underlying infrastructure. It works for both new and existing applications and offers the following benefits:

- Build packages that include everything needed for your application to run.
- Deploy applications on various platforms like bare metal, VMs, cloud, Docker, Mesos, Kubernetes, and more.
- Manage running applications and respond to configuration changes made by other services.

In this guide, you'll learn how to build, deploy, and manage a basic web application that includes a load balancer, all from your workstation.

## System Requirements

To follow this guide, you'll need the following:

- A Windows 10, macOS, or 64-bit Linux system that can run both Habitat and Docker.
- A GitHub account for authentication with Habitat's Builder service.

## Getting Started

### 1. Install Habitat and Configure Workstation

Before you begin, create a Habitat Builder account. You'll need a Personal Access Token to configure your workstation.

- Create a Builder Account
- Create an Origin on Builder
- Generate an Access Token
- Set up 'HAB_ORIGIN' and 'HAB_AUTH_TOKEN' environment variables

For detailed instructions on setting up Habitat and configuring your workstation, refer to the [official documentation](https://www.habitat.sh/docs/install-habitat/).

### 2. Install Docker and Docker Compose

After setting up Habitat, you'll build and export your packages to various environments. Docker is used in this guide for exporting packages.

- Install Docker for your platform
- Install Docker Compose

### 3. Get the Source Code

Clone the `hab-two-tier` project from GitHub, which contains the source code and Habitat plans for the web application and load balancer.

git clone https://github.com/learn-chef/hab-two-tier.git

cd hab-two-tier

4. Build the Habitat Packages

Build the Habitat packages for the web application and load balancer using the Habitat Studio.

hab studio enter

build haproxy

build webapp

5. Run the Web Application

Load the web application service using the Habitat Supervisor within the Habitat Studio.

hab svc load $HAB_ORIGIN/webapp

6. Publish Packages to Habitat Builder

Upload the built packages to Habitat Builder for sharing and distribution.

hab pkg upload results/$HAB_ORIGIN-webapp-<version>-<release>-x86_64-linux.hart
hab pkg upload results/$HAB_ORIGIN-haproxy-<version>-<release>-x86_64-linux.hart

7. Export Packages to Docker

Export the Habitat packages to Docker images.

hab pkg export docker $HAB_ORIGIN/webapp
hab pkg export docker -c unstable $HAB_ORIGIN/haproxy

8. Launch Docker Containers

Use Docker Compose to start the web servers and load balancer.

docker-compose up -d

9. See the Result

Access the load-balanced web application by navigating to http://localhost:8000 in your web browser. The load balancer will distribute traffic among the web servers.

Adding a Third Web Server

To demonstrate dynamic scaling, you can add a third web server to the network.

docker run --network=habquickstart_default --name web-3 --env HAB_LICENSE=accept-no-persist -d $HAB_ORIGIN/webapp --peer web-1

Refresh your browser to see the load balancer distributing traffic among all three web servers.

Conclusion
Congratulations! You've successfully learned how to use Habitat to build, deploy, and manage applications in various environments. For more advanced topics and details, refer to the official documentation.
