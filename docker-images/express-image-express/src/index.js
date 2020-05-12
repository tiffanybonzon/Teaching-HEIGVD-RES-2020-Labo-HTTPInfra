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
