# docker-terraform-aws

Same as the official [hashicorp/docker-hub-images](https://github.com/hashicorp/docker-hub-images), but without `ENTRYPOINT`.

Like some other CI/CD plateform Gitlab CI does not let you override `ENTRYPOINT`, meaning you can't use the official terraform image in your Gitlab-CI builds.

This image removes the entrypoint, allowing the container operator (the Gitlab-CI runner) to specify which `CMD` to invoke the container with.

This image also contain additional tools:
 * AWS CLI
 * AWS EB CLI
 * AWS S3 CLI
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
          - image: basile/terraform-aws:0.11.14


# Builds

```bash
    $ bash build.sh
```