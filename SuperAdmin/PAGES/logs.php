<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logs</title>

    <!-- Header -->
    <?php include "../../header.php"; ?>

    <!-- CSS -->
    <link rel="stylesheet" href="../../style.css">
    <link rel="stylesheet" href="../CSS/super_admin.css">
    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

</head>

<body>
    <div>
        <?php include "super_admin_header.php"; ?>

        <div class="container">
            <p class="page_title mb-2">Logs</p>
            <table class="table table-striped" id="logs_table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>User</th>
                        <th>Action</th>
                        <th>Table</th>
                        <th>CID Number</th>
                        <th>Timestamp</th>
                    </tr>
                </thead>
                <tbody id="logs_container">

                </tbody>
            </table>
            <br>
        </div>
    </div>
    <?php include "logout.php"; ?>
    <script src="../JS/get_data.js"></script>

    <script>
    $(document).ready(function() {
        get_data('logs');
    });

    function populate_logs(logs) {
        console.log(logs);

        let logs_container = $('#logs_container');
        logs_container.empty();

        const tableNameTextMapping = [{
                value: 'cs_users',
                text: 'Users'
            },
            {
                value: 'cs_cid_information',
                text: 'CID Information'
            },
        ];


        logs.forEach(function(log) {

            let tableNameText = '';

            if (log.table_name) {
                const foundMapping = tableNameTextMapping.find(mapping => mapping.value === log.table_name);
                tableNameText = foundMapping ? foundMapping.text :
                    '';
            }

            let logs_HTML = `
                    <tr>
                        <td>${log.log_id}</td>
                        <td>${log.csu_name}</td>
                        <td>${log.action}</td>
                        <td>${tableNameText}</td>
                        <td>${log.cid_number ? log.cid_number : ''}</td>
                        <td>${log.formatted_timestamp}</td>
                    </tr>
                `;

            logs_container.append(logs_HTML);
        });

        var table = $('#logs_table').DataTable({
            order: [
                [0, 'desc']
            ]
        });
    }
    </script>


</body>

</html>