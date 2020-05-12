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
			birthday: chance.birthday({year: birthYear}),
			pet: chance.animal({type: 'pet'})
		});
	}

	console.log(students);
	return students;
}
