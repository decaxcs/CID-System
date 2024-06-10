<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Header -->
    <?php include "header_login.php"; ?>

    <!-- CSS -->
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="login.css">

    <title>Login Page</title>
</head>

<body>
    <div id="login_page">
        <div class="card">
            <div class="card-body">
                <div id="login_text_container">
                <img class="logo" src="Assets/Images/logo.png" alt="logo" srcset="">
                    <p class="title_text">WELCOME BACK! <span>LOGIN</span>
                        <p>
                            <p class="subtle_text">Fill in your login details to access</p>
                </div>

                

                <div class="alert alert-danger" id="login_alert" style="display: none;" role="alert">
                </div>

                <div id="username_container">
                    <div>
                        <label class="form-check-label" for="user_username">
                            USERNAME
                        </label>
                    </div>
                    <div class="input_login">
                        <input class="input_underline" id="user_username" placeholder="username" type="text">
                        <iconify-icon icon="mage:user-fill"></iconify-icon>
                    </div>
                </div>

                <div id="password_container">
                    <div>
                        <label class="form-check-label" for="user_password">
                            PASSWORD
                        </label>
                    </div>
                    <div class="input_login">
                        <input class="input_underline" id="user_password" placeholder="password" type="password">
                        <iconify-icon icon="ion:eye-off" id="toggle_password"></iconify-icon>
                    </div>

                    <button class="form-control" id="login_button">LOGIN</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Check Warranty -->


    <!-- JS -->
    <script src="login.js"></script>
</body>

</html>