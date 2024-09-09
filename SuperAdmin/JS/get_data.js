$(document).ready(function () {
    $('#cids_container').on('click', '.sop_group td', function (e) {
        if (!$(e.target).hasClass('btn-danger')) {
            var $sopGroup = $(this).closest('.sop_group');
            var cid_number = $sopGroup.find('.cid_number').val();
            get_data('view_cid', this, '', '', cid_number);
        }
    });

    $('#cids_container').on('click', '.btn-danger', function (e) {
        e.stopPropagation();
        var $sopGroup = $(this).closest('.sop_group');
        var cid_number = $sopGroup.find('.cid_number').val();
        save_cid(cid_number);
    });

    $('#delete-cid').click(function () {
        var cid_number = $('.delete_cid_number').val();
        console.log("", cid_number);
        delete_cid('delete_cid', this, cid_number);
    });


    // Account Clicks
    $('#add-account').click(function () {
        save_accounts('add_account', this);
    });

    $(document).on('click', '#update-account', function () {
        save_accounts('update_account', this);
    });
    $(document).on('click', '#delete-account', function () {
        save_accounts('delete_account', this);
    });
    $(document).on('click', '#view-account', function () {
        var $sopGroup = $(this).closest('.sop_group');
        var csu_id = $sopGroup.find('.csu_id').val();
        get_data('view_account', this, '', csu_id);
    });

    // File Management Clicks
    $('#save-new-service').click(function () {
        save_file_management('add_service', this);
    });
    $('#save-new-device').click(function () {
        save_file_management('add_device', this);
    });
    $('#save-new-source').click(function () {
        save_file_management('add_source', this);
    });
    $(document).on('click', '.save-service', function () {
        save_file_management('update_service', this);
    });
    $(document).on('click', '.save-device', function () {
        save_file_management('update_device', this);
    });
    $(document).on('click', '.save-source', function () {
        save_file_management('update_source', this);
    });
    $(document).on('click', '.delete-service', function () {
        save_file_management('delete_service', this);
    });
    $(document).on('click', '.delete-device', function () {
        save_file_management('delete_device', this);
    });
    $(document).on('click', '.delete-source', function () {
        save_file_management('delete_source', this);
    });

    // Tos Clicks
    $(document).on('click', '#save-tos', function () {
        save_tos('update_tos', this);
    });
    $(document).on('click', '#delete-tos', function () {
        save_tos('delete_tos', this);
    });

    $('#save-new-tos').click(function () {
        save_tos('add_tos', this);
    });

    // Analytics Clicks
    $('input[name="daterange"]').on('apply.daterangepicker', function (ev, picker) {
        var start_date = picker.startDate.format('YYYY-MM-DD');
        var end_date = picker.endDate.format('YYYY-MM-DD');
        get_data('analytics', start_date, end_date);
    });

    $('#refresh-date').click(function () {
        get_data('analytics');
    });

    // Settings Clicks
    $(document).on('click', '#save-settings', function () {
        save_settings('update_settings', this);
    });

    $(document).on('click', '#save_cms', function () {
        console.log("save_cms");
        save_cms('save_cms', this);
    });



    $(document).on('click', '#delete-payment', function () {
        console.log("payment_delete");
        payment_delete('payment_delete', this);
    });
});

function payment_delete(type, clickedButton) {
    let cs_p_id = $(clickedButton).data('id');

    var data = {
        type: type,
        cs_p_id: cs_p_id
    };

    save_data(data, type);
    console.log(data);
}

function get_data(type, start_date, end_date, csu_id, cid_number, status) {
    var requestData = {
        type: type
    };

    if (type === 'view_cid') {
        requestData.cid_number = cid_number;
    }


    if (type === 'cids') {
        requestData.cid_number = cid_number;
        requestData.status = status;
    }

    if (type === 'view_account') {
        requestData.csu_id = csu_id;
    }

    if (type === 'analytics') {
        requestData.start_date = start_date;
        requestData.end_date = end_date;
    }

    $.ajax({
        url: "../PHP/get_data.php",
        method: "GET",
        dataType: "json",
        data: requestData,
        success: function (data) {
            console.log(requestData);
            if (type === 'tos' || type === 'update_tos' || type === 'delete_tos') {
                populate_tos(data.data.tos);
            } else if (type === 'settings') {
                populate_settings(data.data.settings[0]);
            } else if (type === 'analytics') {
                populate_analytics(data.data);
            } else if (type === "file_management" || type === "add_service" || type === "add_device" || type === "add_source" || type === "update_service" || type === "update_device" || type === "update_source" || type === "delete_service" || type === "delete_device" || type === "delete_source") {
                populate_file_management(data.data);
            } else if (type === 'accounts' || type === 'add_account' || type === 'update_account' || type === 'delete_account') {
                populate_accounts(data.data.accounts);
            } else if (type === 'view_account') {
                populate_accounts_view(data.data);
            } else if (type === 'cids' || type === 'delete_cid') {
                populate_cids(data.data.cids);
            } else if (type === 'view_cid') {
                populate_cid_view(data.data);
            } else if (type === 'logs') {
                populate_logs(data.data.logs);
            } else if (type === 'cms' || type === 'save_cms') {
                populate_cms(data.data);
            } else if (type === 'payments' || type === 'add_payment' || type === 'update_payment' || type === 'delete_payment') {
                populate_payments(data.data);
            }
        },
        error: function (xhr, status, error) {
            console.error("Error fetching data:", xhr, status, error);
        }
    });
}



