# docker-terraform-aws

[![](https://images.microbadger.com/badges/version/digitregroup/terraform-aws.svg)](https://hub.docker.com/repository/docker/digitregroup/terraform-aws)
[![](https://images.microbadger.com/badges/image/digitregroup/terraform-aws.svg)](https://hub.docker.com/repository/docker/digitregroup/terraform-aws)

[![](https://dockeri.co/image/digitregroup/terraform-aws)](https://hub.docker.com/r/digitregroup/terraform-aws)

Same as the official [hashicorp/docker-hub-images](https://github.com/hashicorp/docker-hub-images), but without `ENTRYPOINT`.

Like some other CI/CD plateform Gitlab CI does not let you override `ENTRYPOINT`, meaning you can't use the official terraform image in your Gitlab-CI builds.

This image removes the entrypoint, allowing the container operator (the Gitlab-CI runner) to specify which `CMD` to invoke the container with.

Base image is: alpine 3.16.2

This image also contain additional tools:
 * AWS CLI [aws-cli 1.25.82]
 * AWS EB CLI [awsebcli 3.20.3]
 * AWS S3 CLI [s3cmd 2.2.0]
 * JQ
 * WGET

## Example

`.gitlab-ci.yml` file example:

    image: digitregroup/terraform-aws:latest

    test:
      script:
        - terraform --version


`.circleci/config.yml` file example:

    build:
        docker:
          - image: digitregroup/terraform-aws:1.3.0


# Builds

```bash
    $ bash build.sh
```
