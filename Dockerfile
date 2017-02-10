FROM alpine:3.4

MAINTAINER Sergii Nuzhdin <ipaq.lw@gmail.com@gmail.com>

ENV KUBE_LATEST_VERSION="v1.5.2"

RUN apk add --update ca-certificates \
 && apk add --update -t deps curl \
 && apk add --update gettext \
 && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && apk del --purge deps \
 && rm /var/cache/apk/*
