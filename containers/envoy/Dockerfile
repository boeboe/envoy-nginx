FROM ubuntu:focal
# https://hub.docker.com/_/ubuntu?tab=tags

LABEL maintainer="bartvanbos@gmail.com"

# Build arguments
ARG BUILD_DATE
ARG BUILD_VERSION
ARG DOCKER_ACCOUNT
ARG IMAGE_DESCRIPTION
ARG IMAGE_NAME
ARG ENVOY_VERSION
ARG REPO_URL
ARG URL

# Labels
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.description=$IMAGE_DESCRIPTION
LABEL org.label-schema.name=$DOCKER_ACCOUNT/$IMAGE_NAME
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.url=$URL
LABEL org.label-schema.vcs-url=$REPO_URL
LABEL org.label-schema.vendor=$DOCKER_ACCOUNT
LABEL org.label-schema.version=$BUILD_VERSION

ENV ENVOY_VERSION=$ENVOY_VERSION

RUN apt update -y && apt install -y ca-certificates gnupg apt-transport-https gnupg2 curl lsb-release openssl

ADD ./envoy.list /etc/apt/sources.list.d/envoy.list
RUN curl -sL https://deb.dl.getenvoy.io/public/gpg.8115BA8E629CC074.key | apt-key add - \
    && apt update -y \
    && apt install getenvoy-envoy=${ENVOY_VERSION} -y \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /etc/envoy/conf.d

ADD config/envoy.yaml /etc/envoy/envoy.yaml
ADD entrypoint.sh /usr/local/bin

EXPOSE 80
VOLUME [ "/etc/envoy" ]

STOPSIGNAL SIGTERM

CMD ["entrypoint.sh"]
