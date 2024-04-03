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
                <div id="notif_container">
                    <iconify-icon id="notif_icon" icon="ph:bell"></iconify-icon>
                </div>
                <div id="profile_container">
                    <img id="profile_image" src="../../Assets/Images/logo.png" alt="" srcset="">
                    <p id="user_name">Armein</p>
                    <iconify-icon id="drop_down_icon" icon="iconamoon:arrow-down-2"></iconify-icon>
                </div>
            </div>
            <div id="dashboard_container">
                <p id="dashboard_title_text">DASHBOARD</p>
                <div id="dashboard_greeting_container">
                    <p id="greetings">Good Morning, <br>
                        <span id="front_desk_name">Lorem!<span>
                    </p>
                    <button type="button" class="btn btn-primary btn_create" data-bs-toggle="modal"
                        data-bs-target="#add_CID_modal">
                        CREATE
                    </button>
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
                <div id="dashboard_table_container">
                    <div class="card table_card">
                        <div class="card-body">
                            <table id="recent_cid_table" class="table table-borderless" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Position</th>
                                        <th>Office</th>
                                        <th>Age</th>
                                        <th>Start date</th>
                                        <th>Salary</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Tiger Nixon</td>
                                        <td>System Architect</td>
                                        <td>Edinburgh</td>
                                        <td>61</td>
                                        <td>2011-04-25</td>
                                        <td>$320,800</td>
                                    </tr>
                                    <tr>
                                        <td>Garrett Winters</td>
                                        <td>Accountant</td>
                                        <td>Tokyo</td>
                                        <td>63</td>
                                        <td>2011-07-25</td>
                                        <td>$170,750</td>
                                    </tr>
                                    <tr>
                                        <td>Ashton Cox</td>
                                        <td>Junior Technical Author</td>
                                        <td>San Francisco</td>
                                        <td>66</td>
                                        <td>2009-01-12</td>
                                        <td>$86,000</td>
                                    </tr>
                                    <tr>
                                        <td>Cedric Kelly</td>
                                        <td>Senior Javascript Developer</td>
                                        <td>Edinburgh</td>
                                        <td>22</td>
                                        <td>2012-03-29</td>
                                        <td>$433,060</td>
                                    </tr>
                                    <tr>
                                        <td>Airi Satou</td>
                                        <td>Accountant</td>
                                        <td>Tokyo</td>
                                        <td>33</td>
                                        <td>2008-11-28</td>
                                        <td>$162,700</td>
                                    </tr>
                                </tbody>
                            </table>
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