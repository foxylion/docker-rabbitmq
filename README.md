# RabbitMQ autocluster image

This Docker image has builtin the autocluster plugin and is configured to
support a deployment in Kubernetes as a stateful set with persistent volumes
attached to the pods.

This ensures a highly available cluster which can recover, in case of a full outage,
from persistence.

See the Kubernetes example [here](examples/kubernetes.yml).

## Available docker image tags

### `3.6-autocluster` [![Docker Stars](https://img.shields.io/docker/stars/foxylion/rabbitmq.svg?style=flat-square)](https://hub.docker.com/r/foxylion/rabbitmq/) [![Docker Pulls](https://img.shields.io/docker/pulls/foxylion/rabbitmq.svg?style=flat-square)](https://hub.docker.com/r/foxylion/rabbitmq/)
This is image based on `rabbitmq:3.6-alpine` with the following plugins
enabled: `rabbitmq_management`, `rabbitmq_shovel`, `rabbitmq_shovel_management`, `autocluster`
