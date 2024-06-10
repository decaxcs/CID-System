<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Analytics</title>

    <!-- Header -->
    <?php include "../../header.php"; ?>

    <!-- CSS -->
    <link rel="stylesheet" href="../../style.css">
    <link rel="stylesheet" href="../CSS/super_admin.css">

    <!-- Plotly -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>

    <!-- Date Range Picker -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

</head>

<body>
    <div>
        <?php include "super_admin_header.php"; ?>

        <div class="container">
            <p class="page_title mb-2">Analytics</p>
            <div class="d-flex flex-row">
                <input class="form-control" type="text" name="daterange" value="" />
                <button type="button" class="btn btn-primary ms-2 align-self-start my-auto" id="refresh-date">
                    Refresh
                </button>
            </div>
            <div id="analytics_container">

            </div>
            </br>
        </div>

        <?php include "logout.php"; ?>
        <script src="../JS/get_data.js"></script>
    </div>
    <script>
        $(document).ready(function () {
            $('input[name="daterange"]').daterangepicker({
                locale: {
                    format: 'MMMM D YYYY'
                },
                startDate: moment(),
                endDate: moment()
            });

            get_data('analytics');
        });
    </script>


</body>

</html>