function save_cid(cid_number) {
    $('#cid_delete_modal').modal('show');

    var delete_cid_container = $('#delete_cid_container');
    delete_cid_container.empty();

    var delete_cid_HTML = `
    <input type="hidden" class="delete_cid_number" value="${cid_number}">
    <p class="text-center">Delete CID# ${cid_number}?</p>
    `;

    delete_cid_container.append(delete_cid_HTML);
}

function delete_cid(type, clickedButton, cid_number) {
    var data = {
        type: type,
        cid_number: cid_number
    };

    save_data(data, type);
}

// accounts
function populate_accounts(accounts) {
    var accounts_container = $('#accounts_container');
    accounts_container.empty();

    accounts.forEach(function (account) {
        var account_HTML = `
        <div class="pb-3 sop_group">
            <input type="hidden" class="csu_id" value="${account.csu_id}">
            <div class="row mb-2 my-auto">
                <div class="col">Name:</div>
                <div class="col">Permission:</div>
                <div class="col">Username:</div>
                <div class="col">Password:</div>
                <div class="col">Actions:</div>
            </div>
            <div class="row">
                <div class="col my-auto">
                    <input class="form-control csu_name" type="text" name="value" value="${account.csu_name}">
                </div>
                <div class="col my-auto">
                    <select class="form-control csu_permission">
                        <option value="Frontdesk" ${account.csu_permission === 'Frontdesk' ? 'selected' : ''}>Frontdesk</option>
                        <option value="Technician" ${account.csu_permission === 'Technician' ? 'selected' : ''}>Technician</option>
                        <option value="Super Admin" ${account.csu_permission === 'Super Admin' ? 'selected' : ''}>Super Admin</option>
                    </select>
                </div>
                <div class="col my-auto">
                    <input class="form-control csu_username" type="text" name="value" value="${account.csu_username}">
                </div>
                <div class="col my-auto">
                    <input class="form-control csu_password" type="text" name="value" value="">
                </div>
                <div class="col my-auto">
                    <button type="button" class="btn btn-info" id="view-account">View</button>
                    <button type="button" class="btn btn-primary" id="update-account">Save</button>
                    <button type="button" class="btn btn-danger" id="delete-account">Delete</button>
                </div>
            </div>
        </div>
        `;
        accounts_container.append(account_HTML);
    });
}

function save_accounts(type, clickedButton) {
    var $sopGroup = $(clickedButton).closest('.sop_group');
    var isValid = true;

    function validateField($field) {
        if ($field.val().trim() === "") {
            $field.addClass('is-invalid');
            setTimeout(function () {
                $field.removeClass('is-invalid');
            }, 2000);
            isValid = false;
        } else {
            $field.removeClass('is-invalid').addClass('is-valid');
        }
    }
    var data = {
        type: type
    };
    if (type === "add_account") {
        var $fields = $('.new_csu_name, .new_csu_permission, .new_csu_username, .new_csu_password');
        $fields.each(function () {
            validateField($(this));
        });
        if (!isValid) {
            return;
        }
        data.csu_name = $('.new_csu_name').val();
        data.csu_permission = $('.new_csu_permission').val();
        data.csu_username = $('.new_csu_username').val();
        data.csu_password = $('.new_csu_password').val();
    } else if (type === "update_account") {
        data.type = type;
        data.csu_id = $sopGroup.find('.csu_id').val();
        data.csu_name = $sopGroup.find('.csu_name').val();
        data.csu_permission = $sopGroup.find('.csu_permission').val();
        data.csu_username = $sopGroup.find('.csu_username').val();
        var passwordValue = $sopGroup.find('.csu_password').val();
        if (passwordValue.length > 0) {
            data.csu_password = passwordValue;
        }
    } else if (type === "delete_account") {
        data.csu_id = $sopGroup.find('.csu_id').val();
    }

    console.log(data);
    save_data(data, type);
}

