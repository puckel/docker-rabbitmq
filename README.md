## rabbitmq Dockerfile


This repository contains **Dockerfile** of [rabbitmq](http://www.rabbitmq.com/) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/puckel/docker-rabbitmq/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).


### Base Docker Image

* [puckel/docker-base](https://registry.hub.docker.com/u/puckel/docker-base/)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/puckel/docker-rabbitmq/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull puckel/docker-rabbitmq`

Alternatively, you can build an image from [Dockerfile](https://github.com/puckel/docker-rabbitmq)

### Usage

```bash
    docker run -d \
        --name rabbitmq \
        -p 15672:15672 \
        puckel/docker-rabbitmq
```
