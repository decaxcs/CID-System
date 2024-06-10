<?php 
    include_once "c_db.php";
    include_once "test_model.php";

    $activity_model = new ActivityModel();

    $get_all_activity = $activity_model->getAll();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <p>Test</p>
    <div id="container">

    </div>
    <div>
        <p>Name:</p>
        <input id="input_test" type="text">
        <button id="sumbit_input">Submit</button>
    </div>

    <script>
        $(document).ready(function () {
            $('#sumbit_input').click(function () {
                insert_test();
            });

            get_data();
        });

        function get_data() {
            $.ajax({
                url: "test_controller.php",
                method: "POST",
                dataType: "json",
                data: 'get_all_test',
                success: function (response) {
                    console.log(response);
                    display_test(response)
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching data:", error, xhr, status);
                }
            });
        }

        function display_test(response) {
            let container = $('#container');
            container.empty();

            let test_HTML = ``;

            response.forEach(function (data) {
                test_HTML = `
                <p>${data.test_name}<p>
            `;
                container.append(test_HTML);
            });
        }

        function insert_test() {
            let input_test = $('#input_test').val();

            let request_data = {
                input_test: input_test
            };

            $.ajax({
                url: "test_controller.php",
                method: "POST",
                dataType: "json",
                data: request_data,
                success: function (response) {
                    console.log(response);
                    alert_response(response);
                    get_data();
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching data:", error, xhr, status);
                }
            });
        }

        function alert_response(response) {
            if (response.status === 'success') {
                alert(response.message);
            } else {
                alert(response.message);
            }
        }
    </script>

</body>

</html>