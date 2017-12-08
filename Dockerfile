FROM alpine:latest
MAINTAINER "L0gIn <basiletrujillo@gmail.com>"

ENV TERRAFORM_VERSION=0.10.8

RUN apk -v --update add \
        zip \
        git \
        bash \
        wget \
        jq \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        openssh-client \
        && \
    pip install --upgrade pip && \
    pip install --upgrade setuptools distribute awscli s3cmd awsebcli python-magic && \
    rm /var/cache/apk/*

ADD https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip ./
ADD https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS ./

RUN cat terraform_${TERRAFORM_VERSION}_SHA256SUMS | grep terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_SHA256SUMS
RUN sha256sum -cs terraform_SHA256SUMS
RUN unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin
RUN rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip