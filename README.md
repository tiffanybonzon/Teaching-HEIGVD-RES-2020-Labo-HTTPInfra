## Step 2: Dynamic HTTP server with express.js

## Node

La dernière version stable d'apres le site officiel est 12.16.3 (https://nodejs.org/en/)

Le Dockerfile

```dockerfile
FROM node:12.16.3

COPY src/ /opt/app

CMD ["node", "/opt/app/index.js"]
```

dans le dossier local src/

`npm init` 

`npm install --save chance`

fichier index.js

```
sum code
```

Build de l'image docker

`docker build -t res/express_students .`

Run l'image

`docker run res/express_students`

## Express

