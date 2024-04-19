<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Header -->
    <?php include "../../header.php"; ?>

    <!-- CSS -->
    <link rel="stylesheet" href="../../style.css">
    <link rel="stylesheet" href="../CSS/frontdesk.css">

    <title>On Warranty CIDS</title>
</head>

<body>
    <div id="warranty_page">
        <div id="frontdesk_page">
            <div id="header">
                <img id="logo" src="../../Assets/Images/logo.png" alt="logo">
                <div id="notif_container">
                    <div id="notif_icon_container">
                        <iconify-icon id="notif_icon" icon="mingcute:notification-line"></iconify-icon>
                        <div id="notif_dot">

                        </div>
                    </div>
                    <div id="notif_dropdown">
                    <div class="header_notification">Notifications</div>
                    <div class="notification">
                        <img class="img_notification" src="https://via.placeholder.com/50" alt="Notification 1">
                        <p class="notification_text">Lorem Ipsum is simply dummy text of the printing and typesetting
                            industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when
                            an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                        <div class="checkbox-container">
                            <input class="form-check-input" type="checkbox" value="" id="message_checkbox1">
                        </div>
                    </div>
                    <div class="footer_see_all"><a href="Inbox.php">See All</a></div>
                </div>
                    <!-- <img id="profile_pic" src="../../Assets/Images/logo.png" alt="logo"> -->
                    <p id="tech_name"></p>

                    <iconify-icon id="drop_down_icon" icon="basil:logout-solid  " id="logout"></iconify-icon>
                </div>
            </div>
            <div id="greetings_header">
                <p class="title_warranty">WARRANTY</p>
            </div>
            <div class="table_container">
                <div id="table_container">
                    <div class="card">
                        <div class="card-body">
                            <table id="warranty_table" class="table table-striped table-hover" width="100%">
                                <thead>
                                    <tr>
                                        <th>CID</th>
                                        <th>Client</th>
                                        <th>Technician</th>
                                        <th>Unit Details</th>
                                        <th>Start of Repair Date</th>
                                        <!-- <th>End of Repair Date</th>
                                        <th>Warranty</th>
                                        <th>Warranty End</th> -->
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
    </div>
    <script src="../JS/display_tables.js"></script>
</body>

</html>