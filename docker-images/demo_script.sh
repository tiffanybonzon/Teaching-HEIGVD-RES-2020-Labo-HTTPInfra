#/bin/zsh

# Arrêt et suppression de tous les running containers
docker stop $(docker ps -qa)
docker rm $(docker ps -qa)

# Build des images
# PHP static
docker build -t res/apache-php apache-php-image/
# Express
docker build -t res/express-students-express express-image-node/
docker build -t res/express-students-express express-image-express/
# Reverse Proxy
docker build -t res/apache-rp apache-reverse-proxy/

# Lancement des containers dans le bon ordre (pour les IPs)
# PHP Static
docker run -d --name apache_static res/apache-php
# Express
docker run -d --name express_dynamic res/express-students-express
# Reverse Proxy (accessible sur ma machine par demo.res.ch:8080)
docker run -p 8080:80 -d res/apache-rp
