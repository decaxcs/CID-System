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

    <title>Technician Page</title>
</head>

<body>
    <div>
        <?php include "technician_header.php"; ?>
        <div class="content_container">
            <div id="table_container">
                <div class="card">
                    <div class="card-body">
                        <table id="cids_table" data-type="unclaimed" class="table table-striped table-hover" width="100%">
                            <thead>
                                <tr>
                                    <th>CID</th>
                                    <th>Client</th>
                                    <th>Unit Details</th>
                                    <th>Unit History</th>
                                    <th>Start of Repair Date</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <?php include "logout.php"; ?>
    <script src="../JS/technician_table.js"></script>
</body>

</html>