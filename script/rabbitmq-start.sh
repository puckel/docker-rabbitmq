#!/bin/bash
set -e

if [[ -n "${RABBITMQ_USER}" && -n ${RABBITMQ_PASSWORD} ]]; then
  rabbitmq-server -detached
  sleep 6
  rabbitmqctl add_user ${RABBITMQ_USER} ${RABBITMQ_PASSWORD}
  rabbitmqctl set_user_tags ${RABBITMQ_USER} administrator
  if [ -n "${RABBITMQ_VHOST}" ]; then
    rabbitmqctl add_vhost ${RABBITMQ_VHOST}
    rabbitmqctl set_permissions -p ${RABBITMQ_VHOST} ${RABBITMQ_USER} .\* .\* .\*
  fi
  rabbitmqctl delete_user guest
  rabbitmqctl stop
  sleep 4
fi

ulimit -S -n 65536
rabbitmq-server
