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


document.querySelector('.btn_cancel').addEventListener('click', function () {
    var inputFields = document.querySelectorAll('.modal-body input');
    var checkboxes = document.querySelectorAll('.modal-body input[type="checkbox"]');

    inputFields.forEach(function (input) {
        input.value = '';
    });

    checkboxes.forEach(function (checkbox) {
        checkbox.checked = false;
    });
    $('#add_CID_modal').modal('hide');
});

$(document).ready(function () {
    var tosModal = new bootstrap.Modal(document.getElementById('add_CID_modal'));
    var newModal = new bootstrap.Modal(document.getElementById('newModal'));

    function add_cid() {

        var checkboxValues = {};

        $('input[type="checkbox"]').each(function () {
            var checkboxId = $(this).attr('id');
            var checkboxValue = $(this).prop('checked');
            checkboxValues[checkboxId] = checkboxValue;
        });

        var selectedOption = $('input[name="advertisingOption"]:checked').val() === "Yes" ? 1 : 0;

        var client_full_name = $("#client_name").val();
        var client_contact = $("#contact_number").val();
        var platinum = $("#platinum_member").val() === "Yes" ? 1 : 0;
        var platinum_number = $("#platinum_number").val();
        var representative = $("#representative").val();
        var advertisement = $("#how_know").val();

        $.ajax({
            url: "../PHP/add_cid.php",
            type: "POST",
            data: {
                checkboxValues: checkboxValues,
                selectedOption: selectedOption,
                client_full_name: client_full_name,
                client_contact: client_contact,
                platinum: platinum,
                platinum_number: platinum_number,
                representative: representative,
                advertisement: advertisement,
            },
            success: function (response) {
                console.log(response);
                if (response.status === "success") {
                    tosModal.hide();
                    newModal.show();
                } else {

                }
            },
            error: function (xhr, status, error) {
                console.log("Error:", error);
                console.log("Status:", status);
                console.log("XHR:", xhr);
                console.log("An error occurred while processing your request.");
            }
        });
    }

    function get_cid_number() {
        $.ajax({
            url: "../PHP/get_cid_number.php",
            type: "GET",
            success: function (response) {
                $('#cid_number').text(response.cid_number);
            },
            error: function (xhr, status, error) {
                console.log("Error:", error);
                console.log("Status:", status);
                console.log("XHR:", xhr);
                console.log("An error occurred while fetching data from the server.");
            }
        });
    }


    function create_cid() {
        var cid_number = $('#cid_number').text();
        var claiming_slip = $('#claiming_slip').val();
        var unit_details = $('#unit_details').val();
        var remarks = $('#remarks').val();
        var technician = $('#technician').val();
        var computer_service = $('#computer_service').val();

        console.log("CID Number:", cid_number);
        console.log("Claiming Slip:", claiming_slip);
        console.log("Unit Details:", unit_details);
        console.log("Remarks:", remarks);
        console.log("Technician:", technician);
        console.log("Computer Service:", computer_service);


        $.ajax({
            url: "../PHP/create_cid.php",
            type: "POST",
            data: {
                cid_number: cid_number,
                claiming_slip: claiming_slip,
                unit_details: unit_details,
                remarks: remarks,
                technician: technician,
                computer_service: computer_service
            },
            success: function (response) {
                console.log(response);
                if (response.status === "success") {

                } else {

                }
            },
            error: function (xhr, status, error) {
                console.log("Error:", error);
                console.log("Status:", status);
                console.log("XHR:", xhr);
                console.log("An error occurred while processing your request.");
            }
        });
    }

    function get_technician() {
        $.ajax({
            url: "../PHP/get_technician.php",
            type: "GET",
            success: function (response) {
                console.log(response);
                if (response.status === "success") {
                    select_technician(response.data);
                } else {
                    console.log("Error: No data found.");
                }
            },  
            error: function (xhr, status, error) {
                console.log("Error:", error);
                console.log("Status:", status);
                console.log("XHR:", xhr);
                console.log("An error occurred while fetching data from the server.");
            }
        });
    }
    
    function select_technician(data) {
        var select_technician_containers = $('.select_technician');
        select_technician_containers.empty();

        data.forEach(function (item) {
            console.log(item.csu_id);
            console.log(item.csu_name);
            var select_technician_HTML =
                `
                <option value="${item.csu_id}">${item.csu_name}</option>
                `;
            select_technician_containers.append(select_technician_HTML);
        });
    }
    
    $('#newModal').on('show.bs.modal', function (event) {
        get_cid_number();
        get_technician();
    })
    $('#add_CID_modal').on('show.bs.modal', function (event) {
        get_technician();
    })

    $("#proceed_button").click(add_cid);
    $("#create_button").click(create_cid);
});


function checkCheckboxes() {
    var checkboxes = document.querySelectorAll('input[type="checkbox"]:not(.form-check-nested input)');
    for (var i = 0; i < checkboxes.length; i++) {
        if (!checkboxes[i].checked) {
            return false;
        }
    }
    return true;
}

function checkFields() {
    var clientName = document.getElementById('client_name').value.trim();
    var contactNumber = document.getElementById('contact_number').value.trim();
    var platinumNumber = document.getElementById('platinum_number').value.trim();
    
    if (clientName === '' || contactNumber === '' || platinumNumber === '') {
        return false;
    }
    return true;
}

function checkAdvertisingOption() {
    var advertisingOption = document.querySelectorAll('input[name="advertisingOption"]:checked').length;
    return advertisingOption > 0;
}

function showAlert(message) {
    var alertContainer = document.getElementById('alertContainer');
    var alertHtml = `
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>`;
    alertContainer.innerHTML = alertHtml;
}

document.getElementById('proceed_button').addEventListener('click', function () {
    if (!checkCheckboxes() || !checkFields() || !checkAdvertisingOption()) {
        showAlert('Please fill in all required fields and checkboxes.');
        return;
    }
    // If all required fields are filled, checkboxes are checked, and advertising option is selected,
    // then show the modal
    $('#newModal').modal('show');
});

// Function to show modal from outside
function showNewModal() {
    if (!checkCheckboxes() || !checkFields() || !checkAdvertisingOption()) {
        showAlert('Please fill in all required fields and checkboxes.');
        return;
    }
    // If all required fields are filled, checkboxes are checked, and advertising option is selected,
    // then show the modal
    $('#newModal').modal('show');
}


