FROM node:8.1.0-alpine

RUN apk update
RUN apk upgrade
RUN apk add ca-certificates && update-ca-certificates
RUN apk add --no-cache --update \
    curl \
    unzip \
    bash \
    python \
    py-pip \
    git \
    openssh \
    make \
    jq \
    tzdata

RUN pip install --upgrade pip
RUN pip install awscli
RUN rm /var/cache/apk/*

RUN mkdir -p /opt/workspace
WORKDIR /opt/workspace

RUN npm install serverless -g
