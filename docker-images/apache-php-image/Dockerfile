FROM php:7.2-apache

LABEL traefik.http.routers.static.rule=Host(`res.ch`)
LABEL traefik.http.services.static.loadbalancer.server.port=80
LABEL traefik.http.services.static.loadbalancer.sticky.cookie.name="stickyCookie"

RUN apt update && apt install -y neovim

COPY content/ /var/www/html/
