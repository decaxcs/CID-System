var cid_data = [];
var payments_data = [];
var cs_payment_data = [];
var checklist_data = [];
var cms_data = [];

var components = [{
        name: 'Wifi',
        key: 'cs_cid_c_wifi'
    },
    {
        name: 'Keyboard (FN Keys)',
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

var checklistText = ''; // Variable to store checklist text

components.forEach(function (component) {
    var value = checklist_data ? checklist_data[component.key] : null;
    var status = '';

    if (value === 1) {
        status = 'Ok';
    } else if (value === 2) {
        status = 'Not Ok';
    } else {
        status = 'N/A';
    }
    checklistText += `${component.name}: ${status}\n`;
});

console.log(checklistText);


function get_cid_info(cid_number) {
    $.ajax({
        url: "../PHP/get_cids.php",
        type: "GET",
        data: {
            cid_number: cid_number
        },
        success: function (response) {
            if (response.status === "success") {
                console.log(response);
                checklist_data = response.checklist_data[0];
                cid_data = response.cids_data;
                payments_data = response.payments_data;
                cs_payment_data = response.cs_payment_data;
                cms_data = response.cms_data[0];
            } else {
                console.log("Error: No data found.");
            }
        },
        error: function (xhr, status, error) {
            ajax_error_handling(xhr, status, error);
        }
    });
}

$(document).ready(function () {
    $('#print-cid').click(function () {
        var view_modal = $(this).closest('#cid_view_modal');
        var cid_number = view_modal.find('.cid_number').val();
        console.log(cid_number);
        get_cid_info(cid_number);
        print_cid();
    });


});

function print_cid() {
    var printWindow = window.open('', '_blank');

    fetch('../../header.php')
        .then(response => response.text())

        .then(headerContent => {

            var components = [{
                    name: 'Wifi',
                    key: 'cs_cid_c_wifi'
                },
                {
                    name: 'Keyboard (FN Keys)',
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

            var checklistText = ''; // Variable to store checklist text

            // Calculate the midpoint index
            var midpointIndex = Math.ceil(components.length / 2);

            // Update the checklistText generation to create HTML elements
            var checklistText = `
                <div class="row">
                    <div class="col">
                `;
            components.forEach(function (component, index) {
                var value = checklist_data ? parseInt(checklist_data[component.key]) : null;
                var status = '';

                // Assign text representation based on value
                if (value !== null && value !== undefined) {
                    if (value === 1) {
                        status = 'Ok';
                    } else if (value === 2) {
                        status = 'Not Ok';
                    } else {
                        // Skip components with status 3 or other values
                        return;
                    }
                } else {
                    // Skip components with no value
                    return;
                }

                // Append HTML for the component
                checklistText += `
                        <div>${component.name}: ${status}</div>
                    `;
                // If it's the midpoint, close the first column and start the second column
                if (index === midpointIndex - 1) {
                    checklistText += `
                            </div>
                            <div class="col">
                            `;
                }
            });
            // Close the second column and the row
            checklistText += `
                    </div>
                </div>
                `;

            // Log or use checklistText as needed

            console.log(cs_payment_data);


            var payment_number = 1;
            var paymentHTML = '';
            cs_payment_data.forEach(function (payment) {
                paymentHTML += `
        <tr>
                    <td>Payment #${payment_number}: ${payment.cs_p_note	}</td>
                    <td>${payment.cs_p_amount}</td>
                    <td>${payment.cs_mop_name}</td>
                    <td>${payment.cs_p_reference}</td>
                    <td>${payment.cs_p_ds}</td>
                    <td>${payment.cs_p_or}</td>
                    <td>${payment.formatted_paid_date}</td>
                </tr>
                `;
                payment_number++
            });

            var payment_table_HTML = `
             <div>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Summary of Payments</th>
                        <th>Amount</th>
                        <th>MOP</th>
                        <th>Ref #</th>
                        <th>DS #</th>
                        <th>OR #</th>
                        <th>Date of Payment</th>
                    </tr>
                </thead>
                <tbody>
${paymentHTML}
           
                </tbody>
            </table>
        </div>
            `;

            console.log(payment_table_HTML);


            var serviceHTML = '';
            payments_data.forEach(function (service) {
                serviceHTML += `
                <tr>
                    <td>${service.cs_service_name}</td>
                    <td>${service.cid_sop_cost}</td>
                    <td>${service.cid_sop_discount}</td>
                    <td>${service.cid_sop_discounted_price}</td>
                    <td>${service.cid_sop_warranty_start || ''}</td>
                    <td>${service.cid_sop_warranty_end || ''}</td>
                    <td>${service.cid_sop_warranty_type || ''}</td>
                </tr>
                `;
            });

            var service_table_HTML = `
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
                ${serviceHTML}
           
                </tbody>
            </table>
        </div>
            `;





            var cid_content =
                `
            <!DOCTYPE html>
            <html lang="en">
            
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
            
                <!-- Header -->
                    ${headerContent}
                <link rel="stylesheet" href="../../style.css">
                <link rel="stylesheet" href="../CSS/cid_print.css">
            
                <title>Print CID</title>
                <style>
                .table>:not(caption)>*>* {
                    padding: 2px;
                }
                </style>
            </head>
            
            <body>
                <div class="cid_print_container">
                    <div class="cid_print_content d-flex flex-column">
                        <div class="d-flex flex-row align-items-center">
                            <div>
                                <img src="../../Assets/Images/logo.png" class="logo" alt="" srcset="">
                            </div>
                            <div>
                                <p class="title">${cms_data.cms_company_name}</p>
                                <p>📌${cms_data.cms_address}</p>
                                <p>${cms_data.cms_cp1 ? '📱'+ cms_data.cms_cp1 : ''} ${cms_data.cms_cp2 ? ' | 📱'+ cms_data.cms_cp2 : ''} ${cms_data.cms_cp3 ? ' | ☎️'+ cms_data.cms_cp3 : ''} | 📩${cms_data.cms_email}</p>
                            </div>
                        </div>
                        <div>
                            <p class="text-right"><span class="cid_print_text_bold">DIAGNOSTIC REPAIR REPORT</span></p>
                            <p class="text-right"><span class="cid_print_text_bold text_red">CID ${cid_data[0].cid_number}</span></p>
                            <p class="text-right"><span class="cid_print_text_bold">Claiming Slip: ${cid_data[0].cid_cs_number ? cid_data[0].cid_cs_number : ''}</span></p>
                        </div>
                        <div>
                            <p><span class="cid_print_text_bold">Unit Details / Brand Model: </span>
                            ${cid_data[0].cid_unit_details ? '<ul><li>' + cid_data[0].cid_unit_details.split('\n').join('</li><li>') + '</li></ul>' : ''}
                            </p>
                            <div>
                                <p class="unit_details_content"></p>
                            </div>
                        </div>
            
                        <div class="line"></div>
            
                        <div>
                            <div>
                                <p><span class="cid_print_text_bold">REMARKS: (SCRATCHES, COLORS, LCD, ETC)</span></p>
                                <div>
                                    <p class="remarks_content">
                                    ${cid_data[0].cid_remarks ? '<ul><li>' + cid_data[0].cid_remarks.split('\n').join('</li><li>') + '</li></ul>' : ''}
                                    </p>
                                </div>
                            </div>
            
                            <div class="line"></div>
            
                            <div>
                                <p><span class="cid_print_text_bold">UNIT HISTORY / PROBLEMS / ISSUES & INFORMATION PROVIDED BY
                                        CLIENT:</span></p>
                                <div>
                                    <p class="unit_history_content">
                                    ${cid_data[0].cid_unit_history ? '<ul><li>' + cid_data[0].cid_unit_history.split('\n').join('</li><li>') + '</li></ul>' : ''}
                                    </p>
                                </div>
                            </div>
                        </div>
            
                        <div class="line"></div>
            
                        <div>
                            <div class="d-flex flex-row justify-content-between">
                                <div class="col-6">
                                    <p><span class="cid_print_text_bold">SUMMARY OF REPAIRS / DIAGNOSTIC / OBSERVATION ETC:
                                        </span>
                                    </p>
                                </div>
                              
                            </div>
                            ${checklistText}
                            <ul>
                                <li>
                                    ${cid_data[0].cid_sor_content ? cid_data[0].cid_sor_content : ''}
                                </li>
                            </ul>
                            <div>
                                <p class="summary_of_repairs_content"></p>
                            </div>
                            <div class="d-flex flex-row justify-content-between">
                                <p><span class="cid_print_text_bold">START OF REPAIR DATE: </span>${cid_data[0].cid_sor_start_date ? cid_data[0].cid_sor_start_date : ''}</p>
                                <p><span class="cid_print_text_bold">END OF REPAIR DATE: </span>${cid_data[0].cid_sor_end_date ? cid_data[0].cid_sor_end_date : ''}</p>
                                <p><span class="cid_print_text_bold">TECH IN CHARGE: </span>${cid_data[0].technician_names ? cid_data[0].technician_names : "No Technician"}</p>
                            </div>
                        </div>
            
                        <div class="line"></div>
            
                        <div>
                            <p><span class="cid_print_text_bold">RECCOMENDATIONS: </span></p>
                            <div>
                                <p class="reccomendations_content">
                                
                            <ul>
                                <li>
                                    ${cid_data[0].cid_r_content ? cid_data[0].cid_r_content : ''}
                                </li>
                            </ul>
                        </div>
                        </div>
            
                        <div class="line"></div>

                          <div>
                            <div class="d-flex flex-row justify-content-between">
                                <p><span class="cid_print_text_bold">Warranty Details: </span></p>
                            </div>
                            <div class="mt-1">
                                ${service_table_HTML}
                            </div>
                        </div>
             <div class="line"></div>
                        <div>
                            <div class="d-flex flex-row justify-content-between">
                                <p><span class="cid_print_text_bold">SUMMARY OF PAYMENTS: </span></p>
                            </div>
                            <div class="mt-1">
                            ${payment_table_HTML}

                            </div>
                        </div>
            
                        <div class="cid_footer">
                            <div>
                                <div class="line"></div>
                                <p class="cid_print_text_small">${cms_data.cms_acknowledgement}</p>
                                <br>
                            </div>
                            <div class="d-flex flex-row">
                                <div class="me-3">
                                    <label class="cid_print_text_bold" for="name_with_signature">Name With Signature:</label>
                                    <input type="text" id="name_with_signature" name="name_with_signature"><br>
                                </div>
            
                                <div>
                                    <label class="cid_print_text_bold" for="pickup_date_time">Date & Time of Pick-Up:</label>
                                    <input type="text" id="pickup_date_time" name="pickup_date_time"><br>
                                </div>
                            </div>
                            <br>
                            <div class="d-flex flex-row">
                                <div class="me-3">
                                    <label class="cid_print_text_bold" for="released_by">Released Unit by:</label>
                                    <input type="text" id="released_by" name="released_by"><br>
                                </div>
            
                                <div class="me-3">
                                    <label class="cid_print_text_bold" for="release_date_time">Released Date & Time:</label>
                                    <input type="text" id="release_date_time" name="release_date_time"><br>
                                </div>
            
                                <div>
                                    <label class="cid_print_text_bold" for="released_thru">Released thru:</label>
                                    <input type="text" id="released_thru" name="released_thru"><br>
                                </div>
                            </div>
                            <div class="cid_print_text_small">
                            ${cms_data.cms_disclaimer}
                            </div>
                        </div>
                    </div>
                </div>
            </body>
            
            </html>
            `;

            printWindow.document.write(cid_content);

            printWindow.document.close();

            printWindow.onload = function () {
                printWindow.print();
            };
        })
        .catch(error => {
            console.error('Error fetching header content:', error);
        });
}