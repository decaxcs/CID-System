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

    <title>Frontdesk Page</title>
</head>

<body>
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
                <iconify-icon id="drop_down_icon" icon="iconamoon:arrow-down-2"></iconify-icon>
            </div>
        </div>
        <div id="greetings_header">
            <img id="group_pic" src="../../Assets/Images/Group.svg" alt="group_pic">
            <p id="greetings_text"></p>
            <button type="button" class="btn btn-primary btn_create" data-bs-toggle="modal"
                data-bs-target="#add_CID_modal">
                CREATE
            </button>
        </div>
        <div id="dashboard_container">
            <div id="services">
                <p id="services_title" class="title">Services</p>
                <div id="services_container">
                    <div id="carouselExample" class="carousel slide">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <div class="card_container">
                                    <div class="card services_card">
                                        <div class="card-body services_card_body">
                                            <div class="services_icon_container">
                                                <iconify-icon icon="icon-park-outline:new-computer"></iconify-icon>
                                            </div>
                                            <div class="info_container">
                                                <p class="services_name">Computer Service</p>
                                                <p class="services_number">16</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card services_card">
                                        <div class="card-body services_card_body">
                                            <div class="services_icon_container">
                                                <iconify-icon icon="icon-park-outline:new-computer"></iconify-icon>
                                            </div>
                                            <div class="info_container">
                                                <p class="services_name">Computer Service</p>
                                                <p class="services_number">16</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card services_card">
                                        <div class="card-body services_card_body">
                                            <div class="services_icon_container">
                                                <iconify-icon icon="icon-park-outline:new-computer"></iconify-icon>
                                            </div>
                                            <div class="info_container">
                                                <p class="services_name">Computer Service</p>
                                                <p class="services_number">16</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card services_card">
                                        <div class="card-body services_card_body">
                                            <div class="services_icon_container">
                                                <iconify-icon icon="icon-park-outline:new-computer"></iconify-icon>
                                            </div>
                                            <div class="info_container">
                                                <p class="services_name">Computer Service</p>
                                                <p class="services_number">16</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card services_card">
                                        <div class="card-body services_card_body">
                                            <div class="services_icon_container">
                                                <iconify-icon icon="icon-park-outline:new-computer"></iconify-icon>
                                            </div>
                                            <div class="info_container">
                                                <p class="services_name">Computer Service</p>
                                                <p class="services_number">16</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="card_container">
                                    <div class="card services_card">
                                        <div class="card-body services_card_body">
                                            <div class="services_icon_container">
                                                <iconify-icon icon="icon-park-outline:new-computer"></iconify-icon>
                                            </div>
                                            <div class="info_container">
                                                <p class="services_name">Computer Service</p>
                                                <p class="services_number">16</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample"
                            data-bs-slide="prev">
                            <span class="carousel-control-prev-icon visually-hidden" aria-hidden="true"></span>
                            <iconify-icon class="prev_icon" icon="uiw:left"></iconify-icon>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample"
                            data-bs-slide="next">
                            <span class="carousel-control-next-icon visually-hidden" aria-hidden="true"></span>
                            <iconify-icon class="next_icon" icon="uiw:right"></iconify-icon>
                        </button>
                    </div>
                </div>
            </div>
            <div id="technician_progress">
                <div id="technician_container">
                    <p id="technician_title" class="title">Technician</p>
                    <div class="card technician_progress_card">
                        <div class="card-body">
                            <p class="technician_name">Armein</p>
                            <div class="progress">
                                <div class="progress-bar w-75" role="progressbar" aria-valuenow="75" aria-valuemin="0"
                                    aria-valuemax="100"></div>
                            </div>
                            <p class="technician_name">Gerard</p>
                            <div class="progress">
                                <div class="progress-bar w-75" role="progressbar" aria-valuenow="75" aria-valuemin="0"
                                    aria-valuemax="100"></div>
                            </div>
                            <p class="technician_name">Benjie</p>
                            <div class="progress">
                                <div class="progress-bar w-75" role="progressbar" aria-valuenow="75" aria-valuemin="0"
                                    aria-valuemax="100"></div>
                            </div>
                            <p class="technician_name">Bogart</p>
                            <div class="progress">
                                <div class="progress-bar w-75" role="progressbar" aria-valuenow="75" aria-valuemin="0"
                                    aria-valuemax="100"></div>
                            </div>
                            <p class="technician_name">Kristelle</p>
                            <div class="progress">
                                <div class="progress-bar w-75" role="progressbar" aria-valuenow="75" aria-valuemin="0"
                                    aria-valuemax="100"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="progress_container">
                    <p id="progress_title" class="title">Progress</p>
                    <div class="card technician_progress_card">
                        <div class="card-body">
                            <div>

                            </div>
                            <div>

                            </div>
                            <div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <?php include "add_cid_modal.php"; ?>
    </div>


    <script src="../JS/frontdesk.js"></script>
</body>

</html>