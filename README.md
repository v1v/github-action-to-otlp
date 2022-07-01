# Github Action to OTLP

*NOTE: This is still work in progress*

This action outputs Github Action workflows and jobs details to OTLP via gRPC.

## Inputs

## `endpoint`

**Required** The OTLP endpoint which will receive the data.

## `headers`

**Optional** Additional header configuration to pass in as metadata to the gRPC connection.

## `repo-token`

**Optional** Token to use to authorize access to private repositories. Typically the `GITHUB_TOKEN` secret, with `checks:read` access.

## Example usage

```
uses: codeboten/github-action-to-otlp@v1
with:
  endpoint: 'grpc.otlpendpoint.io:443'
```

## Example usage in a private repository

```
uses: codeboten/github-action-to-otlp@v1
with:
  endpoint: 'grpc.otlpendpoint.io:443'
  repo-token: ${{ secrets.GITHUB_TOKEN }}
```

## OpenTelemetry Attributes

#### SCM attributes

The tool will add the following attributes to each trace:

| Attribute | Description |
| --------- | ----------- |
| `scm.ref` | Sha commit |
| `scm.branch` | Name of the branch where the test execution is processed |

## Makefile

Build the docker image with the usual

    make build

Publish the docker image locally to dockerhub with

    VERSION=1.2.3 make publish

NOTE: VERSION refers to the tag for the docker image which will be published in the registry
