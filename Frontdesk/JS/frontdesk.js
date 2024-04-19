$(document).ready(function () {


    document.getElementById('btn_create').addEventListener('click', function () {
        window.location.href = 'create_cid.php';
    });

    document.getElementById('logout').addEventListener('click', function () {
        $("#logout_modal").modal('show');
    });

    document.getElementById('logout_button').addEventListener('click', function () {
        $.ajax({
            url: '../../logout.php',
            type: 'POST',
            success: function () {
                window.location.href = '../../index.php';
            },
            error: function (xhr, status, error) {
                ajax_error_handling(xhr, status, error)
            }
        });
    });

    $('#click_release').click(function () {
        window.location.href = '../PAGES/release.php';
    });

    $('#click_ongoing').click(function () {
        window.location.href = '../PAGES/ongoing.php';
    });

    $('#click_warranty').click(function () {
        window.location.href = '../PAGES/warranty.php';
    });

    function get_user_account() {
        $.ajax({
            url: "../PHP/get_user_account.php",
            type: "GET",
            success: function (response) {
                if (response.status === "success") {
                    var csu_name = response.csu_name;
                    $("#tech_name").text(csu_name);
                    $("#greetings_text").text("Hello, " + csu_name);
                } else {
                    console.log("Error: " + response.message);
                }
            },
            error: function (xhr, status, error) {
                ajax_error_handling(xhr, status, error);
            }
        });
    }

    function ajax_error_handling(xhr, status, error) {
        console.log("Error:", error);
        console.log("Status:", status);
        console.log("XHR:", xhr);
        console.log("An error occurred while fetching data from the server.");
    }

    function get_technician_ongoing() {
        $.ajax({
            url: "../PHP/get_technician_ongoing.php",
            type: "GET",
            success: function (response) {
                if (response.status === "success") {
                    populate_technician_ongoing(response.data);
                } else {
                    console.log("Error: No data found.");
                }
            },
            error: function (xhr, status, error) {
                ajax_error_handling(xhr, status, error);
            }
        });
    }

    function populate_technician_ongoing(data) {
        var technician_ongoing_container = $('.technician_ongoing_container');
        technician_ongoing_container.empty();

        data.forEach(function (item) {
            var technician_ongoing_HTML =
                `
                <p class="technician_name">${item.technician_name}</p>
                <div class="progress">
                    <div class="progress-bar w-75" role="progressbar" aria-valuenow="${item.ongoing_service_count}" aria-valuemin="0"
                        aria-valuemax="100">${item.ongoing_service_count}</div>
                </div>
                `;
            technician_ongoing_container.append(technician_ongoing_HTML);
        });
    }

    function get_services() {
        $.ajax({
            url: "../PHP/get_services.php",
            type: "GET",
            success: function (response) {
                if (response.status === "success") {
                    populate_services(response.data);
                } else {
                    console.log("Error: No data found.");
                }
            },
            error: function (xhr, status, error) {
                ajax_error_handling(xhr, status, error);
            }
        });
    }

    function populate_services(data) {
        var service_container = $('.service_container');
        var carousel_inner = $('.carousel-inner');

        carousel_inner.empty();

        var items_per_slide = 5;
        var num_items = data.length;
        var num_slides = Math.ceil(num_items / items_per_slide);

        for (var i = 0; i < num_slides; i++) {
            var slide_HTML =
                `<div class="carousel-item ${i === 0 ? 'active' : ''}">
                    <div class="card_container"></div>
                </div>`;
            carousel_inner.append(slide_HTML);
        }

        data.forEach(function (item, index) {
            var current_slide = Math.floor(index / items_per_slide);
            var service_HTML =
                `<div class="card services_card">
                    <div class="card-body services_card_body">
                        <div class="services_icon_container">
                            <iconify-icon icon="iconoir:laptop-fix"></iconify-icon>
                        </div>
                        <div class="info_container">
                            <p class="services_name">${item.service_name} Service</p>
                            <p class="services_number">${item.cid_count}</p>
                        </div>
                    </div>
                </div>`;
            carousel_inner.find('.carousel-item').eq(current_slide).find('.card_container').append(service_HTML);
        });
    }

    function get_status_count() {
        $.ajax({
            url: "../PHP/get_status_count.php",
            type: "GET",
            success: function (response) {
                if (response.status === "success") {
                    populate_status_count(response.data);
                } else {
                    console.log("Error: No data found.");
                }
            },
            error: function (xhr, status, error) {
                ajax_error_handling(xhr, status, error);
            }
        });
    }

    function populate_status_count(data) {
        $('#release_count').text(data.Release);
        $('#ongoing_count').text(data["On-going"]);
        $('#warranty_count').text(data.Warranty);
    }

    function get_cids() {
        $('#recent_cids_table').DataTable({
            "autoWidth": false,
            "scrollY": "450px",
            "scrollCollapse": true,
            "ajax": {
                "url": "../PHP/get_cids.php",
                "dataSrc": "cids_data"
            },
            "columns": [{
                    "data": "cid_number"
                },
                {
                    "data": "cid_client_full_name"
                },
                {
                    "data": "technician_name"
                },
                {
                    "data": "cid_unit_details"
                },
                {
                    "data": "formatted_created"
                },
                {
                    "render": function (data, type, row) {
                        return `
                            <div class="recent_cid_buttons_container">
                                <button type="button" class="btn btn-success claiming_slip"><iconify-icon icon="quill:paper"></iconify-icon></button>
                                <button type="button" class="btn btn-primary edit_cid"><iconify-icon icon="ic:baseline-edit"></iconify-icon></button>
                            </div>
                        `;
                    }
                }

            ],
            "columnDefs": [{
                "targets": 5,
                "orderable": false,
                "searchable": false
            }],
            "order": [
                [4, 'asc']
            ]
        });

        $('#recent_cids_table tbody').on('click', 'tr', function () {
            var rowData = $('#recent_cids_table').DataTable().row(this).data();
            var cid_number = rowData.cid_number;
            $("#view_cid").modal("show");

            get_cid_info(cid_number);

            function get_cid_info(cid_number) {
                $.ajax({
                    url: "../PHP/get_cids.php",
                    type: "GET",
                    data: {
                        cid_number: cid_number
                    },
                    success: function (response) {
                        if (response.status === "success") {
                            populate_cid_contents(response.cids_data);
                        } else {
                            console.log("Error: No data found.");
                        }
                    },
                    error: function (xhr, status, error) {
                        ajax_error_handling(xhr, status, error);
                    }
                });
            }

            function populate_cid_contents(data) {
                console.log(data);
                var cid_contents_container = $('#cid_contents_container');

                cid_contents_container.empty();

                var cid_contents_HTML =
                    `
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="">
                            <div class="row">
                                <div class="col-auto me-auto" id="person_in_charge">FILL UP BY PERSON IN CHARGE ONLY</div>
                                <div class="col-auto" id="cid_bold">DIAGNOSTIC REPAIR REPORT</div>
                            </div>
                            <div class="row">
                                <div class="col-auto me-auto" id="cid_bold">SPECIFY THE FF:</div>
                                <div class="col-auto" id="cid_number">CID ${data[0].cid_number}</div>
                            </div>
                            <div class="row">
                            <div class="col-auto ms-auto" id="cid_bold">Claiming Slip:${data[0].cid_number} <span></p>
                            </div>
                            </div>
                            <div class="row">
                                <div class="col-auto me-auto" id="cid_bold">Unit Details / Brand Model: <span
                                        class="cid_text">${data[0].cid_unit_details}</p>
                                </div>
                            
                            </div>
                            <div class="line"></div>
                            <div class="row">
                                <div class="col-auto me-auto" id="cid_bold">REMARKS: (SCRATCHES, COLORS, LCD, ETC)<span
                                        class="cid_text"></p>
                                </div>
                                <div>
                                ${data[0].cid_remarks}
                                </div>
                            </div>
                            <div class="line"></div>
                            <div class="row" id="unit_history">
                                <div class="col-auto me-auto" id="cid_bold">UNIT HISTORY / PROBLEMS / ISSUES & INFORMATION
                                    PROVIDED BY CLIENT:<span class="cid_text"></p>
                                </div>
                            </div>
                            <div class="line"></div>
                            <div class="row mb-2">
                                <div class="d-flex flex-row justify-content-between">
                                    <div>
                                        <p><span class="cid_print_text_bold" id="cid_bold">SUMMARY OF REPAIRS / DIAGNOSTIC /
                                                OBSERVATION ETC:
                                            </span>
                                        </p>
                                    </div>
                                    <div>
                                        <p><span class="cid_print_text_bold text_red" id="cid_number">Date of 1st
                                                Notification of Release: <span></p></span>
                                        </p>
                                        <p><span class="cid_print_text_bold text_red" id="cid_number">Warranty
                                                End: <span></p></span></p>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <p class="summary_of_repairs_content mb-4"></p>
                            </div>
                            <div class="row d-flex justify-content-center justify-content-between">
                                <div class="col-auto"><span class="cid_bold">START OF REPAIR DATE: </span></p>
                                </div>
                                <div class="col-auto"><span class="cid_bold">END OF REPAIR DATE: </span></p>
                                </div>
                                <div class="col-auto"><span class="cid_bold">TECH IN CHARGE: </span> ${data[0].technician_name}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="line"></div>
                                <div class="row " id="reccomendations_cid">
                                    <div class="col-auto me-auto cid_bold">
                                        RECOMMENDATIONS: <span class="cid_text"></p>
                                    </div>
                                </div>
                                <div class="line"></div>

                                <div class="row d-flex justify-content-between mb-4" id="mode_of_payments">
                                    <div class="col-auto cid_bold">SUMMARY OF PAYMENTS:</div>
                                    <div class="col-auto"><span class="cid_bold">CR: </span></p>
                                    </div>
                                    <div class="col-auto"><span class="cid_bold">OR: </span></p>
                                    </div>
                                    <div class="col-auto"><span class="cid_bold">MODE OF PAYMENTS: </span></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-auto me-auto mb-4">
                                        <span></p>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-info" id="print_cid">Print CID</button>
                    </div>
                    `
                cid_contents_container.append(cid_contents_HTML);
            }
        });


        $('#recent_cids_table tbody').on('click', '.claiming_slip', function (event) {
            event.stopPropagation();

            const rowData = $('#recent_cids_table').DataTable().row($(this).parents('tr')).data();
            const cid_number = rowData.cid_number;

            create_cid_cs_number(cid_number);

            $("#claiming_slip_cid").modal("show");
        });

        function create_cid_cs_number(cid_number) {
            $.ajax({
                url: "../PHP/create_claiming_slip_number.php",
                type: "GET",
                data: {
                    cid_number: cid_number
                },
                success: function (response) {
                    populate_claiming_slip(response);
                },
                error: function (xhr, status, error) {
                    ajax_error_handling(xhr, status, error);
                }
            });
        }

        function populate_claiming_slip(data) {
            var current_datetime = data.current_datetime;
            var claiming_slip_number = data.cid_cs_number;
            var cid_info = data.cids_data;


            const claiming_slip_container = $('#claiming_slip_container');
            claiming_slip_container.empty();

            claiming_slip_data = {
                claiming_slip_number: claiming_slip_number,
                cid_client_full_name: cid_info[0].cid_client_full_name,
                cid_client_contact: cid_info[0].cid_client_contact,
                cid_platinum_number: cid_info[0].cid_platinum_number,
                cid_number: cid_info[0].cid_number,
                current_datetime: current_datetime,
                technician_name: cid_info[0].technician_name,
                service_name: cid_info[0].service_name,
                cid_unit_details: cid_info[0].cid_unit_details,
                cid_remarks: cid_info[0].cid_remarks,

                cs_color: cid_info[0].cid_cs_color,
                cs_accesories: cid_info[0].cid_cs_accesories
            }

            var claiming_slip_HTML =
                `
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalTitleId">
                            Claiming Slip
                        </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div id="claiming_slip_details">
                            <p>Claiming Slip #: <span id="cs_number">${claiming_slip_data.claiming_slip_number}</span></p>
                            <p>Name: ${claiming_slip_data.cid_client_full_name}</p>
                            <p>Contact Number: ${claiming_slip_data.cid_client_contact}</p>
                            <p>CID #: <span id="cid_number">${claiming_slip_data.cid_number}</span></p>
                            <p>Date: ${claiming_slip_data.current_datetime}</p>
                            <p>Tech in Charge: ${claiming_slip_data.technician_name}</p>
                            <hr>
                            <p>ITEM/SERVICES: WARRANTY CLAIM</p>
                            <p id="cs_title">Unit Details</p>
                            <p>Unit Type: ${claiming_slip_data.service_name}</p>
                            <p>Brand: ${claiming_slip_data.cid_unit_details}</p>
                            <div>
                                <label for="cs_color">Color:</label>
                                <input type="text" name="cs_color" id="cs_color" value="${claiming_slip_data.cs_color ? claiming_slip_data.cs_color : ''}">
                            </div>
                            <div>
                                <label for="cs_accesories">Accesories:</label>
                                <input type="text" name="cs_accesories" id="cs_accesories" value="${claiming_slip_data.cs_accesories ? claiming_slip_data.cs_accesories : ''}">
                            </div>
                            <p>Notes / Remarks: ${claiming_slip_data.cid_remarks}</p>
                        </div>
                    </div>
                `;
            claiming_slip_container.append(claiming_slip_HTML);
        }
    }

    var claiming_slip_data;

    $(document).on('click', '#print_claiming_slip', function () {
        function print_claiming_slip() {
            var printWindow = window.open('', '_blank');

            var cs_color = $("#cs_color").val();
            var cs_accesories = $("#cs_accesories").val();
            var claimingSlipContent =
                `
            <!DOCTYPE html>
            <html lang="en">
            
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Claiming Slip</title>
            
                <!-- Header -->
                <?php include "../../header.php"; ?>
            
                <!-- CSS -->
                <link rel="stylesheet" href="../../style.css">
                <link rel="stylesheet" href="../CSS/create_cid.css">
                <link rel="stylesheet" href="../CSS/frontdesk.css">
                <link rel="stylesheet" href="../CSS/claiming_slip.css">
            </head>
            
            <body>
                <div class="claiming_slip_page">
                    <div class="Card" id="claiming">
                        <div class="Card-body create_claim_page">
                            <div class="Card-body create_claim">
                                <p class="header_claiming_slip_number"><span class="header_claiming_slip">Claiming Slip
                                        #</span>${claiming_slip_data.claiming_slip_number}</p>
                                <div class="claiming_info">
                                    <div class="row mb-3">
                                        <p class="claiming_text_samp"><span class="claiming_text">Name:</span> ${claiming_slip_data.cid_client_full_name}</p>
                                    </div>
                                    <div class="row mb-3">
                                        <p class="claiming_text_samp"><span class="claiming_text">Contact Number:</span> ${claiming_slip_data.cid_client_contact}
                                        </p>
                                    </div>
                                    <div class="row mb-3">
                                        <p class="claiming_text_samp"><span class="claiming_text">Platinum Card#:</span> ${claiming_slip_data.cid_platinum_number}</p>
                                    </div>
                                    <div class="d-flex flex-row">
                                        <div class="col-5 mb-4">
                                            <p class="claiming_text_samp"><span class="claiming_text">CID#:</span> ${claiming_slip_data.cid_number}</p>
                                        </div>
                                        <div class="col-4 mb-4">
                                            <p class="claiming_text_samp"><span class="claiming_text">DATE:</span> ${claiming_slip_data.current_datetime}</p>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <p class="claiming_text_samp"><span class="claiming_text">Tech In Charge:</span> ${claiming_slip_data.technician_name}</p>
                                    </div>
                                    <hr id="claiming_hr">
                                    <div class="row mb-3">
                                        <p><span class="claiming_bold">ITEM/SERVICES: WARRANTY CLAIM OTHERS:</span></p>
                                    </div>
                                    <div class="row mb-3">
                                        <p><span class="claiming_bold">Unit Details:</span> </p>
                                    </div>
                                    <div class="row">
                                        <div class="col-2  mb-3">
                                        </div>
                                        <div class="row">
                                            <div class="col-6  mb-3">
                                                <p class="claiming_text_samp"><span class="claiming_text">Type:</span> ${claiming_slip_data.service_name}</p>
                                            </div>
                                            <div class="col-6  mb-3">
                                                <p class="claiming_text_samp"><span class="claiming_text">Brand:</span> ${claiming_slip_data.cid_unit_details}</p>
                                            </div>
                                            <div class="col-3  mb-3">
                                                <p class="claiming_text_samp"><span class="claiming_text">Color:</span> ${cs_color}</p>
                                            </div>
                                        </div>
                                        <p class="claiming_text_samp"><span class="claiming_text">Accessories:</span> ${cs_accesories}</p>
                                        <p class="claiming_text_samp"><span class="claiming_text">Notes/Remarks:</span> ${claiming_slip_data.cid_remarks}</p>
                                    </div>
                                    <div class="claiming_instructions">
                                        <p class="instruction">Kindly Surrender this claiming slip when picking up your units. Thank
                                            you!
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            
            </body>
            
            </html>
            `;

            printWindow.document.write(claimingSlipContent);

            printWindow.document.close();

            printWindow.onload = function () {

                printWindow.print();
            };
        }
        print_claiming_slip();
        create_claiming_slip();
    });

    $(document).on('click', '#save_claiming_slip', function () {
        create_claiming_slip();
    });

    function create_claiming_slip() {
        var cs_number = $('#cs_number').text();
        var cid_number = $('#cid_number').text();
        var cs_color = $('#cs_color').val();
        var cs_accesories = $('#cs_accesories').val();

        $.ajax({
            url: "../PHP/create_claiming_slip.php",
            type: "POST",
            data: {
                cs_number: cs_number,
                cid_number: cid_number,
                cs_color: cs_color,
                cs_accesories: cs_accesories
            },
            success: function (response) {
                if (response.status === "success") {
                    $("#claiming_slip_cid").modal("hide");
                } else {
                    ajax_error_handling(xhr, status, error);
                }
            },
            error: function (xhr, status, error) {
                ajax_error_handling(xhr, status, error);
            }
        });
    }

    $(document).on('click', '#print_cid', function () {
        function print_cid() {
            var printWindow = window.open('', '_blank');

            fetch('../../header.php')
                .then(response => response.text())
                .then(headerContent => {
                    var cid_content =
                        `
                <!DOCTYPE html>
                <html lang="en">
                
                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                
                    <!-- Header -->
                    ${headerContent}
                    <link rel="stylesheet" href="../../style.css">
                
                    <title>Print CID</title>
                    <style>
                        @media print {
                            .line {
                                background-color: black;
                                height: 2px;
                                margin: 5px 0;
                                border: 1px solid black;
                            }
                
                            .cid_footer {
                                position: absolute;
                                bottom: 0;
                                margin-bottom: 20px;
                                margin-right: 40px;
                            }
                        }
                
                        @page {
                            size: A4;
                            margin: 0;
                        }
                
                        body {
                            margin: 0;
                            padding: 0;
                            font-family: "Work Sans", sans-serif;
                            background-color: #ffffff;
                        }
                
                        .cid_print_container {
                            width: 100%;
                            max-width: 100%;
                            margin: 0 auto;
                            padding: 20px;
                            box-sizing: border-box;
                        }
                
                        .cid_print_content {
                            width: 100%;
                            max-width: 800px;
                            margin: 0 auto;
                            padding: 20px;
                            box-sizing: border-box;
                            background-color: #f0f0f0;
                
                            text-align: justify;
                            line-height: 1.5;
                            font-size: 10px;
                        }
                
                        .cid_print_content p,
                        .cid_print_content label {
                            margin-top: auto;
                            margin-bottom: auto;
                        }
                
                        .cid_print_text_bold {
                            font-weight: 700;
                        }
                
                        .text_red {
                            color: #c22510;
                        }
                
                        .cid_print_text_small {
                            font-size: 8px;
                        }
                
                        .text-right {
                            text-align: right;
                        }
                
                        .line {
                            width: 100%;
                            height: 2px;
                            background-color: black;
                            margin: 5px 0;
                        }
                
                        input[type="text"] {
                            border: none;
                            border-bottom: 1px solid black;
                        }
                
                        .logo {
                            width: auto;
                            height: 40px;
                            margin: 15px;
                        }
                
                        .title {
                            font-weight: bold;
                            font-family: 'Ethnocentric', sans-serif;
                            color: #2291FD;
                        }
                    </style>
                </head>
                
                <body>
                    <div class="cid_print_container">
                        <div class="cid_print_content d-flex flex-column">
                            <div class="d-flex flex-row align-items-center">
                                <div>
                                    <img src="../../Assets/Images/logo.png" class="logo" alt="" srcset="">
                                </div>
                                <div>
                                    <p class="title">TechyDavid I.T Solutions</p>
                                    <p>📌Daisy St. Plaridel 3 Subd. Bayan Luma 7 , Imus, Philippines</p>
                                    <p>📱0968 855 5399 | 📱0961 149 4441 | ☎️046-424-5604 | 📩techydavid2020@techydavid.com</p>
                                </div>
                            </div>
                            <div>
                                <p class="text-right"><span class="cid_print_text_bold">DIAGNOSTIC REPAIR REPORT</span></p>
                                <p class="text-right"><span class="cid_print_text_bold text_red">CID </span></p>
                                <p class="text-right"><span class="cid_print_text_bold">Claiming Slip: </span></p>
                            </div>
                            <div>
                                <p><span class="cid_print_text_bold">Unit Details / Brand Model: </span></p>
                                <div>
                                    <p class="unit_details_content"></p>
                                </div>
                            </div>
                
                            <div class="line"></div>
                
                            <div>
                                <div>
                                    <p><span class="cid_print_text_bold">REMARKS: (SCRATCHES, COLORS, LCD, ETC)</span></p>
                                    <div>
                                        <p class="remarks_content"></p>
                                    </div>
                                </div>
                
                                <div class="line"></div>
                
                                <div>
                                    <p><span class="cid_print_text_bold">UNIT HISTORY / PROBLEMS / ISSUES & INFORMATION PROVIDED BY
                                            CLIENT:</span></p>
                                    <div>
                                        <p class="unit_history_content"></p>
                                    </div>
                                </div>
                            </div>
                
                            <div class="line"></div>
                
                            <div>
                                <div class="d-flex flex-row justify-content-between">
                                    <div>
                                        <p><span class="cid_print_text_bold">SUMMARY OF REPAIRS / DIAGNOSTIC / OBSERVATION ETC:
                                            </span>
                                        </p>
                                    </div>
                                    <div>
                                        <p><span class="cid_print_text_bold text_red">Date of 1st Notification of Release: </span>
                                        </p>
                                        <p><span class="cid_print_text_bold text_red">Warranty End: </span></p>
                                    </div>
                                </div>
                                <div>
                                    <p class="summary_of_repairs_content"></p>
                                </div>
                                <div class="d-flex flex-row justify-content-between">
                                    <p><span class="cid_print_text_bold">START OF REPAIR DATE: </span></p>
                                    <p><span class="cid_print_text_bold">END OF REPAIR DATE: </span></p>
                                    <p><span class="cid_print_text_bold">TECH IN CHARGE: </span></p>
                                </div>
                            </div>
                
                            <div class="line"></div>
                
                            <div>
                                <p><span class="cid_print_text_bold">RECCOMENDATIONS: </span></p>
                                <div>
                                    <p class="reccomendations_content"></p>
                                </div>
                            </div>
                
                            <div class="line"></div>
                
                            <div>
                                <div class="d-flex flex-row justify-content-between">
                                    <p><span class="cid_print_text_bold">SUMMARY OF PAYMENTS: </span></p>
                                    <p><span class="cid_print_text_bold">CR: </span></p>
                                    <p><span class="cid_print_text_bold">OR: </span></p>
                                    <p><span class="cid_print_text_bold">MODE OF PAYMENT:</span> </p>
                                </div>
                                <div>
                                    <p class="summary_of_payments_content"></p>
                                </div>
                            </div>
                
                            <div class="cid_footer">
                                <div>
                                    <div class="line"></div>
                                    <p class="cid_print_text_small">I hereby acknowledge that I have received and throughly reviewed
                                        the
                                        diagnostic summary provided by the
                                        TECHYDAVID I.T SOLUTIONS .1. The
                                        diagnostic summary outlines the findings ,recommendations , and necessary repairs for the
                                        units
                                        or
                                        items
                                        in questions. I have the opportunity to
                                        discuss and clarify the questions. I understand that any actions or decisions made regarding
                                        the
                                        repairs
                                        and recommendations mentioned in the
                                        diagnostic summary are my sole responsibility.4.TECHYDAVID I.T SOLUTIONS is not liable to
                                        any
                                        consequences ,damages, or losses that may arise
                                        from my decisions or actions taken based on the diagnostic summary or representatives
                                        explanations.
                                        Furthermore, I confirm that I have recieved
                                        all the items mentioned in our agreement and find them to be complete and in satisfactory
                                        conditions. By
                                        signing below, I acknowledge that I have
                                        read, understood and agree terms outlined in the disclaimer.</p>
                                    <br>
                                </div>
                                <div class="d-flex flex-row">
                                    <div class="me-3">
                                        <label class="cid_print_text_bold" for="name_with_signature">Name With Signature:</label>
                                        <input type="text" id="name_with_signature" name="name_with_signature"><br>
                                    </div>
                
                                    <div>
                                        <label class="cid_print_text_bold" for="pickup_date_time">Date & Time of Pick-Up:</label>
                                        <input type="text" id="pickup_date_time" name="pickup_date_time"><br>
                                    </div>
                                </div>
                                <br>
                                <div class="d-flex flex-row">
                                    <div class="me-3">
                                        <label class="cid_print_text_bold" for="released_by">Released Unit by:</label>
                                        <input type="text" id="released_by" name="released_by"><br>
                                    </div>
                
                                    <div class="me-3">
                                        <label class="cid_print_text_bold" for="release_date_time">Released Date & Time:</label>
                                        <input type="text" id="release_date_time" name="release_date_time"><br>
                                    </div>
                
                                    <div>
                                        <label class="cid_print_text_bold" for="released_thru">Released thru:</label>
                                        <input type="text" id="released_thru" name="released_thru"><br>
                                    </div>
                                </div>
                                <div class="line"></div>
                                <div class="cid_print_text_small text_red">Confidentiality, Copyright and other Intellectual property rights.
                                </div>
                                <div class="cid_print_text_small">
                                    The information contained herein is confidential and proprietary to TECHYDAVID I.T SOLUTIONS.It may
                                    not be disclosed or transferred, directly or indirectly, to any third party without the explicit
                                    written permission of TECHYDAVID I.T SOLUTIONS. All rights reserved. No part of this document may be
                                    reproduced, stored in a retrieval system, translated, or transmitted in any form or by any means,
                                    electronic, mechanical, photocopying, recording, or otherwise, without prior written permission of
                                    TECHYDAVID I.T SOLUTIONS.
                                </div>
                            </div>
                        </div>
                    </div>
                </body>
                
                </html>
                `;

                    printWindow.document.write(cid_content);

                    printWindow.document.close();

                    printWindow.onload = function () {
                        printWindow.print();
                    };
                })
                .catch(error => {
                    console.error('Error fetching header content:', error);
                });
        }
        print_cid();
    });

    get_user_account();
    get_technician_ongoing();
    get_services();
    get_status_count();
    get_cids();

    new DataTable('#recent_cids_table');

    var notifIcon = document.getElementById('notif_icon');
    var notifDropdown = document.getElementById('notif_dropdown');

    notifIcon.addEventListener('click', function () {
        if (notifDropdown.style.display === 'none') {
            notifDropdown.style.display = 'block';
        } else {
            notifDropdown.style.display = 'none';
        }
    });
    document.addEventListener('click', function (event) {
        if (!notifIcon.contains(event.target) && !notifDropdown.contains(event.target)) {
            notifDropdown.style.display = 'none';
        }
    });
});