function populate_accounts_view(account) {
    console.log(account);
    var account_info = account.account_details[0];
    var account_cids = account.cids_details;
    var account_services = account.service_counts;
    var account_devices = account.device_counts;
    var account_devices = account.device_counts;
    var account_status = account.status_counts;
    var account_total_cids = (account.unique_cid_numbers && account.unique_cid_numbers[0]) ? account.unique_cid_numbers[0].unique_cid_numbers : 0;

    var ongoingCount = account_status['On-going'] ? account_status['On-going'].status_count : '0';
    var ongoingWarrantyCount = account_status['On-going Warranty'] ? account_status['On-going Warranty'].status_count : '0';
    var rtoCount = account_status['Return To Owner'] ? account_status['Return To Owner'].status_count : '0';
    var releaseCount = account_status['For Release'] ? account_status['For Release'].status_count : '0';
    var pendingCount = account_status['Pending'] ? account_status['Pending'].status_count : '0';
    var abandonedCount = account_status['Abandoned'] ? account_status['Abandoned'].status_count : '0';
    var completedCount = account_status['Completed'] ? account_status['Completed'].status_count : '0';

    $('#account_view_modal').modal('show');

    var view_account_container = $('#view_account_container');
    view_account_container.empty();

    var view_account_HTML = `
    <div class="row mb-2 my-auto">
        <div class="col">Name: ${account_info.csu_name}</div>
        <div class="col">Permission: ${account_info.csu_permission}</div>
    </div>    
    `;

    var account_cids_HTML = '';

    if (account_info.csu_permission === 'Technician') {
        account_cids.forEach(function (cid) {
            account_cids_HTML += `
            <tr>
                <td>${cid.cid_number}</td>
                <td>${cid.cid_client_full_name}</td>
                <td>${cid.cs_device_name}</td>
                <td>${cid.formatted_cid_created}</td>
            </tr>
            `;
        });

        view_account_HTML += `
        <hr>
        <div>
            <div class="d-flex flex-column w-100">
                <p class="text-center fw-bold">CIDs</p>
                <table id="tech_cids_table" class="table table-striped table-hover w-100">
                    <thead>
                        <tr>
                            <th>CID Number</th>
                            <th>Client</th>
                            <th>Device Type</th>
                            <th>Date Added</th>
                        </tr>
                    </thead>
                    <tbody>
                        ${account_cids_HTML}
                    </tbody>
                </table>
            </div>
            <div class="d-flex flex-column align-items-center">
                <p class="text-center fw-bold">Details and Charts</p>
                <table class="table table-borderless mt-2" style="width: 100%;">
                    <tbody>
                        <tr>
                            <td style="width: 25%;">
                                <p>Total CIDs:</p>
                            </td>
                            <td style="width: 25%;">
                                <p>${account_total_cids}</p>
                            </td>
                            <td style="width: 25%;">
                                <p>For Release CIDs:</p>
                            </td>
                            <td style="width: 25%;">
                                <p>${releaseCount}</p>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 25%;">
                                <p>On-going CIDs:</p>
                            </td>
                            <td style="width: 25%;">
                                <p>${ongoingCount}</p>
                            </td>
                            <td style="width: 25%;">
                                <p>Pending CIDs:</p>
                            </td>
                            <td style="width: 25%;">
                                <p>${pendingCount}</p>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 25%;">
                                <p>On-going Warranty CIDs:</p>
                            </td>
                            <td style="width: 25%;">
                                <p>${ongoingWarrantyCount}</p>
                            </td>
                            <td style="width: 25%;">
                                <p>Abandoned CIDs:</p>
                            </td>
                            <td style="width: 25%;">
                                <p>${abandonedCount}</p>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 25%;">
                                <p>Return to Owner CIDs:</p>
                            </td>
                            <td style="width: 25%;">
                                <p>${rtoCount}</p>
                            </td>
                            <td style="width: 25%;">
                                <p>Completed CIDs:</p>
                            </td>
                            <td style="width: 25%;">
                                <p>${completedCount}</p>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div id="service_count_chart" class="chart"></div>
                <div id="device_count_chart" class="chart"></div>
            </div>
        </div>
        `;
    }

    view_account_container.append(view_account_HTML);

    $('#tech_cids_table').DataTable({
        "order": [
            [3, 'desc']
        ]
    });

    var serviceCountData = {
        x: [],
        y: [],
        type: 'bar'
    };

    account_services.forEach(function (service) {
        serviceCountData.x.push(service.cs_service_name);
        serviceCountData.y.push(service.num_cid_numbers);
    });

    var serviceCountLayout = {
        title: 'Service Counts',
        xaxis: {
            title: 'Service Name'
        },
        yaxis: {
            title: 'Total Count'
        }
    };

    Plotly.newPlot('service_count_chart', [serviceCountData], serviceCountLayout);

    var deviceCountData = {
        x: [],
        y: [],
        type: 'bar'
    };

    account_devices.forEach(function (device) {
        deviceCountData.x.push(device.cs_device_name);
        deviceCountData.y.push(device.num_cid_numbers);
    });

    var deviceCountLayout = {
        title: 'Device Counts',
        xaxis: {
            title: 'Device Name'
        },
        yaxis: {
            title: 'Total Count'
        }
    };

    Plotly.newPlot('device_count_chart', [deviceCountData], deviceCountLayout);
}


// file_management
function populate_file_management(file_management) {
    var services_list = file_management.services_list;
    var devices_list = file_management.devices_list;
    var sources_list = file_management.sources_list;

    console.log(services_list);
    console.log(devices_list);
    console.log(sources_list);

    var file_management_container = $('#file_management_container');
    file_management_container.empty();

    var services_HTML = `
        <div class="row">
            <div class="col-8">
                <p class="mb-2 fw-bold">Service/Product Name:</p>
            </div>
            <div class="col-4">
                <p class="mb-2 fw-bold">Actions:</p>
            </div>
        </div>
    `;

    services_list.forEach(function (service) {
        services_HTML += `
            <div class="row mb-2 sop_group">
                <div class="col-8">
                    <input class="form-control cs_service_name" type="text" value="${service.cs_service_name}">
                </div>
                <div class="col-4 my-auto">
                    <button type="button" class="btn btn-primary btn-sm save-service">Save</button>
                    <button type="button" class="btn btn-danger btn-sm delete-service">Delete</button>
                </div>
                <input type="hidden" class="cs_service_id" value="${service.cs_service_id}">
            </div>
        `;
    });

    var devices_HTML = `
        <div class="row">
            <div class="col-8">
                <p class="mb-2 fw-bold">Device Name:</p>
            </div>
            <div class="col-4">
                <p class="mb-2 fw-bold">Actions:</p>
            </div>
        </div>
    `;

    devices_list.forEach(function (device) {
        devices_HTML += `
            <div class="row mb-2 sop_group">
                <div class="col-8">
                    <input class="form-control cs_device_name" type="text" value="${device.cs_device_name}">
                </div>
                <div class="col-4 my-auto">
                    <button type="button" class="btn btn-primary btn-sm save-device">Save</button>
                    <button type="button" class="btn btn-danger btn-sm delete-device">Delete</button>
                </div>
                <input type="hidden" class="cs_device_id" value="${device.cs_device_id}">
            </div>
        `;
    });

    var sources_HTML = `
        <div class="row">
            <div class="col-8">
                <p class="mb-2 fw-bold">Source Name:</p>
            </div>
            <div class="col-4">
                <p class="mb-2 fw-bold">Actions:</p>
            </div>
        </div>
    `;

    sources_list.forEach(function (source) {
        sources_HTML += `
            <div class="row mb-2 sop_group">
                <div class="col-8">
                    <input class="form-control cs_source_name" type="text" value="${source.cs_source_name}">
                </div>
                <div class="col-4 my-auto">
                    <button type="button" class="btn btn-primary btn-sm save-source">Save</button>
                    <button type="button" class="btn btn-danger btn-sm delete-source">Delete</button>
                </div>
                <input type="hidden" class="cs_source_id" value="${source.cs_source_id}">
            </div>
        `;
    });

    var file_management_HTML = `
        <div class="d-flex flex-row">
            <div class="w-50 me-3">
                <p class="fw-bold">Services/Products</p>
                <button type="button" class="btn btn-success align-self-start mb-2" data-bs-toggle="modal" data-bs-target="#service_add_modal">Add Service</button>
                ${services_HTML}
            </div>
            <div class="w-50 ms-3">
                <p class="fw-bold">Devices</p>
                <button type="button" class="btn btn-success align-self-start mb-2" data-bs-toggle="modal" data-bs-target="#device_add_modal">Add Device</button>
                ${devices_HTML}
            </div>
            <div class="w-50 ms-3">
                <p class="fw-bold">Sources</p>
                <button type="button" class="btn btn-success align-self-start mb-2" data-bs-toggle="modal" data-bs-target="#source_add_modal">Add Source</button>
                ${sources_HTML}
            </div>
        </div>
    `;
    file_management_container.append(file_management_HTML);
}

