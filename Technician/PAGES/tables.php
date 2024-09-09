<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Header -->
    <?php include "../../header.php"; ?>

    <!-- CSS -->
    <link rel="stylesheet" href="../../style.css">
    <link rel="stylesheet" href="../CSS/technician.css">
    <link rel="stylesheet" href="../../SuperAdmin/CSS/super_admin.css">

    <!-- Plotly -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
    <title>Technician Page</title>
</head>

<body>
    <div>
        <div class="mb-5" id="header">
            <img class="logo" src="../../Assets/Images/logo.png" alt="logo">
            <div class="nav_container">
                <a class="nav_current ms-2" href="#">Home</a>
                <a class="nav_item ms-2" href="cids.php">CIDs</a>
                <a class="nav_item ms-2" href="unclaimedcids.php">Unclaimed CIDs</a>
            </div>
            <div id="header_container">
                <p id="tech_name"></p>
                <iconify-icon id="logout" icon="basil:logout-solid"></iconify-icon>
            </div>
        </div>
        <div class="container">
            <p class="title">CIDs</p>
            <br>
        </div>
    </div>
    <?php include "logout.php"; ?>
    <?php include "tech_toast.php"; ?>

    <script src="../JS/technician.js"></script>

    <script>
        $(document).ready(function() {
            get_analytics('analytics');
            get_analytics('cids');
        });
    </script>
</body>

</html>