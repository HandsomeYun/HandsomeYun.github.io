---
layout: post
title: "Docker Understanding"
date: 2023-09-11 16:00:00
description: "A step-by-step guide to understand docker."
tags: docker
categories: devops
featured: false
---

# What is Docker?

The word "Docker" in English means "dockworker," which implies the idea of transporting things. This meaning aligns perfectly with Docker's functionality, which provides a way to containerize and transport our software and applications. Docker itself is a software program running on an operating system, providing a container environment that allows our programs to run independently within the container. The official name "Docker" is indeed very fitting.

In simple terms, when we set up our web application in a distributed manner, we need to add servers and configure the necessary components for the web, such as databases, web servers, and runtimes, on each server. Only then can our website run properly. However, every time we add a server, we have to reconfigure everything, which is cumbersome. With Docker, we can package our website and all necessary configurations into an image (Docker image), then install Docker on the server, pull the packaged image using Docker, and directly run it (as a container). This approach eliminates the need for manual configuration, making it very convenient and easier to manage. If we update the configurations within the image, all the containers will be updated as well, and so will our website—this is particularly convenient.

## So, What Exactly is Docker?

Docker is a platform for building, testing, deploying, and publishing containerized applications. It is referred to as a platform because Docker is actually a suite of tools for managing all things related to containers.

## Features of Docker

1. **Build, Ship, and Run**
2. **Build Once, Run Anywhere**

## Docker vs. Virtual Machines

Docker is similar to virtual machines (VMs). A virtual machine is essentially a virtual computer running on your operating system, where you can install and run various software just like on a real computer. You can take this virtual computer (which is essentially a file) and run it on any other computer with a virtual machine installed, without having to reinstall or configure anything—it’s very convenient.

Docker provides a similar technology, but with higher efficiency, faster startup times, and lower resource consumption compared to virtual machines. Virtual machines are more cumbersome because there is a fundamental difference in the way VMs and Docker work.

### How Virtual Machines Operate:

Virtual machines virtualize hardware resources, dividing them up and creating multiple operating systems, essentially creating a complete virtual computer.

### How Docker Operates:

Docker virtualizes software resources, dividing the computer's network, storage, etc., into separate containers. Our software runs within these containers, each container only using a portion of the computer's resources—not a complete virtual computer. Therefore, from an operational standpoint, Docker is more lightweight, whereas virtual machines are more cumbersome. Docker also starts up much faster and is easier to deploy, which is why more and more people are adopting Docker. Docker itself is not a container but a tool for creating containers, while a virtual machine is just that—a virtual machine.
