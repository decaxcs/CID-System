function get_analytics(type, start_date, end_date, csu_id, cid_number) {
    var requestData = {
        type: type
    };

    if (type === 'analytics') {
        requestData.start_date = start_date;
        requestData.end_date = end_date;
    }

    $.ajax({
        url: "../PHP/get_analytics.php",
        method: "GET",
        dataType: "json",
        data: requestData,
        success: function (data) {
            console.log(data);
            if (type === 'analytics') {
                populate_analytics(data.data);
            } else if (type === 'cids') {
                populate_cids(data.data.cids);
            }
        },
        error: function (xhr, status, error) {
            console.error("Error fetching data:", error, xhr, status);
        }
    });
}

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
        <div class="col mb-4">
            <a id="super_dashboard" href="cids.php">
                <div class="card shadow">
                    <div class="card-header bg-info text-white" id="super_header">
                        <i class="fas fa-id-card mr-2"></i> CIDs
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

    <!-- <div class="chart-container mb-3">
        <select id="chartType2">
            <option value="bar">Bar Chart</option>
            <option value="line">Line Chart</option>
            <option value="pie">Pie Chart</option>
        </select>
        <div id="service_payments_chart" class="chart"></div>
    </div> -->

    <div class="chart-container mb-3">
        <select id="chartType3">
            <option value="bar">Bar Chart</option>
            <option value="line">Line Chart</option>
            <option value="pie">Pie Chart</option>
        </select>
        <div id="device_count_chart" class="chart"></div>
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


    // Plotly for Service Payments
    // var servicePaymentData = {
    //     x: [],
    //     y: [],
    //     type: 'bar',
    //     text: [],
    //     hoverinfo: 'x+y+text'
    // };
    // for (var i = 0; i < service_counts.length; i++) {
    //     servicePaymentData.x.push(service_counts[i].cs_service_name);
    //     servicePaymentData.y.push(service_counts[i].total_amount);
    //     var text = `Total Amount: ${service_counts[i].total_amount}<br>Total Paid: ${service_counts[i].total_paid_amount}<br>Total Unpaid: ${service_counts[i].total_unpaid_amount}`;
    //     servicePaymentData.text.push(text);
    // }
    // var servicePaymentLayout = {
    //     title: 'Service Total Amounts',
    //     xaxis: {
    //         title: 'Service Name'
    //     },
    //     yaxis: {
    //         title: 'Total Amount'
    //     }
    // };
    // Plotly.newPlot('service_payments_chart', [servicePaymentData], servicePaymentLayout);
    // $('#chartType2').change(function () {
    //     var chartType = $(this).val();
    //     var newServicePaymentData;

    //     if (chartType === 'bar') {
    //         newServicePaymentData = [{
    //             ...servicePaymentData,
    //             type: 'bar'
    //         }];
    //     } else if (chartType === 'line') {
    //         newServicePaymentData = [{
    //             ...servicePaymentData,
    //             type: 'scatter',
    //             mode: 'lines+markers'
    //         }];
    //     } else if (chartType === 'pie') {
    //         newServicePaymentData = [{
    //             labels: servicePaymentData.x,
    //             values: servicePaymentData.y,
    //             type: 'pie'
    //         }];
    //     }

    //     Plotly.newPlot('service_payments_chart', newServicePaymentData, servicePaymentLayout);
    // });

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
}

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
        "order": [
            [5, 'desc']
        ]
    });
    $('#home_cids_table').DataTable({
        "order": [
            [5, 'desc']
        ]
    });
}