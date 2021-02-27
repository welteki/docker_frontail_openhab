[![Docker Pulls](https://img.shields.io/docker/pulls/welteki/frontail-openhab.svg)](https://hub.docker.com/r/welteki/frontail-openhab)
[![Travis_master_branch](https://travis-ci.org/welteki/docker_frontail_openhab.svg?branch=master)](https://travis-ci.org/welteki/docker_frontail_openhab/branches)

## openHAB log viewer

Docker image to view your openHAB logs. Runs frontial to stream logs to the browser. Has the openHAB theme applied to it like in [openhabian](https://www.openhab.org/docs/installation/openhabian.html).

### Usage

```
docker run -d \
  --name frontail-openhab \
  -p 9001:9001 \
  -v /opt/openhab/userdata/logs:/var/log/openhab2:ro \
  welteki/frontail-openhab:latest
```

## License

MIT (c) 2018 Han Verstraete https://github.com/welteki
