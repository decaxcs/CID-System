<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Header -->
    <?php include "../../header.php"; ?>

    <!-- CSS -->
    <link rel="stylesheet" href="../../style.css">
    <link rel="stylesheet" href="../CSS/create_cid.css">
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
                <div id="notif_dropdown">
                    <div class="header_notification">Notifications</div>
                    <div class="notification">
                        <img class="img_notification" src="https://via.placeholder.com/50" alt="Notification 1">
                        <p class="notification_text">Lorem Ipsum is simply dummy text of the printing and typesetting
                            industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when
                            an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                        <div class="checkbox-container">
                            <input class="form-check-input" type="checkbox" value="" id="message_checkbox">
                        </div>
                    </div>
                    <div class="notification">
                        <img class="img_notification" src="https://via.placeholder.com/50" alt="Notification 2">
                        <p class="notification_text">Lorem Ipsum is simply dummy text of the printing and typesetting
                            industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when
                            an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                        <div class="checkbox-container">
                            <input class="form-check-input" type="checkbox" value="" id="message_checkbox">
                        </div>
                    </div>
                    <div class="notification">
                        <img class="img_notification" src="https://via.placeholder.com/50" alt="Notification 3">
                        <p class="notification_text">Lorem Ipsum is simply dummy text of the printing and typesetting
                            industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when
                            an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                        <div class="checkbox-container">
                            <input class="form-check-input" type="checkbox" value="" id="message_checkbox">
                        </div>
                    </div>
                    <div class="footer_see_all"><a href="Inbox.php">See All</a></div>
                </div>
                <!-- <img id="profile_pic" src="../../Assets/Images/logo.png" alt="logo"> -->
                <p id="tech_name"></p>

                <iconify-icon id="logout" icon="basil:logout-solid"></iconify-icon>
            </div>
        </div>
        <div id="greetings_header">
            <img id="group_pic" src="../../Assets/Images/Group.svg" alt="group_pic">
            <p id="greetings_text"></p>
            <button type="button" class="btn btn-primary btn_create" id="btn_create">
                CREATE
            </button>
        </div>
        <div id="dashboard_container">
            <div id="services">
                <p id="services_title" class="title">Services</p>
                <div id="services_container">
                    <div id="carouselExample" class="carousel slide">
                        <div class="carousel-inner service_container">
                            <div class="carousel-item active">
                                <div class="card_container">

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
                        <div class="card-body technician_ongoing_container">

                        </div>
                    </div>
                </div>
                <div id="progress_container">
                    <p id="progress_title" class="title">Progress</p>
                    <div class="card-body card" id="progress_card">

                        <div class="d-flex flex-row status" id="click_release">
                            <div class="col-2 icon_col">
                                <div class="icon_container">
                                    <iconify-icon icon="radix-icons:rocket" height="3em" style="color: #345AFD;">
                                    </iconify-icon>
                                </div>
                            </div>
                            <div class="col-2 number_col">
                                <div class="number_container">
                                    <p class="number_text" id="release_count"></p>
                                </div>
                            </div>
                            <div class="col-6 text_col">
                                <div class="text_container">
                                    <p class="text_content">Release</p>
                                </div>
                            </div>
                            <div class="col-1 text_col">
                                <div class="arrow_container">
                                    <iconify-icon icon="raphael:arrowright" width="1.2em" height="1.2em"
                                        style="color: A7A7A7"></iconify-icon>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex flex-row status" id="click_ongoing">
                            <div class="col-2 icon_col">
                                <div class="icon_container">
                                    <iconify-icon icon="uiw:reload" height="3em" style="color: #345AFD;"></iconify-icon>
                                </div>
                            </div>
                            <div class="col-2 number_col">
                                <div class="number_container">
                                    <p class="number_text" id="ongoing_count"></p>
                                </div>
                            </div>

                            <div class="col-6 text_col">
                                <div class="text_container">
                                    <p class="text_content">On&ndash;going</p>
                                </div>
                            </div>
                            <div class="col-1 text_col">
                                <div class="arrow_container">
                                    <iconify-icon icon="raphael:arrowright" width="1.2em" height="1.2em"
                                        style="color: A7A7A7"></iconify-icon>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex flex-row status" id="click_warranty">
                            <div class="col-2 icon_col">
                                <div class="icon_container">
                                    <iconify-icon icon="iconamoon:shield-yes-duotone" height="3em"
                                        style="color: #345AFD;"></iconify-icon>
                                </div>
                            </div>
                            <div class="col-2 number_col">
                                <div class="number_container">
                                    <p class="number_text" id="warranty_count"></p>
                                </div>
                            </div>
                            <div class="col-6 text_col">
                                <div class="text_container">
                                    <p class="text_content">Warranty</p>
                                </div>
                            </div>
                            <div class="col-1 text_col">
                                <div class="arrow_container">
                                    <iconify-icon icon="raphael:arrowright" width="1.2em" height="1.2em"
                                        style="color: A7A7A7"></iconify-icon>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>


            <div id="table_container">
                <div class="card">
                    <div class="card-body">
                        <table id="recent_cids_table" class="table table-striped table-hover" width="100%">
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

        <?php 
        // include "add_cid_modal.php"; 
        ?>

        <div class="modal fade" id="view_cid" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false"
            role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg " role="document">
                <div class="modal-content" id="cid_contents_container">

                </div>
            </div>
        </div>

        <div class="modal fade" id="claiming_slip_cid" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false"
            role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg " role="document">
                <div class="modal-content" id="claiming_slip_container">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalTitleId">
                            Claiming Slip
                        </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div id="claiming_slip_details">
                            <p>Claiming Slip #: 042024-2</p>
                            <p>Name: Fhranz Joseph A. Benosa</p>
                            <p>Contact Number: 09089856740</p>
                            <p>CID #: 0420204-1</p>
                            <p>Date: April 9, 2024</p>
                            <p>Tech in Charge: Armein</p>
                            <hr>
                            <p>ITEM/SERVICES: WARRANTY CLAIM</p>
                            <p>Unit Details:</p>
                            <p>Unit Type: Computer</p>
                            <p>Brand: Acer Nitro-5</p>
                                <div>
                                    <label for="claiming_slip_color">Color:</label>
                                    <input type="text" name="claiming_slip_color" id="claiming_slip_color">
                                </div>
                                <div>
                                    <label for="claiming_slip_accesories">Accesories:</label>
                                    <input type="text" name="claiming_slip_accesories" id="claiming_slip_accesories">
                                </div>
                            <p>Notes / Remarks: May Gasgas</p>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                            Close
                        </button>
                        <button type="button" class="btn btn-primary">Save</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="logout_modal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false"
            role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalTitleId">
                            Logout?
                        </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">Are you sure you want to logout your account?</div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                            Close
                        </button>
                        <button type="button" class="btn btn-primary" id="logout_button">Logout</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="../JS/frontdesk.js"></script>
</body>

</html>