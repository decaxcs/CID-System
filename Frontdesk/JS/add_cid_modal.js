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

        console.log("Checkbox Values:", checkboxValues);
        console.log("Selected Option:", selectedOption);
        console.log("Client Full Name:", client_full_name);
        console.log("Client Contact:", client_contact);
        console.log("Platinum:", platinum);
        console.log("Platinum Number:", platinum_number);
        console.log("Representative:", representative);
        console.log("Advertisement:", advertisement);

        
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
    $("#proceedButton").click(add_cid);
});




// Function to check if all checkboxes are checked
function checkCheckboxes() {
    var checkboxes = document.querySelectorAll('input[type="checkbox"]:not(.form-check-nested input)');
    for (var i = 0; i < checkboxes.length; i++) {
        if (!checkboxes[i].checked) {
            return false; // If any checkbox is not checked, return false
        }
    }
    return true; // If all checkboxes are checked, return true
}

// Function to create and display an alert with a close button
function showAlert(message) {
    var alertContainer = document.getElementById('alertContainer');
    var alertHtml = `
        <div class="alert alert-primary alert-dismissible fade show" role="alert">
            ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>`;
    alertContainer.innerHTML = alertHtml;
}

// Add event listener to the proceed button
document.getElementById('proceedButton').addEventListener('click', function() {
    // Check if all checkboxes are checked
    if (!checkCheckboxes()) {
        // Display alert if not all checkboxes are checked
        showAlert('Please fill in all required fields.');
        return; // Prevent further action
    }

    // If all checkboxes are checked, remove any existing alerts and proceed with further actions here
    var alertContainer = document.getElementById('alertContainer');
    alertContainer.innerHTML = ''; // Clear any existing alerts
    // Proceed with further actions here
    // ...
});

