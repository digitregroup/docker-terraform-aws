# docker-terraform-aws

Same as the official [hashicorp/docker-hub-images](https://github.com/hashicorp/docker-hub-images), but without `ENTRYPOINT`.

Like some other CI/CD plateform Gitlab CI does not let you override `ENTRYPOINT`, meaning you can't use the official terraform image in your Gitlab-CI builds.

This image removes the entrypoint, allowing the container operator (the Gitlab-CI runner) to specify which `CMD` to invoke the container with.

Base image is: alpine 3.10.3

This image also contain additional tools:
 * AWS CLI [aws-cli 1.16.278]
 * AWS EB CLI [awsebcli 3.15.3]
 * AWS S3 CLI [s3cmd 2.0.2]
 * JQ
 * WGET

## Example

`.gitlab-ci.yml` file example:

    image: basile/terraform-aws:latest

    test:
      script:
        - terraform --version


`.circleci/config.yml` file example:

    build:
        docker:
          - image: basile/terraform-aws:0.12.19


# Builds

```bash
    $ bash build.sh
```