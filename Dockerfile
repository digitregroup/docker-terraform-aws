FROM alpine:3.10.3
MAINTAINER "L0gIn <basiletrujillo@gmail.com>"

ENV TERRAFORM_VERSION=0.12.19

RUN apk -v --update add \
        zip \
        git \
        groff \
        bash \
        wget \
        jq \
        python \
        py-pip \
        python-dev \
        groff \
        less \
        mailcap \
        openssh-client \
        && rm /var/cache/apk/*

RUN pip install --upgrade awscli==1.16.278 --target /usr/local/lib/awscli \
    && printf '#!/bin/sh\nPYTHONPATH=/usr/local/lib/awscli /usr/local/lib/awscli/bin/aws "$@"\n' \
    > /usr/local/bin/aws \
    && chmod +x /usr/local/bin/aws

RUN pip install --upgrade awsebcli==3.15.3 --target /usr/local/lib/awsebcli \
    && printf '#!/bin/sh\nPYTHONPATH=/usr/local/lib/awsebcli /usr/local/lib/awsebcli/bin/eb "$@"\n' \
    > /usr/local/bin/eb \
    && chmod +x /usr/local/bin/eb

RUN pip install --upgrade s3cmd==2.0.2 --target /usr/local/lib/s3cmd \
    && printf '#!/bin/sh\nPYTHONPATH=/usr/local/lib/s3cmd /usr/local/lib/s3cmd/bin/s3cmd "$@"\n' \
    > /usr/local/bin/s3cmd \
    && chmod +x /usr/local/bin/s3cmd

ADD https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip ./
ADD https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS ./

RUN cat terraform_${TERRAFORM_VERSION}_SHA256SUMS | grep terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_SHA256SUMS
RUN sha256sum -cs terraform_SHA256SUMS
RUN unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin
RUN rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip