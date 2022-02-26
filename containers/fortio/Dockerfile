FROM ubuntu:focal
# https://hub.docker.com/_/ubuntu?tab=tags

LABEL maintainer="bartvanbos@gmail.com"

# Build arguments
ARG BUILD_DATE
ARG BUILD_VERSION
ARG DOCKER_ACCOUNT
ARG IMAGE_DESCRIPTION
ARG IMAGE_NAME
ARG FORTIO_VERSION
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

ENV FORTIO_VERSION=$FORTIO_VERSION

RUN apt update -y && apt install -y ca-certificates gnupg apt-transport-https gnupg2 curl lsb-release openssl

RUN curl -sL https://github.com/fortio/fortio/releases/download/v${FORTIO_VERSION}/fortio_${FORTIO_VERSION}_amd64.deb -o fortio.deb \
    && apt update -y \
    && dpkg -i fortio.deb \
    && rm -rf /var/lib/apt/lists/* \
    && rm fortio.deb \
    && mkdir -p /etc/fortio /var/lib/fortio

VOLUME /etc/fortio
VOLUME /var/lib/fortio
WORKDIR /var/lib/fortio

# Tcp and udp echo server port
EXPOSE 8078
# Grpc ping port
EXPOSE 8079
# Http echo port
EXPOSE 8080
# Redirector port
EXPOSE 8081

STOPSIGNAL SIGTERM

ENTRYPOINT ["/usr/bin/fortio"]
# start the server mode (grpc ping on 8079, http echo and UI on 8080, redirector on 8081) by default
CMD ["server", "-config", "/etc/fortio"]
# curl -s -d '{"url":"localhost:8080"}' "localhost:8080/fortio/rest/run" | jq
# curl -v -d '{"metadata": {"url":"localhost:8080", "c":"1", "n":"1", "async":"on", "save":"on"}}' "localhost:8080/fortio/rest/run?jsonPath=.metadata"