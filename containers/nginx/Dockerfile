FROM ubuntu:focal
# https://hub.docker.com/_/ubuntu?tab=tags

LABEL maintainer="bartvanbos@gmail.com"

# Build arguments
ARG BUILD_DATE
ARG BUILD_VERSION
ARG DOCKER_ACCOUNT
ARG IMAGE_DESCRIPTION
ARG IMAGE_NAME
ARG NGINX_VERSION
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

ENV NGINX_VERSION=$NGINX_VERSION

RUN apt update -y && apt install -y ca-certificates gnupg apt-transport-https gnupg2 curl lsb-release openssl

ADD ./nginx.list /etc/apt/sources.list.d/nginx.list
RUN curl -sL https://nginx.org/keys/nginx_signing.key | apt-key add - \
    && apt update -y \
    && apt install nginx=${NGINX_VERSION}~focal -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /etc/nginx/*

ADD config/nginx.conf /etc/nginx/nginx.conf
ADD entrypoint.sh /usr/local/bin

EXPOSE 80
VOLUME [ "/etc/nginx" ]

STOPSIGNAL SIGTERM

CMD ["entrypoint.sh"]
