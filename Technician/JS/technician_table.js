$(document).ready(function () {
    var tableType = $('#cids_table').data('type');
    var tableStatus = $('#cids_table').data('status');
    // new DataTable('#cids_table');

    get_cids(tableType, tableStatus);
});

function get_cids(type, tableStatus) {
    $.ajax({
        url: "../PHP/get_cids.php",
        method: "GET",
        dataType: "json",
        data: {
            type: type,
            tableStatus: tableStatus
        },
        success: function (data) {
            populate_cids_table(data);
            console.log(data);
        },
        error: function (xhr, status, error) {
            console.error("Error fetching data:", xhr, status, error);
        }
    });
}

function populate_cids_table(data) {
    var table = $('#cids_table').DataTable({
        "order": []
    });
    table.clear().draw();

    if (data && data.cids_data) {
        data.cids_data.forEach(function (cid) {
            table.row.add([
                cid.cid_number,
                cid.cid_client_full_name,
                cid.cid_unit_details,
                cid.cid_remarks,
                cid.cid_unit_history,
                cid.cid_status,
                cid.formatted_created
            ]).draw(false);
        });
    }
}

$('#cids_table tbody').on('click', 'tr', function () {
    var rowData = $(this).closest('table').DataTable().row(this).data();
    var cid_number = rowData[0];

    sessionStorage.setItem('cid_number', cid_number);

    window.location.href = 'cidsedit.php';
});