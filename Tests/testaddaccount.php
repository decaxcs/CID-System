<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account</title>
</head>

<body>
    <h1>Create Account</h1>
    <form id="createAccountForm">
        <label for="username">Username:</label><br>
        <input type="text" id="username" name="username" required><br><br>
        <label for="password">Password:</label><br>
        <input type="password" id="password" name="password" required><br><br>
        <input type="submit" value="Create Account">
    </form>

    <div id="response"></div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#createAccountForm').submit(function (event) {
                event.preventDefault(); // Prevent the form from submitting normally

                var username = $('#username').val();
                var password = $('#password').val();

                $.ajax({
                    type: 'POST',
                    url: 'register.php',
                    data: {
                        username: username,
                        password: password
                    },
                    success: function (response) {
                        $('#response').text(response); // Display the response message
                    },
                    error: function (xhr, status, error) {
                        console.error('Error:', error);
                    }
                });
            });
        });
    </script>
</body>

</html>