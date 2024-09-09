var cid_data = [];
var payments_data = [];
var cs_payment_data = [];
var checklist_data = [];
var cms_data = [];

var components = [{
        name: 'Wifi',
        key: 'cs_cid_c_wifi'
    },
    {
        name: 'Keyboard (FN Keys)',
        key: 'cs_cid_c_keyboard'
    },
    {
        name: 'Temperature',
        key: 'cs_cid_c_temperature'
    },
    {
        name: 'Tracepad',
        key: 'cs_cid_c_tracepad'
    },
    {
        name: 'Bluetooth',
        key: 'cs_cid_c_bluetooth'
    },
    {
        name: 'Audio Jack',
        key: 'cs_cid_c_audiojack'
    },
    {
        name: 'Speaker',
        key: 'cs_cid_c_speaker'
    },
    {
        name: 'Camera',
        key: 'cs_cid_c_camera'
    },
    {
        name: 'LCD (Brightness)',
        key: 'cs_cid_c_lcd'
    },
    {
        name: 'Stress Test',
        key: 'cs_cid_c_stresstest'
    }
];

var checklistText = ''; // Variable to store checklist text

components.forEach(function (component) {
    var value = checklist_data ? checklist_data[component.key] : null;
    var status = '';

    // Assign text representation based on value
    if (value === 1) {
        status = 'Ok';
    } else if (value === 2) {
        status = 'Not Ok';
    } else {
        status = 'N/A';
    }

    // Append text to checklistText variable
    checklistText += `${component.name}: ${status}\n`;
});

console.log(checklistText); // Output checklistText to console or use it as needed


function get_cid_info(cid_number, callback) {
    $.ajax({
        url: "../PHP/get_cids.php",
        type: "GET",
        data: {
            cid_number: cid_number
        },
        success: function (response) {
            if (response.status === "success") {
                callback(response);
                console.log(response);
                checklist_data = response.checklist_data[0];
                cid_data = response.cids_data;
                payments_data = response.payments_data;
                cs_payment_data = response.cs_payment_data;
                cms_data = response.cms_data[0];
            } else {
                console.log("Error: No data found.");
            }
        },
        error: function (xhr, status, error) {
            ajax_error_handling(xhr, status, error);
        }
    });
}

