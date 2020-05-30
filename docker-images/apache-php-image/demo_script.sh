#/bin/zsh

# Arrêt et suppression de tous les running containers
docker stop $(docker ps -qa)
docker rm $(docker ps -qa)

# Build de l'image avec le dossier content (spécifié dans le Dockerfile)
docker build -t res/apache-php .

# Lancement du container (accessible sur ma machine par localhost:9090 ou IP_container:80)
docker run -p 9090:80 -d res/apache-php
