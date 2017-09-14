# RabbitMQ autocluster image

This Docker image has builtin the autocluster plugin and is configured to
support a deployment in Kubernetes as a stateful set with persistent volumes
attached to the pods.

This ensures a highly available cluster which can recover, in case of a full outage,
from persistence.

See the Kubernetes example [here](https://github.com/foxylion/docker-rabbitmq/blob/master/examples/kubernetes.yml).

To start this in your `minikube` cluster just call `kubectl apply -f examples/kubernetes.yml`.
This will create a 3 node RabbitMQ cluster with persistence volumes attached to
the storage. So even a StatefulSet scale to 0 the cluster will survive.

The example configures the cluster to stop when a partition detects to be a minority
and restarts after a majority is gained. More about this can be found in the RabbitMQ
[documentation](https://www.rabbitmq.com/partitions.html#automatic-handling).

This is important to know. Because it is not possible to simply scale down the
StatefulSet from `7` to `3` nodes. You will need to slowly scale down the cluster
and remove down nodes. Otherwise the resulting 3-node cluster will not be the
majority of all defined nodes.

## Available docker image tags

### `3.6-autocluster` [![Docker Stars](https://img.shields.io/docker/stars/foxylion/rabbitmq.svg?style=flat-square)](https://hub.docker.com/r/foxylion/rabbitmq/) [![Docker Pulls](https://img.shields.io/docker/pulls/foxylion/rabbitmq.svg?style=flat-square)](https://hub.docker.com/r/foxylion/rabbitmq/)
This is image based on `rabbitmq:3.6-alpine` with the following plugins
enabled: `rabbitmq_management`, `rabbitmq_shovel`, `rabbitmq_shovel_management`, `autocluster`
