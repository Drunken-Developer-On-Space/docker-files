### Set base image (Alpine Linux)
FROM docker.io/library/alpine:latest
LABEL maintainer "unyoi<parkyoon23@gmail.com>"

## Install Influxdb
RUN apk update && \
    apk add \
    influxdb \
    openrc --no-cache

### Set InfluxDB API port
EXPOSE 8086

### Start InfluxDB
CMD rc-update add influxdb default && \
    openrc default
