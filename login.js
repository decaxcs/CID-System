document.getElementById('toggle_password').addEventListener('click', function() {
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