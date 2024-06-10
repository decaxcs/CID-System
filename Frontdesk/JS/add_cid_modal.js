var currentDateTimeSpan = document.getElementById('currentDateTime');

function updateDateTime() {
    var currentDate = new Date();

    var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October",
        "November", "December"
    ];

    var year = currentDate.getFullYear();
    var monthIndex = currentDate.getMonth();
    var monthName = months[monthIndex];
    var day = ('0' + currentDate.getDate()).slice(-2);
    var hours = ('0' + (currentDate.getHours() % 12 || 12)).slice(-2);
    var minutes = ('0' + currentDate.getMinutes()).slice(-2);
    var ampm = currentDate.getHours() >= 12 ? 'PM' : 'AM';

    currentDateTimeSpan.textContent = monthName + ' ' + day + ', ' + year + ' - ' + hours + ':' + minutes + ' ' +
        ampm;
}

updateDateTime();

setInterval(updateDateTime, 1000);

$(document).ready(function () {

    var signature_dataURL;

    var checkboxes = {};
    // var additional_checkboxes = {};

    var additional_radiobuttons = {};

    var selectedOption;

    var cid_number;
    var client_full_name;
    var client_contact;
    var client_email;
    var platinum;
    var platinum_number;
    var representative;
    var advertisement;

    function ajax_error_handling(xhr, status, error) {
        console.log("Error:", error);
        console.log("Status:", status);
        console.log("XHR:", xhr);
        console.log("An error occurred while fetching data from the server.");
    }

    const signatureDisplayImage = document.getElementById('signature_display');

    const signatureInputCanvas = document.getElementById('signature_input');
    const signaturePad = new SignaturePad(signatureInputCanvas);

    function validate_inputs() {
        const allRequiredChecked = validateRequiredFields();
        const allRadioGroupsValid = validateRadioGroups();
        const platinumValidation = validatePlatinumNumber();

        return allRequiredChecked && allRadioGroupsValid && platinumValidation;
        // return true;
    }

    function validateRequiredFields() {
        let allRequiredChecked = true;
        $('input[type="text"], input[type="number"], select').each(function () {
            if ($(this).hasClass('required') && !$(this).val()) {
                allRequiredChecked = false;
                return false;
            }
        });

        return allRequiredChecked;
    }

    $('#platinum_member').change(function () {
        const isPlatinumMember = $(this).val() === 'Yes';
        $('#platinum_number').prop('disabled', !isPlatinumMember);
    });

    function validateRadioGroups() {
        let allRadioGroupsValid = true;

        $('input[type=radio]').each(function () {
            const groupName = $(this).attr('name');
            const isChecked = $(`input[name="${groupName}"]:checked`).length > 0;

            if (!isChecked) {
                allRadioGroupsValid = false;
                return false;
            }
        });

        return allRadioGroupsValid;
    }

    function validatePlatinumNumber() {
        const platinumMember = $('#platinum_member').val();
        const platinumNumber = $('#platinum_number');

        if (platinumMember === 'Yes' && !platinumNumber.val()) {
            return false;
        }

        return true;
    }

    function add_cid() {
        $('input[type="checkbox"]').each(function () {
            var checkboxName = $(this).attr('name');
            var checkboxValue = $(this).prop('checked');

            // if (checkboxName === 'additional') {
            //     additional_checkboxes[$(this).attr('id')] = checkboxValue;
            // } else {
                checkboxes[$(this).attr('id')] = checkboxValue;
            // }
        });

        $('input[type="radio"]').each(function () {
            var radioButtonName = $(this).attr('name');
            if ($(this).prop('checked')) {
                additional_radiobuttons[radioButtonName] = $(this).val();
            }
        });

        client_full_name = $("#client_name").val();
        client_contact = $("#contact_number").val();
        client_email = $("#client_email").val();
        platinum = $("#platinum_member").val() === "Yes" ? 1 : 0;
        platinum_number = $("#platinum_number").val();
        representative = $("#representative").val();
        advertisement = $("#how_know").val();

        $("#newModal").modal("show");

    }

    signatureDisplayImage.addEventListener("click", function () {
        $("#signature_modal").modal("show");
    });

    const clearButton = document.getElementById("clear");
    clearButton.addEventListener("click", () => {
        signaturePad.clear();
    });

    const saveButton = document.getElementById("save");
    saveButton.addEventListener("click", () => {
        if (signaturePad.isEmpty()) {
            alert("Please provide a signature first.");
        } else {
            const dataURL = signaturePad.toDataURL();
            signature_dataURL = dataURL;

            signatureDisplayImage.src = signature_dataURL;
            $("#signature_modal").modal("hide");
        }
    });

    $('#newModal').on('show.bs.modal', function (event) {
        create_cid_number();
        get_technician_services();


    })
    $('#proceed_button').click(function () {
        if (validate_inputs() && signature_dataURL) { // Check if the inputs are valid and signature is provided
            add_cid();
        } else {
            if (!signature_dataURL) {
                // If signature is not provided, show an alert
                $('#alertContainer').append(
                    `<div id="alert" class="alert alert-danger" role="alert">
                        Please provide a signature.
                    </div>`
                );

                setTimeout(function () {
                    $('#alert').fadeOut(500, function () {
                        $(this).remove();
                    });
                }, 3000);
            } else {
                // If other required fields are not filled, show another alert
                $('#alertContainer').append(
                    `<div id="alert" class="alert alert-danger" role="alert">
                        Please check all required checkboxes.
                    </div>`
                );

                setTimeout(function () {
                    $('#alert').fadeOut(500, function () {
                        $(this).remove();
                    });
                }, 3000);
            }
        }
    });

    $('#cancel_button').click(function () {
        window.location.href = "frontdesk.php";
    });


    $('#create_button').click(function () {
        const textareas = document.querySelectorAll('.modal-body textarea.required');
        let allTextareasFilled = true;

        textareas.forEach(textarea => {
            if (textarea.value.trim() === '') {
                allTextareasFilled = false;
                textarea.classList.add('is-invalid');

                setTimeout(() => {
                    textarea.classList.remove('is-invalid');
                }, 3000);
            } else {
                textarea.classList.remove('is-invalid');
            }
        });

        if (allTextareasFilled) {
            create_cid();
        }
    });

    function create_cid_number() {
        $.ajax({
            url: "../PHP/create_cid_number.php",
            type: "GET",
            success: function (response) {
                cid_number = response.cid_number;
                $('#cid_number').text(cid_number);
            },
            error: function (xhr, status, error) {
                ajax_error_handling(xhr, status, error);
            }
        });
    }

    function create_cid() {
        var cid_number = $('#cid_number').text();
        var unit_details = $('#unit_details').val();
        var remarks = $('#remarks').val();
        var unit_history = $('#unit_history').val();
        var technician = $('#technician').val();
        var computer_service = $('#computer_service').val();
        var device = $('#device').val();
        
        console.log(computer_service);

        $.ajax({
            url: "../PHP/create_cid.php",
            type: "POST",
            data: {
                signature_dataURL: signature_dataURL,

                cid_number: cid_number,

                checkboxes: checkboxes,
                // additional_checkboxes: additional_checkboxes,

                additional_radiobuttons: additional_radiobuttons,

                selectedOption: selectedOption,
                client_full_name: client_full_name,
                client_contact: client_contact,
                client_email: client_email,
                platinum: platinum,
                platinum_number: platinum_number,
                representative: representative,
                advertisement: advertisement,

                cid_number: cid_number,
                unit_details: unit_details,
                remarks: remarks,
                unit_history: unit_history,
                technician: technician,
                computer_service: computer_service,
                device: device
            },
            success: function (response) {
                if (response.status === "success") {
                    window.location.href = 'frontdesk.php';
                } else {

                }
            },
            error: function (xhr, status, error) {
                ajax_error_handling(xhr, status, error);
            }
        });
    }

    function get_technician_services() {
        $.ajax({
            url: "../PHP/get_technician_services.php",
            type: "GET",
            success: function (response) {
                if (response.status === "success") {
                    select_technician(response.users_data);
                    select_source(response.sources_data);
                    select_services(response.services_data);
                    select_devices(response.devices_data);
                    console.log(response);
                } else {
                    console.log("Error: No data found.");
                }
            },
            error: function (xhr, status, error) {
                ajax_error_handling(xhr, status, error);
            }
        });
    }

    function select_technician(data) {
        var select_technician_containers = $('.select_technician');
        select_technician_containers.empty();

        data.forEach(function (item) {
            var select_technician_HTML =
                `
                <option value="${item.csu_id}">${item.csu_name}</option>
                `;
            select_technician_containers.append(select_technician_HTML);
        });
        
        $('.multiple_select').select2({
            width: '30%', // Set width to 100% to ensure it takes up the full width
        });
    }

    function select_source(data) {
        var select_source_containers = $('.select_source');
        select_source_containers.empty();

        data.forEach(function (item) {
            var select_source_HTML =
                `
                <option value="${item.cs_source_name}">${item.cs_source_name}</option>
                `;
                select_source_containers.append(select_source_HTML);
        });
    }


    function select_services(data) {
        var select_services_containers = $('.select_service');
        select_services_containers.empty();

        data.forEach(function (item) {
            var select_services_HTML =
                `
                <option value="${item.cs_service_id}">${item.cs_service_name}</option>
                `;
            select_services_containers.append(select_services_HTML);
        });
        $('.multiple_select').select2({
            width: '30%', // Set width to 100% to ensure it takes up the full width
        });
    }

    function select_devices(data) {
        var select_devices_containers = $('.select_device');
        select_devices_containers.empty();

        data.forEach(function (item) {
            var select_devices_HTML =
                `
                <option value="${item.cs_device_id}">${item.cs_device_name}</option>
                `;
            select_devices_containers.append(select_devices_HTML);
        });
    }

 
    function get_tos() {
        $.ajax({
            url: "../PHP/get_tos.php",
            type: "GET",
            success: function (response) {
                if (response.status === "success") {
                    populate_tos(response);
                    console.log(response);

                } else {
                    console.log("Error: No data found.");
                }
            },
            error: function (xhr, status, error) {
                ajax_error_handling(xhr, status, error);
            }
        });
    }

    function populate_tos(data) {
        var tos_data = data.tos_data;
        var additional_data = data.additional_data;

        var tos_container = $('#tos_container');
        tos_container.empty();

        tos_data.forEach(function (tos_item) {

            // var checkboxContentHTML = '';
            // var radiobuttonContentHTML = '';

            // additional_data.forEach(function (additional_item) {
            //     if (additional_item.tos_id === tos_item.tos_id) {
            //         if (additional_item.additional_type === 'checkbox') {
            //             checkboxContentHTML += `
            //                 <div class="form-check-nested">
            //                     <input class="form-check-input" type="checkbox" value="" name="additional" id="${additional_item.tos_a_id}">
            //                     <label class="form-check-label" for="${additional_item.tos_a_id}">
            //                         ${additional_item.additional_content}
            //                     </label>
            //                 </div>
            //             `;
            //         } else if (additional_item.additional_type === 'radiobutton') {
            //             radiobuttonContentHTML += `
            //                     <div class="form-check form-check-inline">
            //                         <input class="form-check-input" type="radio" name="${additional_item.tos_a_id}"
            //                             id="yes_${tos_item.tos_a_id}" value="Yes">
            //                         <label class="form-check-label" for="yesRadioButton">Yes</label>
            //                     </div>
            //                     <div class="form-check form-check-inline">
            //                         <input class="form-check-input" type="radio" name="${additional_item.tos_a_id}"
            //                             id="no_${tos_item.tos_id}" value="No">
            //                         <label class="form-check-label" for="no_${tos_item.tos_a_id}">No</label>
            //                     </div>
            //                 </div>
            //             `;
            //         }
            //     }
            // });

            var tos_HTML =
                `
                <div class="row mb-3">
                    <div class="row">
                        <div class="form-check">
                            <input class="form-check-input required_${tos_item.tos_required}" type="checkbox" class=""  id="${tos_item.tos_id}">
                            <label class="form-check-label" for="${tos_item.tos_id}">
                                <div class="row">
                                    <div class="col-auto">
                                        <div>${tos_item.tos_sequence}.</div>
                                    </div>
                                    <div class="col">
                                        ${tos_item.tos_content}
                                    </div>
                                </div>
                            </label>
                            <!-- checkboxContentHTML -->
                            <!-- radiobuttonContentHTML -->
                        </div>
                        
                    </div>
                </div>
                `;
            tos_container.append(tos_HTML);
        });
    }

    get_tos();
    get_technician_services();
});