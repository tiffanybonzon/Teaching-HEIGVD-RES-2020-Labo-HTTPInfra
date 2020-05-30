# Step 2: Dynamic HTTP server with express.js

## Node

La dernière version stable d'après le site officiel est 12.16.3 (https://nodejs.org/en/)

- Copier ces lignes dans le Dockerfile

```dockerfile
FROM node:12.16.3

COPY src/ /opt/app

#indique la commande à faire à chaque run du container
CMD ["node", "/opt/app/index.js"] 
```

- Dans le dossier local `src/`
  - `npm init` 
  - Remplire les champs demandés

  - Installation du module node "chance"
    - `npm install --save chance` 

- Copier ces lignes dans le fichier `index.js`

```js
var Chance = require('chance');
var chance = new Chance();

console.log("Bonjour " + chance.name());
```

- Build de l'image docker
  - `docker build -t res/express_students_node .`

- Run l'image
  - `docker run res/express_students_node`



Le script de démo se trouve dans `docker-images/express-image-node`

## Express

- Reprise du Dockerfile décrit plus haut

- Installation du module node `express` dans le dossier `src/`
  - `npm install --save express`

- Copier ces lignes dans le fichier `index.js`

```js
var Chance = require('chance');
var chance = new Chance();

var express = require('express');
var app = express();

app.get('/', function(req, res) {
        res.send(generateCompanies());
});

app.get('/test', function(req, res) { // L'ordre n'a pas d'importance :)
        res.send("This is test");
});

app.listen(3000, function () {
        console.log("Accepting HTTP requests on port 3000");
});

function generateCompanies() {
        var numberOfCompanies = chance.integer({min: 1, max: 5});
        console.log("Generating " + numberOfCompanies + " companies )...");

        var companies = [];

        for(var i = 0; i < numberOfCompanies; ++i) {
                companies.push({
                        name: chance.company(),
                        logo: chance.avatar(),
                        country: chance.country({full: true}),
                        yearCreated: chance.year({min: 1950, max:2020}),
                        motto: chance.sentence({ words: 5 })
                });
        }

        console.log(companies);
        return companies;
}
```

- Build de l'image docker
  - `docker build -t res/express_students_express .`

- Run l'image
  - `docker run res/express_students_express`

- Il n'y a pour le moment pas de port mapping, il faut donc envoyer les requêtes au container directement
  - Son IP est trouvable avec `docker inspect <container_name>`
- Run avec port mapping

  - `docker run -p 4242:3000 res/express_students_express`
  - On a maintenant accès au serveur Express en utilisant l'IP de la machine hôte sur le port 4242



Le script de démo se trouve dans `docker-images/express-image-express`