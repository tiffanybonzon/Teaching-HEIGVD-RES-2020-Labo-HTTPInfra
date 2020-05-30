#bin/zsh

# Arrêt et suppression de tous les running containers
docker stop $(docker ps -qa)
docker rm $(docker ps -qa)

# Build de l'image par rapport au Dockerfile
docker build -t res/express-students-express .

# Lancement du container (Résultat visible dans la console)
docker run -d -p 4242:3000 res/express-students-express
