
$(document).ready(function () {
    function get_user_account() {
        $.ajax({
            url: "../PHP/get_user_account.php",
            type: "GET",
            success: function (response) {
                if (response.status === "success") {
                    var csu_name = response.csu_name;
                    $("#tech_name").text(csu_name);
                    $("#greetings_text").text("Hello, " + csu_name);
                } else {
                    console.log("Error: " + response.message);
                }
            },
            error: function (xhr, status, error) {
                console.log("Error:", error);
                console.log("Status:", status);
                console.log("XHR:", xhr);
                console.log("An error occurred while fetching data from the server.");
            }
        });
    }

    get_user_account();
});