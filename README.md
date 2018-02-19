# Docker-Tsschecker

[![](https://images.microbadger.com/badges/version/waja/project.svg)](https://hub.docker.com/r/waja/project/)
[![](https://images.microbadger.com/badges/image/waja/project.svg)](https://hub.docker.com/r/waja/project/)
[![Build Status](https://travis-ci.org/Cyconet/docker-tsschecker.svg?branch=development)](https://travis-ci.org/Cyconet/docker-tsschecker)
[![Docker Build Status](https://img.shields.io/docker/build/waja/tsschecker.svg)](https://hub.docker.com/r/waja/tsschecker/)
[![GitHub tag](https://img.shields.io/github/tag/Cyconet/docker-tsschecker.svg)](https://github.com/Cyconet/docker-tsschecker/tags)
[![](https://img.shields.io/docker/pulls/waja/tsschecker.svg)](https://hub.docker.com/r/waja/tsschecker/)
[![](https://img.shields.io/docker/stars/waja/tsschecker.svg)](https://hub.docker.com/r/waja/tsschecker/)
[![](https://img.shields.io/docker/automated/waja/tsschecker.svg)](https://hub.docker.com/r/waja/tsschecker/)

Builds a docker image with the [tsschecker](https://github.com/tihmstar/tsschecker) ready to run.


Running
-------

- run the docker container with:

```
docker run --rm --net=host waja/tsschecker -h
```

We don't actually _require_ `--net=host`, but if we're wanting to test native performance (or use `--source some-specific-host-IP`) then we want direct access to the relevant connections without any overhead.

Building
--------

```
make build
```

Get a shell in a running container
----------------------------------

```
make shell
```
