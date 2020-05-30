# Step 1: Static HTTP server with apache httpd

## Choix de l'image

On utilise l'image Docker officielle php (https://hub.docker.com/_/php/)

- Copier ces lignes dans le Dockerfile

```dockerfile
FROM php:7.2-apache

COPY content/ /var/www/html/
```

## Exploration de l'image

- Lancer le container
  - `docker run -d -p 9090:80 php:7.2-apache`

- Il est également possible d'accéder au container en mode interactif afin d'explorer le filesystem

  - `docker exec -it <container_name> /bin/bash` 

  - La configuration se trouve dans `/etc/apache2`

- `docker logs <container_name>` 
  - Nous indique qu'Apache a bien démarré sans erreurs

Un telnet rapide nous montre que le serveur écoute bien sur le port 80 (port mapping de 9090 à 80) et répond, mais indique une erreur 403

![](images/telnet403.png)

- On peut également accéder au serveur avec l'adresse 172.17.0.2:80 (adresse IP du container)

## Ajout de contenu à notre image

- Création d'un fichier index.html dans le dossier `content/`

- Build de l'image
  
- `docker build -t res/apache-php .`
  
- Run de l'image
  - `docker run -p 9090:80 -d res/apache-php`

    

On peut maintenant afficher notre index depuis notre navigateur web

- Il est aussi possible de lancer un deuxième container basé sur notre image mais il faut changer le port mapping
  - `docker run -p 9091:80 -d res/apache-php`

## Template

- Téléchargement d'un template ~~random~~ sympa https://bootstrapmade.com/knight-free-bootstrap-theme/

- Désarchivage dans le dossier `content`
- Rebuild de l'image
- Lancement du container basé sur l'image avec les sources à jour

Le template est maintenant visible sur notre server Apache

### Personnalisation

Suppression de sections, modification de certains textes...

Il faut: 

- Rebuild l'image, et 
- Re-run un container pour que ces modifications soient visibles sur le serveur Apache

Le script de démo se trouve dans `docker-images/apache-php-image`