$(document).ready(function () {


    function formatDate(dateString) {
        if (!dateString) return ''; // Return empty string if dateString is null or empty
        const date = new Date(dateString);
        const options = {
            year: 'numeric',
            month: 'long',
            day: 'numeric'
        };
        return date.toLocaleDateString('en-US', options);
    }
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
                    console.log("Technician");
                    console.log(response.data);
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
            // Calculate the width of the progress bar based on the ongoing service count
            var progressWidth = (item.ongoing_service_count / 10) * 100; // Assuming a maximum of 10 services

            var technician_ongoing_HTML =
                `
                <p class="technician_name">${item.technician_names ? item.technician_names : "No Technician"}</p>
                <div class="progress">
                    <div class="progress-bar" role="progressbar" style="width: ${progressWidth}%" 
                         aria-valuenow="${item.ongoing_service_count}" aria-valuemin="0" aria-valuemax="10">
                        ${item.ongoing_service_count}
                    </div>
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
        $('#release_count').text(data["For Release"] ? data["For Release"] : '0');
        $('#ongoing_count').text(data["On-going"] ? data["On-going"] : '0');
        $('#warranty_count').text(data["On-going Warranty"] ? data["On-going Warranty"] : '0');
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
                    "data": "technician_names", // Display technician names here
                    "render": function (data) {
                        if (data) {
                            return data.split(',').join(', ');
                        }
                        return '';
                    }
                },
                {
                    "data": "cid_unit_details"
                },
                {
                    "data": "cid_status"
                },
                {
                    "data": "formatted_created",
                    "render": function (data) {
                        // Convert the formatted date string to a Date object
                        const date = new Date(data);
                        // Format the date as "MM/DD/YYYY"
                        return date.toLocaleDateString('en-US', {
                            month: 'short',
                            day: '2-digit',
                            year: 'numeric'
                        });
                    }
                },
                {
                    "render": function (data, type, row) {
                        return `
                            <div class="recent_cid_buttons_container">
                                <button type="button" class="btn btn-success claiming_slip"><iconify-icon icon="quill:paper"></iconify-icon></button>   
                            </div>
                        `;
                    }
                }

            ],
            "columnDefs": [{
                "orderable": false,
                "searchable": false,
                "targets": [6] // Disable sorting for the button column
            }],
            "order": [
                [5, "desc"] // Sort by the formatted date column in descending order
            ]
        });

        $('#recent_cids_table tbody').on('click', 'tr', function () {
            var rowData = $('#recent_cids_table').DataTable().row(this).data();
            var cid_number = rowData.cid_number;
            $("#view_cid").modal("show");

            get_cid_info(cid_number, populate_cid_contents);

            function populate_cid_contents(cids) {
                var data = cids.cids_data;
                var payments = cids.payments_data;
                var checklist = cids.checklist_data[0];
                console.log(payments);
                console.log(data);
                console.log("data");
                console.log(checklist);
                var cid_contents_container = $('#cid_contents_container');

                cid_contents_container.empty();

                var paymentHTML = ''; // Define paymentHTML variable

                payments.forEach(function (payment) {
                    paymentHTML += `
                    <div class="col-auto me-auto mb-4">
                        <span class="cid_bold">Payment: </span>
                        <table class="table table-borderless">
                            <tbody>
                                <tr>
                                <td><span class="cid_bold">Service:</span></td>
                                    <td><span>${payment.cs_service_name}</span></td>
                                </tr>
                                <tr>
                                <td><span class="cid_bold">Cost:</span></td>
                                    <td><span>${payment.cid_sop_cost}</span></td>
                                </tr>
                                <!-- Display Discount and Discounted Price only if Discount is greater than 0 -->
                                ${payment.cid_sop_discount > 0 ? `
                                    <tr>
                                    <td><span class="cid_bold">Discount:</span></td>
                                        <td><span>${payment.cid_sop_discount}%</span></td>
                                    </tr>
                                    <tr>
                                    <td><span class="cid_bold">Discounted Price:</span></td>
                                        <td><span>${payment.cid_sop_discounted_price}</span></td>
                                    </tr>
                                ` : ''}
                                <!-- Display Mode of Payment and Ref# only if Paid is Yes -->
                                ${payment.cid_sop_paid == 1 ? `
                                    <tr>
                                    <td><span class="cid_bold">Mode of Payment:</span></td>
                                        <td><span>${payment.cid_sop_payment_method}</span></td>
                                    </tr>
                                    <!-- Display Ref# only if Mode of Payment is not 'Cash' -->
                                    ${payment.cid_sop_payment_method != 'Cash' ? `
                                        <tr>
                                        <td><span class="cid_bold">Ref#:</span></td>
                                            <td><span>${payment.cid_sop_ref_no ? payment.cid_sop_ref_no : 'N/A'}</span></td>
                                        </tr>
                                        
                                    ` : ''}
                                    
                                ` : ''}
                                <tr>
                                    <td><span class="cid_bold">Paid?</span></td>
                                    <td><span>${payment.cid_sop_paid == 1 ? 'Yes' : 'No'}</span></td>
                                </tr>

                                ${payment.cid_sop_warranty_start != null ? `
                                <tr>
                                    <td><span class="cid_bold">Warranty Start:</span></td>
                                    <td><span>${formatDate(payment.cid_sop_warranty_start)} </span></td>
                                </tr>
                                <tr>
                                    <td><span class="cid_bold">Warranty End:</span></td>
                                    <td><span>${formatDate(payment.cid_sop_warranty_end)} | ${payment.cid_sop_warranty_duration} ${payment.cid_sop_warranty_unit}(s) ${payment.cid_sop_warranty_type} Warranty</span></td>
                                </tr>
                            ` : ''}

                            </tbody>
                        </table>
                    </div>
                    `;
                });

                var components = [{
                        name: 'Wifi',
                        key: 'cs_cid_c_wifi'
                    },
                    {
                        name: 'Keyboard (FN Keys)',
                        key: 'cs_cid_c_keyboard'
                    },
                    {
                        name: 'Temperature',
                        key: 'cs_cid_c_temperature'
                    },
                    {
                        name: 'Tracepad',
                        key: 'cs_cid_c_tracepad'
                    },
                    {
                        name: 'Bluetooth',
                        key: 'cs_cid_c_bluetooth'
                    },
                    {
                        name: 'Audio Jack',
                        key: 'cs_cid_c_audiojack'
                    },
                    {
                        name: 'Speaker',
                        key: 'cs_cid_c_speaker'
                    },
                    {
                        name: 'Camera',
                        key: 'cs_cid_c_camera'
                    },
                    {
                        name: 'LCD (Brightness)',
                        key: 'cs_cid_c_lcd'
                    },
                    {
                        name: 'Stress Test',
                        key: 'cs_cid_c_stresstest'
                    }
                ];

                var checklistText = ''; // Variable to store checklist text

                // Calculate the midpoint index
                var midpointIndex = Math.ceil(components.length / 2);

                // Update the checklistText generation to create HTML elements
                var checklistText = `
                <div class="row">
                    <div class="col">
                `;
                components.forEach(function (component, index) {
                    var value = checklist ? parseInt(checklist[component.key]) : null;
                    var status = '';

                    // Assign text representation based on value
                    if (value !== null && value !== undefined) {
                        if (value === 1) {
                            status = 'Ok';
                        } else if (value === 2) {
                            status = 'Not Ok';
                        } else {
                            status = 'N/A';
                        }
                    } else {
                        status = 'N/A';
                    }

                    // Append HTML for the component
                    checklistText += `
                    <div>${component.name}: ${status}</div>
                `;
                    // If it's the midpoint, close the first column and start the second column
                    if (index === midpointIndex - 1) {
                        checklistText += `
                    </div>
                    <div class="col">
                    `;
                    }
                });
                // Close the second column and the row
                checklistText += `
                    </div>
                </div>
                `;

                // Log or use checklistText as needed
                console.log(checklistText);

                console.log(checklistText);

                var cid_contents_HTML =
                    `
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="">
                            <div class="row">
                                <div class="col-auto me-auto" id="person_in_charge">FILL UP BY PERSON IN CHARGE ONLY</div>
                                <div class="col-auto cid_bold">DIAGNOSTIC REPAIR REPORT</div>
                            </div>
                            <div class="row">
                                <div class="col-auto me-auto cid_bold">SPECIFY THE FF:</div>
                                CID#:<div class="col-auto" id="cid_number">${data[0].cid_number}</div>
                            </div>
                            <div class="row">
                            <div class="col-auto ms-auto" class="cid_bold">Claiming Slip: ${data[0].cid_cs_number ? data[0].cid_cs_number : 'N/A'} <span></p>
                            </div>
                            </div>
                            <div class="row">
                                <div class="col-auto me-auto cid_bold">Unit Details / Brand Model: <span
                                        class="cid_text">
                                        <p>
                                        ${data[0].cid_unit_details ? '<ul><li>' + data[0].cid_unit_details.split('\n').join('</li><li>') + '</li></ul>' : ''}
                                        </p>
                                </div>
                            
                            </div>
                            <div class="line"></div>
                            <div class="row">
                                <div class="col-auto me-auto cid_bold">REMARKS: (SCRATCHES, COLORS, LCD, ETC)<span
                                        class="cid_text"></p>
                                </div>
                                <div>
                                ${data[0].cid_remarks ? '<ul><li>' + data[0].cid_remarks.split('\n').join('</li><li>') + '</li></ul>' : ''}
                                </div>
                            </div>
                            <div class="line"></div>
                            <div class="row" id="unit_history">
                                <div class="col-auto me-auto">
                                    <p class="cid_bold">
                                    UNIT HISTORY / PROBLEMS / ISSUES & INFORMATION PROVIDED BY CLIENT:<span class="cid_text">
                                    </p>
                                    ${data[0].cid_unit_history ? '<ul><li>' + data[0].cid_unit_history.split('\n').join('</li><li>') + '</li></ul>' : ''}
                                </div>
                            </div>
                            <div class="line"></div>
                            <div class="row mb-2">
                                <div class="d-flex flex-row justify-content-between w-100">
                                    <div class="d-flex flex-column col-7"> <!-- Adjusted class name -->
                                        <p><span class="cid_print_text_bold cid_bold">SUMMARY OF REPAIRS / DIAGNOSTIC /
                                                OBSERVATION ETC:</span></p>
                                    </div>
                                    <div class="col-5">
                                    </div>
                                </div>
                                <div>
                                ${checklistText}
                                <p>${data[0].cid_sor_content ? '<ul><li>' + data[0].cid_sor_content.split('\n').join('</li><li>') + '</li></ul>' : ''}</p>
                                </div>
                            </div>

                            <div>
                                <p class="summary_of_repairs_content mb-4"></p>
                            </div>
                            <div class="row d-flex justify-content-center justify-content-between">
                                <div class="col-auto"><span class="cid_bold">START OF REPAIR DATE: </span>${data[0].cid_sor_start_date ? data[0].cid_sor_start_date : ''}</p>
                                </div>
                                <div class="col-auto"><span class="cid_bold">END OF REPAIR DATE: </span>${data[0].cid_sor_end_date ? data[0].cid_sor_end_date : ''}</p>
                                </div>
                                <div class="col-auto"><span class="cid_bold">TECH IN CHARGE: </span> ${data[0].technician_names ? data[0].technician_names : ""}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="line"></div>
                                <div class="row " id="reccomendations_cid">
                                    <div class="col-auto me-auto cid_bold">
                                        RECOMMENDATIONS: <span class="cid_text"></p>
                                    </div>
                                    <div>
                                    <p>${data[0].cid_r_content ? '<ul><li>' + data[0].cid_r_content.split('\n').join('</li><li>') + '</li></ul>' : ''}</p>
                                    </div>
                                </div>
                                <div class="line"></div>

                                <div class="row d-flex justify-content-between mb-4" id="mode_of_payments">
                                    <div class="col-auto cid_bold">SUMMARY OF PAYMENTS:</div>
                                    <div class="col-auto"><span class="cid_bold">CR: </span> ${data[0].cid_sop_cr ? data[0].cid_sop_cr : ''}
                                    </div>
                                    <div class="col-auto"><span class="cid_bold">OR: </span> ${data[0].cid_sop_or ? data[0].cid_sop_or : ''}
                                    </div>
                                </div>
                                <div class="row">
                                    ${paymentHTML}
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
            console.log(cid_number);
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
                technician_names: cid_info[0].technician_names,
                device_name: cid_info[0].device_name,
                cid_unit_details: cid_info[0].cid_unit_details,
                cid_remarks: cid_info[0].cid_remarks,
            }

            var claiming_slip_HTML =
                `
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalTitleId">
                            Claiming Slip
                        </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body m-0">
                        <div id="claiming_slip_details">
                            <p>Claiming Slip #: <span id="cs_number">${claiming_slip_data.claiming_slip_number}</span></p>
                            <p>Name: ${claiming_slip_data.cid_client_full_name}</p>
                            <p>Contact Number: ${claiming_slip_data.cid_client_contact}</p>
                            <p>CID #: <span id="cid_number">${claiming_slip_data.cid_number}</span></p>
                            <p>Date: ${claiming_slip_data.current_datetime}</p>
                            <p>Tech in Charge: ${claiming_slip_data.technician_names ? claiming_slip_data.technician_names : 'No Technician'}</p>
                            <hr>
                            <p>ITEM/SERVICES: WARRANTY CLAIM</p>
                            <p id="cs_title">Unit Details</p>
                            <p>Unit Type: ${claiming_slip_data.device_name}</p>
                            <p>Brand: ${claiming_slip_data.cid_unit_details}</p>
                            <p>Notes / Remarks: ${claiming_slip_data.cid_remarks ? claiming_slip_data.cid_remarks : 'N/A'}</p>
                        </div>
                    </div>
                    <div class="modal-footer mb-4">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                            Close
                        </button>
                        <button type="button" class="btn btn-info" id="print_claiming_slip">Print</button>
                        <button type="button" class="btn btn-primary" id="save_claiming_slip">Save</button>
                    </div>
                `;
            claiming_slip_container.append(claiming_slip_HTML);
        }
    }

    var claiming_slip_data;

    $(document).on('click', '#print_claiming_slip', function () {
        function print_claiming_slip() {
            console.log();
            var printWindow = window.open('', '_blank');

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
                                        <p class="claiming_text_samp"><span class="claiming_text">Tech In Charge:</span> ${claiming_slip_data.technician_names ? claiming_slip_data.technician_names : 'No Technician'}</p>
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
                                                <p class="claiming_text_samp"><span class="claiming_text">Type:</span> ${claiming_slip_data.device_name}</p>
                                            </div>
                                            <div class="col-6  mb-3">
                                                <p class="claiming_text_samp"><span class="claiming_text">Brand:</span> ${claiming_slip_data.cid_unit_details}</p>
                                            </div>
                                        </div>
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

        console.log(cs_number);
        console.log(cid_number);
        $.ajax({
            url: "../PHP/create_claiming_slip.php",
            type: "POST",
            data: {
                cs_number: cs_number,
                cid_number: cid_number,

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


                    var components = [{
                            name: 'Wifi',
                            key: 'cs_cid_c_wifi'
                        },
                        {
                            name: 'Keyboard (FN Keys)',
                            key: 'cs_cid_c_keyboard'
                        },
                        {
                            name: 'Temperature',
                            key: 'cs_cid_c_temperature'
                        },
                        {
                            name: 'Tracepad',
                            key: 'cs_cid_c_tracepad'
                        },
                        {
                            name: 'Bluetooth',
                            key: 'cs_cid_c_bluetooth'
                        },
                        {
                            name: 'Audio Jack',
                            key: 'cs_cid_c_audiojack'
                        },
                        {
                            name: 'Speaker',
                            key: 'cs_cid_c_speaker'
                        },
                        {
                            name: 'Camera',
                            key: 'cs_cid_c_camera'
                        },
                        {
                            name: 'LCD (Brightness)',
                            key: 'cs_cid_c_lcd'
                        },
                        {
                            name: 'Stress Test',
                            key: 'cs_cid_c_stresstest'
                        }
                    ];

                    var checklistText = ''; // Variable to store checklist text

                    // Calculate the midpoint index
                    var midpointIndex = Math.ceil(components.length / 2);

                    // Update the checklistText generation to create HTML elements
                    var checklistText = `
                        <div class="row">
                            <div class="col">
                        `;
                    components.forEach(function (component, index) {
                        var value = checklist_data ? parseInt(checklist_data[component.key]) : null;
                        var status = '';

                        // Assign text representation based on value
                        if (value !== null && value !== undefined) {
                            if (value === 1) {
                                status = 'Ok';
                            } else if (value === 2) {
                                status = 'Not Ok';
                            } else {
                                // Skip components with status 3 or other values
                                return;
                            }
                        } else {
                            // Skip components with no value
                            return;
                        }

                        // Append HTML for the component
                        checklistText += `
                                <div>${component.name}: ${status}</div>
                            `;
                        // If it's the midpoint, close the first column and start the second column
                        if (index === midpointIndex - 1) {
                            checklistText += `
                                    </div>
                                    <div class="col">
                                    `;
                        }
                    });
                    // Close the second column and the row
                    checklistText += `
                            </div>
                        </div>
                        `;

                    // Log or use checklistText as needed

                    console.log(cs_payment_data);


                    var payment_number = 1;
                    var paymentHTML = '';
                    cs_payment_data.forEach(function (payment) {
                        paymentHTML += `
                <tr>
                            <td>Payment #${payment_number}: ${payment.cs_p_note	}</td>
                            <td>${payment.cs_p_amount}</td>
                            <td>${payment.cs_mop_name}</td>
                            <td>${payment.cs_p_reference}</td>
                            <td>${payment.cs_p_ds}</td>
                            <td>${payment.cs_p_or}</td>
                            <td>${payment.formatted_paid_date}</td>
                        </tr>
                        `;
                        payment_number++
                    });

                    var payment_table_HTML = `
                     <div>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Summary of Payments</th>
                                <th>Amount</th>
                                <th>MOP</th>
                                <th>Ref #</th>
                                <th>DS #</th>
                                <th>OR #</th>
                                <th>Date of Payment</th>
                            </tr>
                        </thead>
                        <tbody>
        ${paymentHTML}
                   
                        </tbody>
                    </table>
                </div>
                    `;

                    console.log(payment_table_HTML);

                    var serviceHTML = '';
                    payments_data.forEach(function (service) {
                        serviceHTML += `
                        <tr>
                            <td>${service.cs_service_name}</td>
                            <td>${service.cid_sop_cost}</td>
                            <td>${service.cid_sop_discount}</td>
                            <td>${service.cid_sop_discounted_price}</td>
                            <td>${service.cid_sop_warranty_start || ''}</td>
                            <td>${service.cid_sop_warranty_end || ''}</td>
                            <td>${service.cid_sop_warranty_type || ''}</td>
                        </tr>
                        `;
                    });

                    var service_table_HTML = `
                     <div>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Service/Product</th>
                                <th>Cost</th>
                                <th>Discount</th>
                                <th>Discounted Price</th>
                                <th>Warranty Start</th>
                                <th>Warranty End</th>
                                <th>Warranty Type</th>
                            </tr>
                        </thead>
                        <tbody>
                        ${serviceHTML}
                   
                        </tbody>
                    </table>
                </div>
                    `;

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
                    <link rel="stylesheet" href="../CSS/cid_print.css">
                
                    <title>Print CID</title>
                    <style>
                    .table>:not(caption)>*>* {
                        padding: 2px;
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
                                    <p class="title">${cms_data.cms_company_name}</p>
                                    <p>📌${cms_data.cms_address}</p>
                                    <p>${cms_data.cms_cp1 ? '📱'+ cms_data.cms_cp1 : ''} ${cms_data.cms_cp2 ? ' | 📱'+ cms_data.cms_cp2 : ''} ${cms_data.cms_cp3 ? ' | ☎️'+ cms_data.cms_cp3 : ''} | 📩${cms_data.cms_email}</p>
                                </div>
                            </div>
                            <div>
                                <p class="text-right"><span class="cid_print_text_bold">DIAGNOSTIC REPAIR REPORT</span></p>
                                <p class="text-right"><span class="cid_print_text_bold text_red">CID ${cid_data[0].cid_number}</span></p>
                                <p class="text-right"><span class="cid_print_text_bold">Claiming Slip: ${cid_data[0].cid_cs_number ? cid_data[0].cid_cs_number : ''}</span></p>
                            </div>
                            <div>
                                <p><span class="cid_print_text_bold">Unit Details / Brand Model: </span>
                                ${cid_data[0].cid_unit_details ? '<ul><li>' + cid_data[0].cid_unit_details.split('\n').join('</li><li>') + '</li></ul>' : ''}
                                </p>
                                <div>
                                    <p class="unit_details_content"></p>
                                </div>
                            </div>
                
                            <div class="line"></div>
                
                            <div>
                                <div>
                                    <p><span class="cid_print_text_bold">REMARKS: (SCRATCHES, COLORS, LCD, ETC)</span></p>
                                    <div>
                                        <p class="remarks_content">
                                        ${cid_data[0].cid_remarks ? '<ul><li>' + cid_data[0].cid_remarks.split('\n').join('</li><li>') + '</li></ul>' : ''}
                                        </p>
                                    </div>
                                </div>
                
                                <div class="line"></div>
                
                                <div>
                                    <p><span class="cid_print_text_bold">UNIT HISTORY / PROBLEMS / ISSUES & INFORMATION PROVIDED BY
                                            CLIENT:</span></p>
                                    <div>
                                        <p class="unit_history_content">
                                        ${cid_data[0].cid_unit_history ? '<ul><li>' + cid_data[0].cid_unit_history.split('\n').join('</li><li>') + '</li></ul>' : ''}
                                        </p>
                                    </div>
                                </div>
                            </div>
                
                            <div class="line"></div>
                
                            <div>
                                <div class="d-flex flex-row justify-content-between">
                                    <div class="col-6">
                                        <p><span class="cid_print_text_bold">SUMMARY OF REPAIRS / DIAGNOSTIC / OBSERVATION ETC:
                                            </span>
                                        </p>
                                    </div>
                                  
                                </div>
                                ${checklistText}
                                 <ul>
                                <li>
                                    ${cid_data[0].cid_sor_content ? cid_data[0].cid_sor_content : ''}
                                </li>
                            </ul>
                               <div>
                                    <p class="summary_of_repairs_content"></p>
                                </div>
                                <div class="d-flex flex-row justify-content-between">
                                    <p><span class="cid_print_text_bold">START OF REPAIR DATE: </span>${cid_data[0].cid_sor_start_date ? cid_data[0].cid_sor_start_date : ''}</p>
                                    <p><span class="cid_print_text_bold">END OF REPAIR DATE: </span>${cid_data[0].cid_sor_end_date ? cid_data[0].cid_sor_end_date : ''}</p>
                                    <p><span class="cid_print_text_bold">TECH IN CHARGE: </span>${cid_data[0].technician_names ? cid_data[0].technician_names : "No Technician"}</p>
                                </div>
                            </div>
                
                            <div class="line"></div>
                
                            <div>
                                <p><span class="cid_print_text_bold">RECCOMENDATIONS: </span></p>
                                <div>
                                    <p class="reccomendations_content">
                                     <ul>
                                <li>
                                    ${cid_data[0].cid_r_content ? cid_data[0].cid_r_content : ''}
                                </li>
                            </ul>
                                  </div>
                            </div>
                
                            <div class="line"></div>

                               <div>
                            <div class="d-flex flex-row justify-content-between">
                                <p><span class="cid_print_text_bold">Warranty Details: </span></p>
                            </div>
                            <div class="mt-1">
                            ${service_table_HTML}

                            </div>
                        </div>
             <div class="line"></div>
                
                            <div>
                                <div class="d-flex flex-row justify-content-between">
                                    <p><span class="cid_print_text_bold">SUMMARY OF PAYMENTS: </span></p>
                   </div>
                                <div class="mt-1">
                                    ${payment_table_HTML}

                                </div>
                            </div>
                
                            <div class="cid_footer">
                                <div>
                                    <div class="line"></div>
                                    <p class="cid_print_text_small">${cms_data.cms_acknowledgement}</p>
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
                                <div class="cid_print_text_small">
                                ${cms_data.cms_disclaimer}
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