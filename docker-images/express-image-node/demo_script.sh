#bin/zsh

# Arrêt et suppression de tous les running containers
docker stop $(docker ps -qa)
docker rm $(docker ps -qa)

# Build de l'image par rapport au Dockerfile
docker build -t res/express-students-node .

# Lancement du container (Résultat visible dans la console)
docker run res/express-students-node
