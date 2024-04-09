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
                    console.log(response.data);
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
                            populate_cid_release(response.cids_data);
                            populate_cid_ongoing(response.cids_data);
                            populate_cid_warranty(response.cids_data);
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
                            <h5 class="modal-title" id="modalTitleId">
                            ${data[0].cid_number} ${data[0].cid_client_full_name}
                            </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <p>Unit Details: ${data[0].cid_unit_details}</div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                Close
                            </button>
                            <button type="button" class="btn btn-primary">Save</button>
                        </div>
                    `;
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
                    console.log(response);
                    populate_claiming_slip(response);
                },
                error: function (xhr, status, error) {
                    ajax_error_handling(xhr, status, error);
                }
            });
        }

        function populate_claiming_slip(data) {
            var claiming_slip_number = data.cid_cs_number;
            var cid_info = data.cids_data;


            const claiming_slip_container = $('#claiming_slip_container');
            claiming_slip_container.empty();
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
                            <p>Claiming Slip #: ${claiming_slip_number}</p>
                            <p>Name: ${cid_info[0].cid_client_full_name}</p>
                            <p>Contact Number: ${cid_info[0].cid_client_contact}</p>
                            <p>CID #: ${cid_info[0].cid_number}</p>
                            <p>Date: ${""}</p>
                            <p>Tech in Charge: ${cid_info[0].technician_name}</p>
                            <hr>
                            <p>ITEM/SERVICES: WARRANTY CLAIM</p>
                            <p id="cs_title">Unit Details</p>
                            <p>Unit Type: ${cid_info[0].service_name}</p>
                            <p>Brand: ${cid_info[0].cid_unit_details}</p>
                            <div>
                                <label for="cs_color">Color:</label>
                                <input type="text" name="cs_color" id="cs_color">
                            </div>
                            <div>
                                <label for="cs_accesories">Accesories:</label>
                                <input type="text" name="cs_accesories" id="cs_accesories">
                            </div>
                            <p>Notes / Remarks: ${cid_info[0].cid_remarks}</p>
                        </div>
                    </div>
                    `;         

            claiming_slip_container.append(claiming_slip_HTML);
        }

        
    }

    $(document).on('click', '#print_claiming_slip', function () {
        var printWindow = window.open('', '_blank');

        var claimingSlipContent = $('#claiming_slip_details').html();

        printWindow.document.write('<html><head><title>Claiming Slip</title></head><body>' + claimingSlipContent + '</body></html>');

        printWindow.document.close();
        printWindow.print();
    });

    $(document).on('click', '#print_claiming_slip', function () {
        var printWindow = window.open('', '_blank');

        var claimingSlipContent = $('#claiming_slip_details').html();

        printWindow.document.write('<html><head><title>Claiming Slip</title></head><body>' + claimingSlipContent + '</body></html>');

        printWindow.document.close();
        printWindow.print();
    });

    get_user_account();
    get_technician_ongoing();
    get_services();
    get_status_count();
    get_cids();

    new DataTable('#recent_cids_table');
});

// JavaScript code for handling dropdown functionality
document.addEventListener('DOMContentLoaded', function () {
    var notifIcon = document.getElementById('notif_icon');
    var notifDropdown = document.getElementById('notif_dropdown');

    // Show/hide dropdown when notification icon is clicked
    notifIcon.addEventListener('click', function () {
        if (notifDropdown.style.display === 'none') {
            notifDropdown.style.display = 'block';
        } else {
            notifDropdown.style.display = 'none';
        }
    });

    // Hide dropdown when user clicks outside of it
    document.addEventListener('click', function (event) {
        if (!notifIcon.contains(event.target) && !notifDropdown.contains(event.target)) {
            notifDropdown.style.display = 'none';
        }
    });
});