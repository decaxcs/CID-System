<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Header -->
    <?php include "../../header.php"; ?>

    <!-- CSS -->
    <link rel="stylesheet" href="../../style.css">
    <link rel="stylesheet" href="../CSS/add_cid_modal.css">
    <link rel="stylesheet" href="../CSS/frontdesk.css">

    <title>Released CIDS</title>
</head>

<body>
    <div id="release_page">
        <div id="frontdesk_page">
            <div id="header">
                <img id="logo" src="../../Assets/Images/logo.png" alt="logo">
                <div id="notif_container">
                    <div id="notif_icon_container">
                        <iconify-icon id="notif_icon" icon="mingcute:notification-line"></iconify-icon>
                        <div id="notif_dot">

                        </div>
                    </div>
                    <!-- <img id="profile_pic" src="../../Assets/Images/logo.png" alt="logo"> -->
                    <p id="tech_name"></p>

                    <iconify-icon id="drop_down_icon" icon="basil:logout-solid  " id="logout"></iconify-icon>
                </div>
            </div>
            <div id="greetings_header">
                <p class="title_release">RELEASE</p>
            </div>
            <dib class="table_container">
                <div id="table_container">
                    <div class="card">
                        <div class="card-body">
                            <table id="release_table" class="table table-striped table-hover" width="100%">
                                <thead>
                                    <tr>
                                        <th>CID</th>
                                        <th>Client</th>
                                        <th>Technician</th>
                                        <th>Unit Details</th>
                                        <th>Date</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                   
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
        </div>
</body>
<script src="../JS/frontdesk.js"></script>

</html>