<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=\, initial-scale=1.0">
    <!-- Header -->
    <?php include "../header.php"; ?>
    <title>Document</title>
</head>

<body>
    <input id="client_full_name" placeholder="username" type="text">
    <button class="form-control" id="proceed_button">PROCEED</button>
    <p id="generated_number"></p>

    <script>
    function proceed() {
        var client_full_name = $("#client_full_name").val();

        $.ajax({
            url: "test_cid_number_generation.php",
            type: "POST",
            data: {
                
            },
            success: function (response) {
                $("#generated_number").text(response);
            }
        });
    }

    $(document).keypress(function (event) {
        if (event.key === "Enter") {
            proceed();
        }
    });

    $("#proceed_button").click(proceed);
</script>

</body>

</html>