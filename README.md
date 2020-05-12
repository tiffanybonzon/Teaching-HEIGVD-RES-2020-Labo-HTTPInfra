## Step 2: Dynamic HTTP server with express.js

## Node

La dernière version stable d'apres le site officiel est 12.16.3 (https://nodejs.org/en/)

Le Dockerfile

```dockerfile
FROM node:12.16.3

COPY src/ /opt/app

#indique la commande à faire à chaque run du container
CMD ["node", "/opt/app/index.js"] 
```

dans le dossier local src/

`npm init` 

- Remplire les champs demandés

`npm install --save chance` #installation du module node "chance"

fichier index.js

```js
var Chance = require('chance');
var chance = new Chance();

console.log("Bonjour " + chance.name());
```

Build de l'image docker

`docker build -t res/express_students_node .`

Run l'image

`docker run res/express_students_node`

## Express

`npm install --save express` #installation du module node "express"

fichier index.js

```js
var Chance = require('chance');
var chance = new Chance();

var express = require('express');
var app = express();

app.get('/', function(req, res) {
        res.send(generateStudents());
});

app.get('/test', function(req, res) { // L'ordre n'a pas d'importance :)
        res.send("This is test");
});

app.listen(3000, function () {
        console.log("Accepting HTTP requests on port 3000");
});

function generateStudents() {
        var numberOfStudents = chance.integer({min: 1, max: 10});
        console.log("Generating " + numberOfStudents + " student(s)...");

        var students = [];

        for(var i = 0; i < numberOfStudents; ++i) {
                var gender = chance.gender();
                var birthYear = chance.year({min:1992, max:1999});

                students.push({
                        firstName: chance.first({gender: gender}),
                        lastName: chance.last(),
                        gender: gender,
                        birthday: chance.birthday({year: birthYear})
                });
        }

        console.log(students);
        return students;
}
```

Build de l'image docker

`docker build -t res/express_students_express .`

Run l'image

`docker run res/express_students_express`

- Il n'y a pour le moment pas de port mapping, il faut donc envoyer les requêtes au container directement
  - Son IP est trouvable avec `docker inspect <container_name>`

`docker run -p 4242:3000 res/express_students_express`

- On a maintenant accès au serveur Express en utilisant l'IP de la machine hôte sur le port 4242

