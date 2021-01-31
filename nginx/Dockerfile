FROM alpine
LABEL maintainer "tunerprime"

RUN apk update \
    && apk add nginx \
    && mkdir -p /run/nginx

EXPOSE 80 443
CMD nginx -g 'daemon off;'
