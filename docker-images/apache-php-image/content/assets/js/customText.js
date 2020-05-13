$(function() { //Periodically updates the Team text with AJAX
        console.log("Changing text");

        function loadMotto() {
                $.getJSON("api/companies/", function(companies) {
                        console.log(companies);
                        //companies always contains at least 1 company
                        var message = companies[0].motto;
                        $("#teamTextToChange").text(message);
                });
        };
        
        // Text is changed every 5 seconds
        setInterval(loadMotto, 5000);    

});