function save_file_management(type, clickedButton) {
    var $sopGroup = $(clickedButton).closest('.sop_group');
    var data = {
        type: type
    };

    if (type === "add_service") {
        data.new_service = $('.new_service').val();
    } else if (type === "add_device") {
        data.new_device = $('.new_device').val();
    } else if (type === "add_source") {
        data.new_source = $('.new_source').val();
    } else if (type === "update_service") {
        data.cs_service_id = $sopGroup.find('.cs_service_id').val();
        data.cs_service_name = $sopGroup.find('.cs_service_name').val();
    } else if (type === "update_device") {
        data.cs_device_id = $sopGroup.find('.cs_device_id').val();
        data.cs_device_name = $sopGroup.find('.cs_device_name').val();
    } else if (type === "update_source") {
        data.cs_source_id = $sopGroup.find('.cs_source_id').val();
        data.cs_source_name = $sopGroup.find('.cs_source_name').val();
    } else if (type === "delete_service") {
        data.cs_service_id = $sopGroup.find('.cs_service_id').val();
    } else if (type === "delete_device") {
        data.cs_device_id = $sopGroup.find('.cs_device_id').val();
    } else if (type === "delete_source") {
        data.cs_source_id = $sopGroup.find('.cs_source_id').val();
    }
    console.log(data)
    save_data(data, type);
}

// tos
function populate_tos(tos) {
    var tos_container = $('#tos_container');
    tos_container.empty();

    tos.forEach(function (tos) {
        var tos_HTML = `
        <div class="pb-3 sop_group">
            <input type="hidden" class="tos_id" value="${tos.tos_id}">
            <p>Content:</p>
            <textarea class="form-control mb-1 tos_content" rows="4" cols="50">${tos.tos_content}</textarea>
            <p>Sequence:</p>
            <div class="d-flex flex-row">
                <div class="w-50">
                    <input class="form-control tos_sequence" type="text" value="${tos.tos_sequence}">
                </div>
                <div class="w-50"> 
                    <button type="button" class="btn btn-primary ms-2 align-self-start my-auto" id="save-tos">Save</button>
                    <button type="button" class="btn btn-danger ms-2 align-self-start my-auto" id="delete-tos">Delete</button>
                </div>
            </div>
        </div>
        <hr>
        `;
        tos_container.append(tos_HTML);
    });
}

function save_tos(type, clickedButton) {
    var data = {
        type: type
    };

    if (type === "update_tos" || type === "delete_tos") {
        var $sopGroup = $(clickedButton).closest('.sop_group');
        data.tos_id = $sopGroup.find('.tos_id').val();
        data.tos_content = $sopGroup.find('.tos_content').val();
        data.tos_sequence = parseInt($sopGroup.find('.tos_sequence').val(), 10);
    } else if (type === "add_tos") {
        data.tos_content = $('.new_tos_content').val();
        data.tos_sequence = parseInt($('.new_tos_sequence').val(), 10);
    }
    save_data(data, type);
}

