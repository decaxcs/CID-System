document.getElementById('toggle_password').addEventListener('click', function () {
    var passwordInput = document.getElementById('user_password');
    var icon = document.getElementById('toggle_password');

    if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        icon.setAttribute('icon', 'ion:eye');
    } else {
        passwordInput.type = 'password';
        icon.setAttribute('icon', 'ion:eye-off');
    }
});

$(document).ready(function () {
    function login() {
        var username = $("#user_username").val();
        var password = $("#user_password").val();
    
        if (username.trim() === "" || password.trim() === "") {
            $("#login_alert").text("Please fill in both username and password.");
            $("#login_alert").fadeIn().delay(2000).fadeOut();
            return;
        }

        $.ajax({
            url: "login.php",
            type: "POST",
            data: {
                username: username,
                password: password
            },
            success: function (response) {
                var data = JSON.parse(response);
                console.log(data);
                if (data.status === "success") {
                    switch (data.permission) {
                        case "Frontdesk":
                            window.location.href = "Frontdesk/PAGES/frontdesk.php";
                            break;
                        case "Super Admin":
                            window.location.href = "SuperAdmin/PAGES/super_admin.php";
                            break;
                        case "Technician":
                            window.location.href = "Technician/PAGES/technician.php";
                            break;
                        default:
                            alert("Invalid permission level.");
                            break;
                    }
                } else if (data.status === "deleted") {
                    $("#login_alert").text("This account has been deleted.");
                    $("#login_alert").fadeIn().delay(2000).fadeOut();
                } else if (data.status === "no_user") {
                    $("#login_alert").text("Incorrect username.");
                    $("#login_alert").fadeIn().delay(2000).fadeOut();
                } else {
                    $("#login_alert").text("Incorrect username or password.");
                    $("#login_alert").fadeIn().delay(2000).fadeOut();
                }
            },
            error: function () {
                alert("An error occurred while processing your request.");
            }
        });
    }

    $(document).keypress(function (event) {
        if (event.key === "Enter") {
            login();
        }
    });

    $("#login_button").click(login);
});
