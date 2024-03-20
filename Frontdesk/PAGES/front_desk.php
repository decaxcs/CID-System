<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Header -->
    <?php include "../../header.php"; ?>

    <!-- CSS -->
    <link rel="stylesheet" href="../../style.css">
    <link rel="stylesheet" href="../CSS/front_desk.css">
    <link rel="stylesheet" href="../CSS/add_cid_modal.css">

    <!-- CSS Components -->
    <link rel="stylesheet" href="../../Assets/CSS/checkbox.css">

    <title>Frontdesk Page</title>
</head>

<body>
    <div id="front_desk_page">
        <div id="side_blue_box">
            <div id="logo_container">
                <img id="logo_image" src="../../Assets/Images/logo.png" alt="" srcset="">
                <div id="logo_text_container">
                    <p id="company_name">Techy David</p>
                    <p id="company_sub_name">IT Solutions</p>
                </div>
            </div>
            <div id="time_date_container">
                <div class="card calendar_card">
                    <div class="card-body calendar_body">
                    </div>
                </div>
                <div id="time">
                    <p id="current-time"></p>
                </div>
            </div>
        </div>

        <div id="front_desk_container">
            <div id="header">

            </div>
            <div id="dashboard_container">
                <p id="dashboard_title_text">DASHBOARD</p>
                <div id="dashboard_greeting_container">
                    <p id="greetings">Good Morning, <br>
                        <span id="front_desk_name">Lorem!<span>
                    </p>
                    <!-- <button type="button" class="btn btn-primary btn_create" data-bs-toggle="modal"
                        data-bs-target="#add_CID_modal">
                        CREATE
                    </button> -->
                </div>
                <div id="dashboard_card_container">
                    <div class="card stats_card">
                        <div class="card-body">
                            <div class="info_container ">
                                <div>
                                    <p class="technician_name">Armein</p>
                                    <p class="number_onging_task">26</p>
                                    <p class="ongoing_task">On-Going-Task</p>
                                </div>
                                <div class="icon_container">
                                    <div class="icons">
                                        <iconify-icon class="large_icon" icon="fluent:people-team-24-filled"
                                            width="62px" height="62px">
                                        </iconify-icon>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body more_info" onclick="navigateToLink('https:google.com')">
                            <p class="me-2">More Info</p>
                            <iconify-icon class="more_info_icon" icon="icomoon-free:circle-right"></iconify-icon>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script src="../JS/front_desk.js"></script>

    <?php include "add_cid_modal.php"; ?>
</body>

</html>