// cids
function populate_cids(cids) {
    console.log(cids);
    var cids_container = $('#cids_container');
    cids_container.empty();

    var home_cids_container = $('#home_cids_container');
    home_cids_container.empty();

    var cid_HTML = '';
    var home_cid_HTML = '';

    cids.forEach(function (cid) {
        cid_HTML += `
    <tr class="sop_group">
        <input type="hidden" class="cid_number" value="${cid.cid_number}">
        <td class="align-middle">${cid.cid_number}</td>
        <td class="align-middle">${cid.cid_client_full_name}</td>
        <td class="align-middle">${cid.cs_device_name}</td>
        <td class="align-middle">${cid.technician_names ? cid.technician_names : 'No Technician'}</td>
        <td class="align-middle">${cid.cid_status}</td>
        <td class="align-middle">${cid.formatted_cid_created}</td>
        <td class="align-middle">
            <button type="button" class="btn btn-danger" id="delete-cid">Delete</button>
        </td>
    </tr>
    `;

        home_cid_HTML += `
    <tr class="sop_group">
        <input type="hidden" class="cid_number" value="${cid.cid_number}">
        <td class="align-middle">${cid.cid_number}</td>
        <td class="align-middle">${cid.cid_client_full_name}</td>
        <td class="align-middle">${cid.cs_device_name}</td>
        <td class="align-middle">${cid.technician_names ? cid.technician_names : 'No Technician'}</td>
        <td class="align-middle">${cid.cid_status}</td>
        <td class="align-middle">${cid.formatted_cid_created}</td>
    </tr>
    `;
    });

    var cids_HTML = `
<div class="card-body">
    <table id="cids_table" class="table table-striped table-hover">
        <thead>
            <tr>
                <th>CID Number</th>
                <th>Client</th>
                <th>Device Type</th>
                <th>Technician(s)</th>
                <th>Status</th>
                <th>Date Added</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            ${cid_HTML}
        </tbody>
    </table>
</div>
`;

    var home_cids_HTML = `
<div class="card-body">
    <table id="home_cids_table" class="table table-striped table-hover">
        <thead>
            <tr>
                <th>CID Number</th>
                <th>Client</th>
                <th>Device Type</th>
                <th>Technician(s)</th>
                <th>Status</th>
                <th>Date Added</th>
            </tr>
        </thead>
        <tbody>
            ${home_cid_HTML}
        </tbody>
    </table>
</div>
`;

    cids_container.append(cids_HTML);
    home_cids_container.append(home_cids_HTML);

    $('#cids_table').DataTable({
        "order": [] // Disable initial ordering
    });
    $('#home_cids_table').DataTable({
        "order": [] // Disable initial ordering
    });
}


