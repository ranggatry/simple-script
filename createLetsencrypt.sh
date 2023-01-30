#!/bin/bash

DOMAIN=$1

/etc/init.d/haproxy stop && \
/usr/bin/certbot certonly --standalone --preferred-challenges http -d $DOMAIN --email helomocaas@gmail.com --agree-tos --non-interactive && \
cat /etc/letsencrypt/live/$DOMAIN/fullchain.pem /etc/letsencrypt/live/$DOMAIN/privkey.pem > /etc/haproxy/ssl/$DOMAIN.pem && \
/etc/init.d/haproxy restart