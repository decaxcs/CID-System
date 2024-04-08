$(document).ready(function () {
    console.log("run");

    // Initialize DataTables for each table
    new DataTable('#release_table', 'release');
    new DataTable('#on-going_table', 'on-going');
    new DataTable('#warranty_table', 'warranty');
});

function DataTable(selector, cidStatus) {
    $(selector).DataTable({
        "ajax": {
            "url": "../PHP/get_cids_status.php",
            "data": { "cid_status": cidStatus }, // Pass cid_status to PHP script
            "dataSrc": "cids_data"
        },
        "columns": [
            {"data": "cid_number"},
            {"data": "cid_client_full_name"},
            {"data": "technician_name"},
            {"data": "cid_unit_details"},
            {"data": "formatted_created"}
        ],
        "columnDefs": [{
            "orderable": false,
            "searchable": false
        }],
        "order": [
            [4, 'asc']
        ]
    });
}
