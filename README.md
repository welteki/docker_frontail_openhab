## openHAB log viewer
Docker image to view your openHAB logs. Runs frontial to stream logs to the browser. Has the openHAB theme applied to it like in [openhabian](https://www.openhab.org/docs/installation/openhabian.html).

### supported architectures
amd64, arm32v6, arm64v8

> no need to specify architecture during poll, just poll latest

## Remark:
Based on docker_multiarch_ci_pipeline by [Holger Imbery](https://github.com/holgerimbery). This is a docker implementation only. All credits for [frontail](https://github.com/mthenw/frontail) and the [openhabian](https://github.com/openhab/openhabian) layout belong to the original authors.

## License
MIT (c) 2018 Han Verstraete https://github.com/welteki