function populate_cid_view(cid_data) {
    var cid = cid_data.cid_details[0];
    var terms_of_service = cid_data.terms_of_service;
    var checklist_data = cid_data.checklist[0];


    var checklist_tbody = $('#checklist_tbody');
    checklist_tbody.empty();
    console.log('cid_data');
    console.log(cid_data);
    $('#cid_view_modal').modal('show');

    var view_cid_container = $('#view_cid_container');
    view_cid_container.empty();
    var tos_HTML = ``;
    terms_of_service.forEach(function (tos) {
        tos_HTML += `
        <tr>
            <td>${tos.tos_content}</td>
            <td>${tos.cid_tos_agreement ? 'Yes' : 'No'}</td>
        </tr>
        `;
    });




    var components = [{
            name: 'Wifi',
            key: 'cs_cid_c_wifi'
        },
        {
            name: 'Keyboard(FN Keys)',
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

    var checklistRows = ''; // Variable to store checklist rows

    components.forEach(function (component) {
        var value = checklist_data ? checklist_data[component.key] : null;
        var checked1 = value == 1 ? 'checked' : '';
        var checked2 = value == 2 ? 'checked' : '';
        var checked3 = value == 3 ? 'checked' : '';

        // Append row to checklistRows variable
        checklistRows += `
        <tr>
            <td>${component.name}</td>
            <td><input type="radio" name="${component.key}_status" value="1" class="mx-auto d-block" ${checked1} disabled></td>
            <td><input type="radio" name="${component.key}_status" value="2" class="mx-auto d-block" ${checked2} disabled></td>
            <td><input type="radio" name="${component.key}_status" value="3" class="mx-auto d-block" ${checked3} disabled></td>
        </tr>
    `;
    });

    // Use checklistRows variable inside HTML template string
    var checklistHTML = `
        <table class="table table-bordered checklist-table">
            <thead>
                <tr>
                    <th scope="col">Component Name</th>
                    <th scope="col" class="text-center">Working?</th>
                    <th scope="col" class="text-center">Not Working?</th>
                    <th scope="col" class="text-center">Not Applicable</th>
                </tr>
            </thead>
            <tbody id="checklist_tbody">
                ${checklistRows} <!-- Use checklistRows variable here -->
            </tbody>
        </table>
    `;

    var cs_payments_data = cid_data.cs_payments;
    let cs_payments_rows = ``;

    let payment_number = 1

    cs_payments_data.forEach(function (payment) {
        cs_payments_rows += `
         <tr>
            <td>Payment #${payment_number}</td>
            <td>${payment.cs_p_note}</td>
            <td>${payment.cs_p_amount}</td>
            <td>${payment.cs_mop_name}</td>
            <td>${payment.cs_p_reference}</td>
            <td>${payment.cs_p_ds}</td>
            <td>${payment.cs_p_or}</td>
            <td>${payment.formatted_paid_date}</td>
             <th><button type="button" data-id="${payment.cs_p_id}" class="btn btn-danger" id="delete-payment">Delete</button></th>
        </tr>
        `;
        payment_number++
    });


    let cs_payments = `
        <div>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Payments</th>
                        <th>Notes</th>
                        <th>Amount</th>
                        <th>MOP</th>
                        <th>Ref #</th>
                        <th>DS</th>
                        <th>OR</th>
                        <th>Date of Payment</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
${cs_payments_rows}
           
                </tbody>
            </table>
        </div>
        `;

    var cid_summary_payments = cid_data.cid_summary_payments;
    let cs_services_rows = ``;


    cid_summary_payments.forEach(function (service) {
        cs_services_rows += `
         <tr>
            <td>${service.cs_service_name}</td>
            <td>${service.cid_sop_cost}</td>
            <td>${service.cid_sop_discount}</td>
            <td>${service.cid_sop_discounted_price}</td>
            <td>${service.formatted_warranty_start || ''}</td>
            <td>${service.formatted_warranty_end || ''}</td>
            <td>${service.cid_sop_warranty_type || ''}</td>
           
        </tr>
        `;
    });


    let cs_services = `
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
${cs_services_rows}
                </tbody>
            </table>
        </div>
        `;


    var cid_HTML = `
    <div class="px-3">
        <input type="hidden" class="cid_number" value="${cid.cid_number}" name="">
        <p class="fw-bold text-center">Details<p>
        <div class="d-flex flex-row justify-content-between w-100">
            <div class="flex-fill">
                <p class="fw-bold mb-2">CID Number:</p>
                <p class="fw-bold mb-2">Client Name:</p>
                <p class="fw-bold mb-2">Technician(s):</p>
                <p class="fw-bold mb-2">Status:</p>
            </div>
            <div class="flex-fill">
                <p class="mb-2">${cid.cid_number}</p>
                <p class="mb-2">${cid.cid_client_full_name}</p>
                <p class="mb-2">${cid.technician_names ? cid.technician_names : 'No Technician'}</p>
                <p class="mb-2">${cid.cid_status}</p>
            </div>
            <div class="flex-fill">
                <p class="fw-bold mb-2">Claiming Slip Number: </p>
                <p class="fw-bold mb-2">Client Signature:</p>
                <p class="fw-bold mb-2">Type:</p>
                <p class="fw-bold mb-2">Date Added</p>
            </div>
            <div class="flex-fill">
                <p class="mb-2">${cid.cid_cs_number ? cid.cid_cs_number : 'No Claiming Slip'}</p>
                <p class="mb-2" id="clientSignature" data-bs-toggle="popover" data-bs-placement="bottom" title="Client Signature">Click To View Signature!</p>
                <p class="mb-2">${cid.cs_device_name}</p>
                <p class="mb-2">${cid.formatted_cid_created}</p>
            </div>
        </div>
        <div>
            <p class="fw-bold">Unti Details:</p>
            <p>${cid.cid_unit_details}</p>
            <p class="fw-bold mt-1">Remarks:</p>
            <p>${cid.cid_remarks}</p>
            <p class="fw-bold mt-1">Unit History:</p>
            <p>${cid.cid_unit_history}</p>
        </div>
    </div>
    <hr>
    <div>
        <p class="fw-bold text-center">Summary of Repairs<p>
        <p class="fw-bold">Content:<p>
        <p>${cid.cid_sor_content ? cid.cid_sor_content : 'No Summary of Repairs Data'}</p>
        <p class="fw-bold mt-1">Start Date:<p>
        <p>${cid.formatted_cid_sor_start_date ? cid.formatted_cid_sor_start_date : 'No Summary of Repairs Data'}</p>
        <p class="fw-bold mt-1">End Date:<p>
        <p>${cid.formatted_cid_sor_end_date ? cid.formatted_cid_sor_end_date : 'No Summary of Repairs Data'}</p>
        <p class="fw-bold mt-1">Last Updated:<p>
        <p>${cid.formatted_cid_sor_updated ? cid.formatted_cid_sor_updated : 'No Summary of Repairs Data'}</p>
        ${checklistHTML}
    </div>
    <hr>
    <div>
        <p class="fw-bold text-center">Recommendations<p>
        <p class="fw-bold">Content:<p>
        <p>${cid.cid_r_content ? cid.cid_r_content : 'No Recommendation Data'}</p>
        <p class="fw-bold mt-1">Last Updated:<p>
        <p>${cid.formatted_recommendation_updated ? cid.formatted_recommendation_updated : 'No Recommendation Data'}</p>
    </div>
    <hr>
    <div>
        <p class="fw-bold text-center">Summary of Payments<p>
        ${cs_services}
        ${cs_payments}
    </div>
    <hr>
    <div>
        <p class="fw-bold text-center">Terms of Service<p>
        <table id="" class="table w-100">
            <thead>
                <tr>
                    <th>Terms</th>
                    <th>Agreement</th>
                </tr>
            </thead>
            <tbody>
                ${tos_HTML}
            </tbody>
        </table>
    </div>
    `;

    view_cid_container.append(cid_HTML);

    var popoverTrigger = document.getElementById('clientSignature');
    var popover = new bootstrap.Popover(popoverTrigger, {
        content: `<div class='popover-image-container'><img src='${cid.cid_signature}' alt='Client Signature' class='img-fluid'></div>`,
        html: true,
        placement: 'left'
    });
}

// analytics
function populate_analytics(analytics) {
    console.log(analytics);
    var device_counts = analytics.device_counts;
    var service_counts = analytics.service_counts;
    var status_counts = analytics.status_counts;
    var source_counts = analytics.source_counts;
    var unique_cid_numbers = analytics.unique_cid_numbers;

    var ongoingCount = status_counts['On-going'] ? status_counts['On-going'].status_count : '0';
    var ongoingWarrantyCount = status_counts['On-going Warranty'] ? status_counts['On-going Warranty'].status_count : '0';
    var rtoCount = status_counts['Return To Owner'] ? status_counts['Return To Owner'].status_count : '0';
    var releaseCount = status_counts['For Release'] ? status_counts['For Release'].status_count : '0';
    var pendingCount = status_counts['Pending'] ? status_counts['Pending'].status_count : '0';
    var abandonedCount = status_counts['Abandoned'] ? status_counts['Abandoned'].status_count : '0';
    var completedCount = status_counts['Completed'] ? status_counts['Completed'].status_count : '0';

    var analytics_container = $('#analytics_container');
    analytics_container.empty();

    var home_analytics_container = $("#home_analytics_container");
    home_analytics_container.empty();

    var home_analytics_HTML = `
    <div>
    <div class="col mb-4 mt-2">
            <a id="super_dashboard" href="cids.php">
                <div class="card shadow">
                    <div class="card-header bg-info text-white" id="super_header">
                        <i class="fas fa-id-card mr-2"></i> Total Number of CIDs
                    </div>
                    <div class="card-body">
                        <p id="text_super_cids">${unique_cid_numbers[0].unique_cid_numbers}</p>
                    </div>
                    <div class="card-footer bg-info text-white" id="super_see_more">See More
                    </div>
                </div>
            </a>
        </div> 
    </div>
    <div class="row mt-2">
        <div class="col mb-4">
            <a id="super_dashboard" href="ongoing.php">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white" id="super_header">
                        <i class="fas fa-tasks mr-2"></i> Ongoing
                    </div>
                    <div class="card-body">
                        <p id="text_super_ongoing">${ongoingCount}</p>
                    </div>
                    <div class="card-footer bg-primary text-white" id="super_see_more">See More
                    </div>
                </div>
            </a>
        </div>
        <div class="col mb-4">
            <a id="super_dashboard" href="warranty.php">
                <div class="card shadow">
                    <div class="card-header bg-success text-white" id="super_header">
                        <i class="fas fa-shield-alt mr-2"></i> Warranty
                    </div>
                    <div class="card-body">
                        <p id="text_super_ongoing">${ongoingWarrantyCount}</p>
                    </div>
                    <div class="card-footer bg-success text-white" id="super_see_more">See More
                    </div>
                </div>
            </a>
        </div>
        <div class="col mb-4">
            <a id="super_dashboard" href="rto.php">
                <div class="card shadow">
                    <div class="card-header bg-warning text-white" id="super_header">
                        <i class="fas fa-car mr-2"></i> RTO
                    </div>
                    <div class="card-body">
                        <p id="text_super_rto">${rtoCount}</p>
                    </div>
                    <div class="card-footer bg-warning text-white" id="super_see_more">See More
                    </div>
                </div>
            </a>
        </div>
        
        <div class="col mb-4">
            <a id="super_dashboard" href="release.php">
                <div class="card shadow">
                    <div class="card-header bg-dark text-white" id="super_header">
                        <i class="fas fa-code-branch mr-2"></i> Release
                    </div>
                    <div class="card-body">
                        <p id="text_super_release">${releaseCount}</p>
                    </div>
                    <div class="card-footer bg-dark text-white" id="super_see_more">See More
                    </div>
                </div>
            </a>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-3 mb-4">
            <a id="super_dashboard" href="pending.php">
                <div class="card shadow">
                    <div class="card-header bg-danger text-white" id="super_header">
                        <i class="fas fa-hourglass-start mr-2"></i> Pending
                    </div>
                    <div class="card-body">
                        <p id="text_super_pending">${pendingCount}</p>
                    </div>
                    <div class="card-footer bg-danger text-white" id="super_see_more">See More
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-3 mb-4">
            <a id="super_dashboard" href="abandoned.php">
                <div class="card shadow">
                    <div class="card-header bg-secondary text-white" id="super_header">
                        <i class="fas fa-trash-alt mr-2"></i> Abandoned
                    </div>
                    <div class="card-body">
                        <p id="text_super_abandoned">${abandonedCount}</p>
                    </div>
                    <div class="card-footer bg-secondary text-white" id="super_see_more">See More
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-3 mb-4">
            <a id="super_dashboard" href="completed.php">
                <div class="card shadow">
                    <div class="card-header bg-dark text-white" id="super_header">
                        <i class="fas fa-check-circle mr-2"></i> Completed
                    </div>
                    <div class="card-body">
                        <p id="text_super_completed">${completedCount}</p>
                    </div>
                    <div class="card-footer bg-dark text-white" id="super_see_more">See More
                    </div>
                </div>
            </a>
        </div>
    </div>
    `;

    home_analytics_container.append(home_analytics_HTML);

    var analytics_HTML = `
    ${home_analytics_HTML}
    <div class="chart-container mb-3">
        <select id="chartType1">
            <option value="bar">Bar Chart</option>
            <option value="line">Line Chart</option>
            <option value="pie">Pie Chart</option>
        </select>
        <div id="service_count_chart" class="chart"></div>
    </div>

    <div class="chart-container mb-3">
        <select id="chartType3">
            <option value="bar">Bar Chart</option>
            <option value="line">Line Chart</option>
            <option value="pie">Pie Chart</option>
        </select>
        <div id="device_count_chart" class="chart"></div>
    </div>

    <div class="chart-container mb-3">
        <select id="chartType4">
            <option value="bar">Bar Chart</option>
            <option value="line">Line Chart</option>
            <option value="pie">Pie Chart</option>
        </select>
        <div id="source_count_chart" class="chart"></div>
    </div>
    `;


    analytics_container.append(analytics_HTML);

    // Plotly for Service Counts
    var serviceCountData = {
        x: [],
        y: [],
        type: 'bar'
    };

    for (var i = 0; i < service_counts.length; i++) {
        serviceCountData.x.push(service_counts[i].cs_service_name);
        serviceCountData.y.push(service_counts[i].num_cid_numbers);
    }

    var serviceCountLayout = {
        title: 'Service Counts'
    };

    Plotly.newPlot('service_count_chart', [serviceCountData], serviceCountLayout);

    $('#chartType1').change(function () {
        var chartType = $(this).val();
        var newServiceCountData;
        if (chartType === 'bar') {
            newServiceCountData = [{
                ...serviceCountData,
                type: 'bar'
            }];
        } else if (chartType === 'line') {
            newServiceCountData = [{
                ...serviceCountData,
                type: 'scatter',
                mode: 'lines+markers'
            }];
        } else if (chartType === 'pie') {
            newServiceCountData = [{
                labels: serviceCountData.x,
                values: serviceCountData.y,
                type: 'pie'
            }];
        }
        Plotly.newPlot('service_count_chart', newServiceCountData, serviceCountLayout);
    });

    // Plotly for Device Counts
    var deviceCountData = {
        x: [],
        y: [],
        type: 'bar'
    };

    for (var i = 0; i < device_counts.length; i++) {
        deviceCountData.x.push(device_counts[i].cs_device_name);
        deviceCountData.y.push(device_counts[i].num_cid_numbers);
    }

    var deviceCountLayout = {
        title: 'Device Counts'
    };

    Plotly.newPlot('device_count_chart', [deviceCountData], deviceCountLayout);

    $('#chartType3').change(function () {
        var chartType = $(this).val();
        var newdeviceCountData;
        if (chartType === 'bar') {
            newdeviceCountData = [{
                ...deviceCountData,
                type: 'bar'
            }];
        } else if (chartType === 'line') {
            newdeviceCountData = [{
                ...deviceCountData,
                type: 'scatter',
                mode: 'lines+markers'
            }];
        } else if (chartType === 'pie') {
            newdeviceCountData = [{
                labels: deviceCountData.x,
                values: deviceCountData.y,
                type: 'pie'
            }];
        }
        Plotly.newPlot('device_count_chart', newdeviceCountData, deviceCountLayout);
    });

    var sourceCountData = {
        x: [],
        y: [],
        type: 'bar'
    };

    // Prepare data from source_counts
    for (var i = 0; i < source_counts.length; i++) {
        sourceCountData.x.push(source_counts[i].cid_advertisement); // Change property name here
        sourceCountData.y.push(source_counts[i].source_count); // Change property name here
    }

    var sourceCountLayout = {
        title: 'Source Counts'
    };

    // Initial plot
    Plotly.newPlot('source_count_chart', [sourceCountData], sourceCountLayout);

    // Change chart type based on user selection
    $('#chartType4').change(function () {
        var chartType = $(this).val();
        var newSourceCountData;

        if (chartType === 'bar') {
            newSourceCountData = [{
                x: sourceCountData.x,
                y: sourceCountData.y,
                type: 'bar'
            }];
        } else if (chartType === 'line') {
            newSourceCountData = [{
                x: sourceCountData.x,
                y: sourceCountData.y,
                type: 'scatter',
                mode: 'lines+markers'
            }];
        } else if (chartType === 'pie') {
            newSourceCountData = [{
                labels: sourceCountData.x,
                values: sourceCountData.y,
                type: 'pie'
            }];
        }

        Plotly.newPlot('source_count_chart', newSourceCountData, sourceCountLayout);
    });
}

// settings
function populate_settings(settings) {
    var settings_container = $('#settings_container');
    settings_container.empty();

    var settings_HTML = `
    <div class="pb-3 sop_group">
        <input type="hidden" class="cs_settings_id" value="${settings.cs_settings_id}">
        <div class="row mb-2 my-auto">
            <div class="col-3">Setting Name:</div>
            <div class="col-3">Value:</div>
            <div class="col-3">Unit:</div>
            <div class="col-3">Action:</div>
        </div>
        <div class="row">
            <div class="col-3 my-auto">Technician Notification</div>
            <div class="col-3 my-auto">
                <input class="form-control cs_settings_value" type="number" name="value" value="${settings.cs_settings_value}">
            </div>
            <div class="col-3 my-auto">
                <select class="form-control cs_settings_unit">
                    <option value="day" ${settings.cs_settings_unit === 'day' ? 'selected' : ''}>Day</option>
                    <option value="week" ${settings.cs_settings_unit === 'week' ? 'selected' : ''}>Week</option>
                    <option value="month" ${settings.cs_settings_unit === 'month' ? 'selected' : ''}>Month</option>
                    <option value="year" ${settings.cs_settings_unit === 'year' ? 'selected' : ''}>Year</option>
                </select>
            </div>
            <div class="col-3 my-auto">
                <button type="button" class="btn btn-primary" id="save-settings">Save</button>
            </div>   
        </div>
    </div>
    `;

    settings_container.append(settings_HTML);
}

function save_settings(type, clickedButton) {
    var $sopGroup = $(clickedButton).closest('.sop_group');
    var data = {
        type: type,
        cs_settings_id: $sopGroup.find('.cs_settings_id').val(),
        cs_settings_value: $sopGroup.find('.cs_settings_value').val(),
        cs_settings_unit: $sopGroup.find('.cs_settings_unit').val()
    };

    save_data(data, type);
}


function save_cms(type, clickedButton) {
    var $sopGroup = $(clickedButton).closest('.sop_group');

    var data = {
        type: type,
        email: $sopGroup.find('.email').val(),
        address: $sopGroup.find('.address').val(),
        company_name: $sopGroup.find('.company_name').val(),
        cp1: $sopGroup.find('.cp1').val(),
        cp2: $sopGroup.find('.cp2').val(),
        cp3: $sopGroup.find('.cp3').val(),
        acknowledgement: $sopGroup.find('.acknowledgement').val(),
        disclaimer: $sopGroup.find('.disclaimer').val()
    };
    save_data(data, type);
    console.log(data);

}


function save_data(data, type) {
    $.ajax({
        url: "../PHP/save_data.php",
        method: "POST",
        dataType: "json",
        data: data,
        success: function (response) {
            alert(response.message);
            // Reload the page after the alert is dismissed
            location.reload();
            get_data(type); // This line will not be reached because the page reloads before it
            console.log(type);
        },
        error: function (xhr, status, error) {
            console.error("Error fetching data:", error, xhr, status);
        }
    });
}