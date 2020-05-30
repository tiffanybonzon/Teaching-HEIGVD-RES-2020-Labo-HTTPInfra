#/bin/zsh

# Arrêt et suppression de tous les running containers
docker stop $(docker ps -qa)
docker rm $(docker ps -qa)

# Build des images
# PHP static
docker build -t res/apache-php apache-php-image/
# Express
docker build -t res/express-students-express express-image-express/
# Reverse Proxy
docker build -t res/apache-rp apache-reverse-proxy/

# Lancement des containers dans le bon ordre (pour les IPs)
# 4 PHP Static
docker run -d res/apache-php
docker run -d res/apache-php
docker run -d res/apache-php
docker run -d --name apache_php res/apache-php
# 3 Express
docker run -d res/express-students-express
docker run -d res/express-students-express
docker run -d --name express_dynamic res/express-students-express
# Reverse Proxy
docker run -d -e STATIC_IP=172.17.0.5 -e DYNAMIC_IP=172.17.0.8:3000 -p 8080:80 --name rp res/apache_rp
