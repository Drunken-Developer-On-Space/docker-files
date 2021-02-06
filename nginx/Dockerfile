FROM alpine
LABEL maintainer="tunerprime"

RUN apk update \
    && apk add nginx \
    && mkdir -p /run/nginx \ # saved pid path
    && apk add openssl \
    && mkdir -p /root/ssl && cd /root/ssl \
    && openssl ecparam -out rootca.key -name prime256v1 -genkey \
    && openssl req -new -sha256 -key rootca.key -out rootca.csr -subj "/C=KR/ST=Gyeonggi-do/L=Anyang/O=Drunken Developer On Space/OU=Nginx Part/CN=localhost" \
    && openssl x509 -req -sha256 -days 999999 -in rootca.csr -signkey rootca.key -out rootca.crt \
    && openssl ecparam -out server.key -name prime256v1 -genkey \
    && openssl req -new -sha256 -key server.key -out server.csr -subj "/C=KR/ST=Gyeonggi-do/L=Anyang/O=Drunken Developer On Space/OU=Nginx Part/CN=localhost" \
    && openssl x509 -req -sha256 -days 999999 -in server.csr -CA rootca.crt -CAkey rootca.key -CAcreateserial -out server.crt \
    && openssl x509 -in server.crt -text -noout \
    && cat server.crt rootca.crt > server.pem \
    && mv /root/ssl /var/ssl \
    && mkdir -p /usr/share/nginx/html

COPY index.html /usr/share/nginx/html/
COPY ssl.conf /etc/nginx/http.d/

EXPOSE 80 443
CMD nginx -g 'daemon off;'





