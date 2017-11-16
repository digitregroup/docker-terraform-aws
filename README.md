# docker-gitlab-ci-terraform

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

    image: exaprint/gitlab-ci-terraform:latest

    test:
      script:
        - terraform --version


# Builds

```bash
    $ bash build.sh
```