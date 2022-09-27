FROM alpine:3.16.2

ENV TERRAFORM_VERSION=1.3.0
ENV AWSCLI_VERSION=1.25.82
ENV AWSEBCLI_VERSION=3.20.3
ENV S3CMD_VERSION=2.2.0

RUN apk -v --update add \
        zip \
        git \
        groff \
        bash \
        wget \
        jq \
        libffi \
        gcc \
        libc-dev \
        python3 \
        musl-dev \
        python3-dev \
        openssl-dev \
        cargo \
        libffi-dev \
        py3-pip \
        groff \
        less \
        mailcap \
        openssh-client \
        make \
        cmake \
        && rm /var/cache/apk/*

RUN pip install cryptography --no-binary cryptography

RUN pip3 install --upgrade awscli==${AWSCLI_VERSION} --target /usr/local/lib/awscli \
    && printf '#!/bin/sh\nPYTHONPATH=/usr/local/lib/awscli /usr/local/lib/awscli/bin/aws "$@"\n' \
    > /usr/local/bin/aws \
    && chmod +x /usr/local/bin/aws

RUN pip3 install --upgrade awsebcli==${AWSEBCLI_VERSION} --target /usr/local/lib/awsebcli \
    && printf '#!/bin/sh\nPYTHONPATH=/usr/local/lib/awsebcli /usr/local/lib/awsebcli/bin/eb "$@"\n' \
    > /usr/local/bin/eb \
    && chmod +x /usr/local/bin/eb

RUN pip3 install --upgrade s3cmd==${S3CMD_VERSION} --target /usr/local/lib/s3cmd \
    && printf '#!/bin/sh\nPYTHONPATH=/usr/local/lib/s3cmd /usr/local/lib/s3cmd/bin/s3cmd "$@"\n' \
    > /usr/local/bin/s3cmd \
    && chmod +x /usr/local/bin/s3cmd

ADD https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip ./
ADD https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS ./

RUN cat terraform_${TERRAFORM_VERSION}_SHA256SUMS | grep terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_SHA256SUMS
RUN sha256sum -cs terraform_SHA256SUMS
RUN unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin
RUN rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip terraform_SHA256SUMS
