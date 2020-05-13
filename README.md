# Step 4: AJAX requests with JQuery

Arrêt de tous les containers
`docker kill <container_name> ...`
`docker rm $(docker ps -qa)`

Modification du Dockerfile de apache-php-image pour y installer nvim

```dockerfile
FROM php:7.2-apache

RUN apt update && apt install -y neovim

COPY content/ /var/www/html/
```

`docker build -t res/apache-php .`



Même chose pour apache-reverse-proxy

```dockerfile
FROM php:7.2-apache

RUN apt update && apt install -y neovim

COPY conf/ /etc/apache2

RUN a2enmod proxy proxy_http
RUN a2ensite 000-* 001-*
```

`docker build -t res/apache_rp .`



Et finalement pour express-image-*

```dockerfile
FROM node:12.16.3

RUN apt update && apt install -y neovim

COPY src/ /opt/app

CMD ["node", "/opt/app/index.js"]
```

`docker build -t res/express_students_node .`

`docker build -t res/express_students_express .`