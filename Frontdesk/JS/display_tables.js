$(document).ready(function () { 
    // Initialize DataTables for each table
    new DataTable('#release_table', 'for release');
    new DataTable('#on-going_table', 'on-going');
    new DataTable('#warranty_table', 'on-going warranty');

    notification(); 

    document.getElementById('logo').addEventListener('click', function () {
        window.location.href = 'frontdesk.php';
    });
});

function DataTable(selector, cidStatus) {
    var columns = [];

    if (cidStatus === 'for release') {
        columns = [
            {"data": "cid_number"},
            {"data": "cid_client_full_name"},
            {
                "data": "technician_names",
                "render": function(data) {
                    if(data) {
                        return data.split(',').join(', ');
                    }
                    return '';
                }
            },
            {"data": "cid_unit_details"},
            {"data": "formatted_created"},
        ];
    } else if (cidStatus === 'on-going') {
        columns = [
            {"data": "cid_number"},
            {"data": "cid_client_full_name"},
            {
                "data": "technician_names",
                "render": function(data) {
                    if(data) {
                        return data.split(',').join(', ');
                    }
                    return '';
                }
            },
            {"data": "cid_unit_details"},
            {"data": "formatted_created"},
        ];
    } else if (cidStatus === 'on-going warranty') {
        columns = [
            {"data": "cid_number"},
            {"data": "cid_client_full_name"},
            {
                "data": "technician_names", // Display technician names here
                "render": function(data) {
                    if(data) {
                        return data.split(',').join(', ');
                    }
                    return '';
                }
            },
            {"data": "cid_unit_details"},
            {"data": "formatted_created"},
        ];
    }

    $(selector).DataTable({
        "ajax": {
            "url": "../PHP/get_cids_status.php",
            "data": { "cid_status": cidStatus },
            "dataSrc": "cids_data"
        },
        "columns": columns, // Set columns dynamically
        "columnDefs": [{
            "orderable": false,
            "searchable": false
        }],
        "order": [
            [4, 'asc']
        ]
    });
}



function notification() {
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
}