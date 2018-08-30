[![Docker Pulls](https://img.shields.io/docker/pulls/welteki/frontail-openhab.svg)](https://hub.docker.com/r/welteki/frontail-openhab)
[![Travis_master_branch](https://travis-ci.org/welteki/docker_frontail_openhab.svg?branch=master)](https://travis-ci.org/welteki/docker_frontail_openhab/branches)

## openHAB log viewer
Docker image to view your openHAB logs. Runs frontial to stream logs to the browser. Has the openHAB theme applied to it like in [openhabian](https://www.openhab.org/docs/installation/openhabian.html).

### Supported architectures
amd64, arm32v6, arm64v8

> no need to specify architecture during pull, just pull latest

### Usage
```
docker run -d \
  --name frontail-openhab \ 
  -p 9001:9001
  -v /opt/openhab/userdate/logs:/openhab/userdata/logs welteki/frontial-openhab:latest
```

## Remark:
Based on [docker_multiarch_ci_pipeline](https://github.com/holgerimbery/docker_multiarch_ci_pipeline) by [Holger Imbery](https://github.com/holgerimbery). This is a docker implementation only. All credits for [frontail](https://github.com/mthenw/frontail) and the [openhabian](https://github.com/openhab/openhabian) layout belong to the original authors.

## License
MIT (c) 2018 Han Verstraete https://github.com/welteki