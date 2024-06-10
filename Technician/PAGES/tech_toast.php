<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Toastify Example</title>

    <!-- Toastify CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">

    <style>
        .custom-toast {
            font-size: 12px;
            width: 40%;
            margin-left: 10px;
        }
    </style>
</head>

<body>
    <!-- Toastify JS -->
    <script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>

    <script>
        $(document).ready(function () {
            get_toast();
        });

        function get_toast() {
            $.ajax({
                url: "../PHP/get_toast.php",
                method: "GET",
                dataType: "json",
                success: function (data) {
                
                    populate_toast(data.dates);
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching data:", error, xhr, status);
                }
            });
        }


        function populate_toast(data) {
            console.log(data);
            Object.values(data).forEach(function (data) {
                var currentDate = new Date();
                var newDate = new Date(data.new_date);

                if ((data.cid_status === 'On-going' || data.cid_status === 'Pending') && currentDate > newDate) {
                    var toast_text =
                        `It has been more than ${data.settings_value} ${data.settings_unit}(s) since CID: ${data.cid_number} has been checked/updated`;
                    show_toast(toast_text, data.cid_number);
                }
            });
        }



        function show_toast(text, cid_number) {
            var toast = Toastify({
                text: text,
                duration: -1,
                gravity: "bottom",
                position: 'relative',
                backgroundColor: "#345AFD",
                close: true,
                stopOnFocus: true,
                className: "custom-toast",
            }).showToast();

            document.querySelector('.custom-toast').addEventListener('click', function (event) {
                sessionStorage.setItem('cid_number', cid_number);

                window.location.href = 'cidsedit.php';
            });
        }
    </script>
</body>

</html>