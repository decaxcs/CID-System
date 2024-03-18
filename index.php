<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Header -->
    <?php include "header.php"; ?>

    <!-- CSS -->
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="index.css">

    <title>Login Page</title>
</head>

<body>
    <div id="login_page">
        <div class="card">
            <div class="card-body">
                <div id="login_text_container">
                    <p class="title_text">WELCOME BACK! <span>LOGIN</span>
                        <p>
                            <p class="subtle_text">Fill in your login details to access</p>
                </div>

                <div id="username_container">
                    <div>
                        <label class="form-check-label" for="user_username">
                            USERNAME
                        </label>
                    </div>
                    <div>
                        <input class="input_underline" id="user_username" placeholder="username" type="text">
                    </div>
                </div>

                <div id="password_container">
                    <div>
                        <label class="form-check-label" for="user_password">
                            PASSWORD
                        </label>
                    </div>
                    <div>
                        <input class="input_underline" id="user_password" placeholder="password" type="password">
                    </div>
                </div>

                <button class="form-control" id="login_button">LOGIN</button>
            </div>
        </div>
    </div>
</body>

</html>