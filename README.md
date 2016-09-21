## rabbitmq Dockerfile


This repository contains **Dockerfile** of [rabbitmq](http://www.rabbitmq.com/) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/puckel/docker-rabbitmq/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).


### Base Docker Image

* [puckel/docker-base](https://registry.hub.docker.com/u/puckel/docker-base/)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/puckel/docker-rabbitmq/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull puckel/docker-rabbitmq`

Alternatively, you can build an image from [Dockerfile](https://github.com/puckel/docker-rabbitmq)

## RabbitMQ Admin Interface

The web UI is located at: http://container-ip:15672/
The HTTP API and its documentation are both located at: http://container-ip:15672/api/ (or view our latest HTTP API documentation here).
You can download rabbitmqadmin at: http://container-ip:15672/cli/

login/pass = guest/guest by default

See "Configuration" to create a custom user/pass/(vhost)

## Configuration

This configuration use all default configuration from RabbitMQ, except this:

- set ulimit -S -n 65536 on startup
- some plugins are enabled

You can set environment variable to automaticately create a user/pass and associate a vhost (optional) :

- RABBITMQ_USER
- RABBITMQ_PASSWORD
- RABBITMQ_VHOST

/!\ This user became the new "admin" (guest user is deleted at startup)

### Enabled plugins

- rabbitmq_mqtt
- rabbitmq_stomp
- rabbitmq_management
- rabbitmq_management_agent
- rabbitmq_management_visualiser
- rabbitmq_federation
- rabbitmq_federation_management
- sockjs

### Exposed Port

- AMQP: 5672
- (admin)Management interface: 15672
- epmd: 4369
- inet_dist_listen_min through inet_dist_listen_max ranges: 9100, 9101, 9102, 9103, 9104, 9105

### Usage

Default :
```bash
    docker run -d \
        --name rabbitmq \
        -p 15672:15672 \
        -p 5672:5672 \
        puckel/docker-rabbitmq
```

Create user/pass/vhost :
```bash
    docker run -d \
        --name rabbitmq \
        -p 15672:15672 \
        -p 5672:5672 \
        -e RABBITMQ_VHOST=myvhost \
        -e RABBITMQ_USER=myuser\
        -e RABBITMQ_PASSWORD=mypassword \
        puckel/docker-rabbitmq
```
