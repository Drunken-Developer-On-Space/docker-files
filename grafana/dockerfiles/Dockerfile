### Set base image (Alpine Linux)
FROM docker.io/library/alpine:latest
LABEL maintainer "unyoi<parkyoon23@gmail.com>"

## Install Grafana
RUN apk update && apk add grafana

## Setting Variables for Grafana
ENV GF_PATHS_CONFIG="/etc/grafana.ini" \
    GF_PATHS_DATA="/var/lib/grafana" \
    GF_PATHS_HOME="/usr/share/grafana" \
    GF_PATHS_LOGS="/var/log/grafana" \
    GF_PATHS_PLUGINS="/var/lib/grafana/plugins" \
    GF_PATHS_PROVISIONING="/usr/share/grafana/conf/provisioning"

### Set "grafana-server" Binary Path for working directory
WORKDIR "/usr/sbin"

COPY run.sh .
RUN chmod u+x run.sh

### Set Grafana UI(Dashboard) port
EXPOSE 3000

## Start Grafana
CMD /usr/sbin/run.sh
