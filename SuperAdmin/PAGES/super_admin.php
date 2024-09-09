<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>

    <!-- Header -->
    <?php include "../../header.php"; ?>

    <!-- CSS -->
    <link rel="stylesheet" href="../../style.css">
    <link rel="stylesheet" href="../CSS/super_admin.css">

    <!-- Plotly -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>

</head>

<body>
    <div>
        <?php include "super_admin_header.php"; ?>

        <div class="container">
            <p class="page_title mb-2">Home</p>
            <div id="home_analytics_container">

            </div>
            <div id="home_cids_container" class="card">

            </div>
            <br>
        </div>
    </div>
    <?php include "logout.php"; ?>

    <script src="../JS/get_data.js"></script>

    <script>
    $(document).ready(function() {
        get_data('analytics');
        get_data('cids', '', '', '', '', '');
    });
    </script>


</body>

</html>