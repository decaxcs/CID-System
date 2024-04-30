$(document).ready(function () {
    new DataTable('#unclaimed_cids');
    get_cids();
});

function get_cids() {
    $.ajax({
        url: "../PHP/get_cids.php",
        method: "GET",
        dataType: "json",
        success: function (data) {
        populate_cids_table(data);
        console.log(data);
        },
        error: function (xhr, status, error) {
            console.error("Error fetching data:", error);
        }
    });
}

function populate_cids_table(data) {
    var table = $('#unclaimed_cids').DataTable();
    table.clear().draw();

    if (data && data.cids_data) {
        data.cids_data.forEach(function (cid) {
            table.row.add([
                cid.cid_number,
                cid.cid_client_full_name,
                cid.cid_unit_details,
                cid.cid_unit_history,
                cid.formatted_created
            ]).draw(false);
        });
    }
}


