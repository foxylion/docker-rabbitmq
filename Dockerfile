FROM rabbitmq:3.6-alpine

RUN apk add --update curl && \
    rm -rf /var/cache/apk/*

ENV AUTOCLUSTER_VERSION=0.8.0

RUN  curl -sL -o /plugins/rabbitmq_aws-0.8.0.ez https://github.com/rabbitmq/rabbitmq-autocluster/releases/download/${AUTOCLUSTER_VERSION}/rabbitmq_aws-${AUTOCLUSTER_VERSION}.ez && \
    curl -sL -o /plugins/autocluster-0.8.0.ez https://github.com/rabbitmq/rabbitmq-autocluster/releases/download/${AUTOCLUSTER_VERSION}/autocluster-${AUTOCLUSTER_VERSION}.ez

RUN rabbitmq-plugins --offline enable rabbitmq_management rabbitmq_shovel rabbitmq_shovel_management autocluster

COPY entrypoint/docker-entrypoint.patch /tmp
RUN patch /usr/local/bin/docker-entrypoint.sh < /tmp/docker-entrypoint.patch
