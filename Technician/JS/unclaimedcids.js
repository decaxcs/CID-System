var cid_number;

$('#cids_table[data-type="unclaimed"] tbody').on('click', 'tr', function () {
    var rowData = $(this).closest('table').DataTable().row(this).data();
    var cid_number = rowData[0];

    sessionStorage.setItem('cid_number', cid_number);

    $('#u_cid_modal').modal('show');
});


$('#u_cid_modal').on('shown.bs.modal', function () {
    cid_number = sessionStorage.getItem('cid_number');
    get_data();
});

function get_data() {
    if (cid_number) {
        $.ajax({
            url: "../PHP/get_data.php",
            method: "POST",
            dataType: "json",
            data: {
                cid_number: cid_number,
            },
            success: function (data) {
                populate_cid_modal(data.data[0]);
            },
            error: function (xhr, status, error) {
                console.error("Error fetching data:", error, xhr, status);
            }
        });
    } else {
        console.error("cid_number not found in session storage");
    }
    console.log(cid_number);
}

function populate_cid_modal(data) {
    var cid_number_m = $('#cid_number_m');
    cid_number_m.empty();
    cid_number_m.text(data.cid_number_cid);

    var u_cid_modal_body_cotnainer = $('#u_cid_modal_body');
    u_cid_modal_body_cotnainer.empty();
    var modal_body_HTML =
        `
        <p>Do you wish to proceed with claiming this CID?</p>
    `
    u_cid_modal_body_cotnainer.append(modal_body_HTML);
}

$('.claim_btn').click(function () {
    var type = $(this).data('type');

    claim_cid(type);
});

function claim_cid(type) {
    var dataToSend = {
        cid_number: cid_number,
        type: type,
    };
    save_data(dataToSend);
}

function save_data(data) {  
    $.ajax({
        url: "../PHP/save_data.php",
        method: "POST",
        dataType: "json",
        data: data,
        success: function (data) {
            get_data();
            alert_display(data.message);
        },
        error: function (xhr, status, error) {
            console.error("Error fetching data:", error, xhr, status);
        }
    });
}

function alert_display(data, type) {
    var alert_container = $('.alert_container');
    alert_container.empty();

    // Default to success if type is not provided
    if (!type) {
        type = 'success';
    }

    var alert_HTML =
        `
    <div class="alert alert-${type}" role="alert">
    ${data}
    </div>
    `
    alert_container.append(alert_HTML);

    setTimeout(function () {
        $('.alert').fadeOut('slow', function() {
            $('#u_cid_modal').modal('hide'); // Close the modal
        });
    }, 3000);
}
