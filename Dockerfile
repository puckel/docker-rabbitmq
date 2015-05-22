# VERSION 1.0
# AUTHOR: Matthieu "Puckel_" Roisil
# DESCRIPTION: Basic rabbitmq-based
# BUILD: docker build --rm -t puckel/rabbitmq
# SOURCE: https://github.com/puckel/docker-rabbitmq

FROM puckel/docker-base
MAINTAINER Puckel_

# Never prompts the user for choices on installation/configuration of packages
ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux
# Work around initramfs-tools running on kernel 'upgrade': <http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=594189>
ENV INITRD No

RUN echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list \
    && curl -s http://www.rabbitmq.com/rabbitmq-signing-key-public.asc|apt-key add - \
    && apt-get update -yqq \
    && apt-get install -yqq \
    rabbitmq-server \
    && apt-get clean \
    && rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/* \
    /usr/share/man \
    /usr/share/doc \
    /usr/share/doc-base

RUN rabbitmq-plugins enable rabbitmq_management

# For RabbitMQ and RabbitMQ Admin
EXPOSE 5672 15672

ENTRYPOINT ["/usr/sbin/rabbitmq-server"]
