var cid_number;

$(document).ready(function () {
    cid_number = sessionStorage.getItem('cid_number');

    get_data();

    $('.multiple_select').select2({
        width: '100%',
    });
    $(document).off('click', '.save_btn').on('click', '.save_btn', function () {
        var type = $(this).data('type');
        switch (type) {
            case 'opt_tech':
                opt_tech(type);
                break;
            case 'save_tech':
                save_tech(type);
                break;
            case 'status_save':
                status_save(type);
                break;
            case 'sor_save':
                sor_save(type);

                break;
            case 'reco_save':
                reco_save(type);
                break;
            case 'add_sop':
                add_sop();
                break;
            case 'sop_r_save':
                sop_r_save(type);
            case 'save_infos':
                save_infos(type, this);
                break;
            default:
                console.error('Invalid type:', type);
                return;
        }
    });



    sop_validations();

    $(document).on('click', '.opt_tech', function () {
        $('#u_tech_opt_modal').modal('show');
    });

    $(document).on('click', '.edit_tech', function () {
        $('#u_tech_edit_modal').modal('show');
    });


    $(document).on('click', '.add-payment', function () {
        $('#add_payment_modal').modal('show');
    });

    $(document).on('click', '.view-payment', function () {
        $('#view_payment_modal').modal('show');
    });

    $("#add_payment_modal").on('shown.bs.modal', function () {
        get_data();
    });

    $("#view_payment_modal").on('shown.bs.modal', function () {
        get_data();
    });

    $(".add_payment").on('click', function () {
        save_payment('add_payment', this);
    });


    $(document).on('click', '#delete_payment', function () {
        save_payment('delete_payment', this);
    });

    get_technician();
});

var cid_number = $('#cid_number_text');

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
                console.log(data);
                populate_cid_content(data);
                populate_summary_of_payments(data);
                populate_sor_service(data.payments_data, data.data[0]);
                populate_checklist(data);
                populate_add_payment(data);
                populate_view_payment(data);
                console.log("Select Device Value:", $('#cid_type').val());
            },
            error: function (xhr, status, error) {
                console.error("Error fetching data:", error, xhr, status);
            }
        });
    } else {
        console.error("cid_number not found in session storage");
    }
}

function populate_add_payment(data) {

    let add_payment_container = $('#add_payment_container');
    add_payment_container.empty();

    let mop_data = data.mop_data;
    let service_data = data.payments_data;
    let vat_percent = data.settings_data[0].cs_settings_value;
    let vat_name = data.settings_data[0].cs_settings_unit;
    let total_discounted_price = data.total_discounted_price.total_discounted_price;

    let payments_data = data.cs_payment_data;


    let cf_cost = 0;
    let vat_cost = (vat_percent / 100) * total_discounted_price;
    let total = 0;
    let balance = 0;

    let previous_payments = ``;
    let previous_payments_cost = ``;

    let paymentNumber = 1
    payments_data.forEach(function (payment) {
        previous_payments += `
            <p>Payment #${paymentNumber}</p>
        `;

        previous_payments_cost += `
            <p>${payment.cs_p_amount}</p>
        `;

        paymentNumber++; // Increment the payment number
    });


    console.log(vat_cost)

    let service_names = ``;
    let service_cost = ``;


    service_data.forEach(function (service) {
        service_names += `
                <p>${service.service_name}</p>
            `;

        service_cost += `
                <p>${service.cid_sop_discounted_price}</p>
            `;
    })

    let payments_HTML = `
        <div>
            <p>Payments</p>
            <div class="row text-start">
                <div class="col-6">
                    ${service_names}
                    <p>${vat_name}(${vat_percent}%):</p>
                    <p class="fw-bold">Total:</p>
                    <p>Amount:</p>
                    ${previous_payments}
                    <p>Balance:</p>
                    <br>
                    <p>Convinience Fee(<span id="cf_percent"></span>)%:</p>
                </div>
                <div class="col-6">
                    ${service_cost}
                    <p id="vat">${vat_cost}</p>
                    <p id="total">${total || 0}</p>
                    <p id="amount"></p>
                    ${previous_payments_cost}
                    <p id="balance"></p>
                    <br>
                    <p id="mop_cf">${cf_cost || 0}</p>
                </div>
            </div>
        <div>
        `;

    let select_mop = ``;

    mop_data.forEach(function (mop_data) {
        select_mop += `
            <option value="${mop_data.cs_mop_id}" data-fee="${mop_data.cs_mop_fee}">${mop_data.cs_mop_name}</option>
            `;
    })

    let add_payment_HTML = `
        ${payments_HTML}
        <div>
            <div>
                <p>Notes:</p>
                <textarea class="form-control add_note" name="" id="" cols="30" rows="3"></textarea>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <p>DS #:</p>
                <input class="form-control add_ds" type="number" name="" id="">
            </div>
            <div class="col">
                <p>OR #:</p>
                <input class="form-control add_or" type="number" name="" id="">
            </div>
        </div>
        <div class="row">
            <div class="col">
                <p>Amount:</p>
                <input class="form-control add_amount" type="number" name="" id="">
            </div>
            <div class="col">
                <p>Mode of Payment:</p>
                <select name="" class="form-control add_mop" id="">
                    ${select_mop}
                </select>
            </div>
            <div class="col">
                <p>Reference #:</p>
                <input class="form-control add_reference" type="text" name="" id="">
            </div>
            <div class="col">
                <p>Date of Payment:</p>
                <input class="form-control add_datepayment" type="datetime-local" name="payment_date"
                    id="payment_date">
            </div>
        </div>
        <div class="alert_container mt-2">

        </div>
        `;

    add_payment_container.append(add_payment_HTML);

    $('.add_amount').on('input', function () {
        calculateTotal();
        let amount = parseFloat($(this).val());
        if (amount > total) {
            // Display a message or prevent further input
            $(this).val(total.toFixed(2)); // Set the input value to the total
        }
    });

    $('.add_mop').on('change', function () {
        calculateTotal();
    });

    function calculateTotal() {
        let amount = parseFloat($('.add_amount').val());
        let selectedMopFee = parseFloat($('.add_mop option:selected').data('fee'));
        if (isNaN(amount)) {
            cf_cost = 0;
            amount = 0;
        } else {
            cf_cost = (selectedMopFee / 100) * amount;
        }

        $('#cf_percent').text(selectedMopFee);
        $('#mop_cf').text(cf_cost.toFixed(2));
        total = vat_cost + total_discounted_price;
        $('#total').text(total.toFixed(2));

        let totalPreviousPayments = 0;
        payments_data.forEach(function (payment) {
            totalPreviousPayments += parseFloat(payment.cs_p_amount);
        });

        let remainingTotal = total - totalPreviousPayments;

        $('#amount').text(amount.toFixed(2));

        balance = remainingTotal - amount;
        $('#balance').text(balance.toFixed(2));
    }
    calculateTotal();
}

function populate_view_payment(data) {
    let view_payment_container = $('#view_payment_container');
    view_payment_container.empty();

    let mop_data = data.mop_data;
    let service_data = data.payments_data;
    let vat_percent = data.settings_data[0].cs_settings_value;
    let vat_name = data.settings_data[0].cs_settings_unit;
    let total_discounted_price = data.total_discounted_price.total_discounted_price;

    let payments_data = data.cs_payment_data;

    let vat_cost = (vat_percent / 100) * total_discounted_price;
    let total = total_discounted_price + vat_cost;

    let service_names = ``;
    let service_cost = ``;


    service_data.forEach(function (service) {
        service_names += `
                <p>${service.service_name}</p>
            `;

        service_cost += `
                <p>${service.cid_sop_discounted_price}</p>
            `;
    })

    let payments = ``;

    let paymentNumber = 1
    payments_data.forEach(function (payment) {
        payments += `
            <p class="">Payment #${paymentNumber}</p>
            <div>
                <p>Notes:<p>
                <textarea class="form-control" name="" id="" cols="30" rows="3" disabled>${payment.cs_p_note}</textarea>
            </div>   
            <div class="row mb-2">
                <div class="col">
                    <p>DS:<p>
                    <input class="form-control" value="${payment.cs_p_ds}" type="number" disabled>
                </div>
                <div class="col">
                    <p>OR:<p>
                    <input class="form-control" value="${payment.cs_p_or}" type="number" disabled>
                </div> 
            </div>
            <div class="row">
                <div class="col">
                    <p>Amount Paid:<p>
                    <input class="form-control" value="${payment.cs_p_amount}" type="text" disabled>
                </div>
                <div class="col">
                    <p>Mode of Payment:<p>
                    <input class="form-control" value="${payment.cs_mop_name}" type="text" disabled>
                </div> 
                <div class="col">
                    <p>Reference #:<p>
                    <input class="form-control" value="${payment.cs_p_reference}" type="text" disabled>
                </div>
                <div class="col">
                    <p>Date of Payment:<p>
                    <input class="form-control" value="${payment.formatted_paid_date}" type="text" disabled>
                </div>    
            <!-- <div class="my-2">
                <button class="form-control btn-danger" data-id="${payment.cs_p_id}" id="delete_payment" data-type="delete_payment">Delete Payment</button>
            </div> -->
        `;
        paymentNumber++;
    });

    let view_payment_HTML = `
    <div class="text-start">
        <p class="fw-bold">Services/Products</p>
        <div class="row">
            <div class="col">
                ${service_names}
                <p>${vat_name}(${vat_percent}%):</p>
                <p class="fw-bold">Total:</p>
            </div>
            <div class="col">
                ${service_cost}
                <p id="vat">${vat_cost}</p>
                <p id="total">${total || 0}</p>
            </div>
        </div>
    </div>
    <div class="text-start mt-2">
        <p class="fw-bold">Payments</p>
        ${payments}
    </div>

    <div class="alert_container mt-2">

    </div>
    `;

    view_payment_container.append(view_payment_HTML);

}

function save_payment(type, clickedButton) {
    if (type === "add_payment") {
        var add_payment_modal = $(clickedButton).closest('.modal-content');

        var data = {
            type: type,
            cid_number: cid_number,
            note: add_payment_modal.find('.add_note').val(),
            amount: add_payment_modal.find('.add_amount').val(),
            mop: add_payment_modal.find('.add_mop').val(),
            reference: add_payment_modal.find('.add_reference').val(),
            vat: add_payment_modal.find('#vat').text(),
            cf: add_payment_modal.find('#mop_cf').text(),
            total: add_payment_modal.find('#total').text(),
            paid_date: add_payment_modal.find('.add_datepayment').val(),
            ds: add_payment_modal.find('.add_ds').val(),
            or: add_payment_modal.find('.add_or').val(),
            balance: add_payment_modal.find('#balance').text(),
        };
    } else if (type === "delete_payment") {
        var data = {
            cid_number: cid_number,
            type: type,
            cs_p_id: $(clickedButton).data('id')
        };
    }


    console.log(data);

    save_data(data);
}

function get_technician() {
    if (cid_number) {
        $.ajax({
            url: "../PHP/get_technician.php",
            method: "POST",
            dataType: "json",
            data: {
                cid_number: cid_number,
            },
            success: function (data) {
                populate_select_technician(data.data);
            },
            error: function (xhr, status, error) {
                console.error("Error fetching data:", error, xhr, status);
            }
        });
    } else {
        console.error("cid_number not found in session storage");
    }
}


function populate_checklist(data) {
    var checklist_data = data.checklist_data[0];
    var checklist_tbody = $('#checklist_tbody');
    checklist_tbody.empty();

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

    components.forEach(function (component) {
        var value = checklist_data ? checklist_data[component.key] : null;
        var checked1 = value == 1 ? 'checked' : '';
        var checked2 = value == 2 ? 'checked' : '';
        var checked3 = value == 3 ? 'checked' : '';

        var row = `
            <tr>
                <td>${component.name}</td>
                <td><input type="radio" name="${component.key}_status" value="1" class="mx-auto d-block" ${checked1}></td>
                <td><input type="radio" name="${component.key}_status" value="2" class="mx-auto d-block" ${checked2}></td>
                <td><input type="radio" name="${component.key}_status" value="3" class="mx-auto d-block" ${checked3}></td>
            </tr>
        `;

        checklist_tbody.append(row);
    });
}


function populate_cid_content(cid_content) {
    var data = cid_content.data[0];
    console.log(cid_content);
    var device_list = cid_content.devices_data;

    $('#cid_number_text').text(data.cid_number_cid);

    // Populate Info
    var info_container = $('#info_container');
    info_container.empty();
    var cid_device_id = data.cid_device_id.toString();

    console.log("cid_device_id:" + cid_device_id);
    var select_device = '';
    device_list.forEach(function (device) {
        // Declare cid_device_id here
        select_device += `
        <option value="${device.cs_device_id}" ${device.cs_device_id === cid_device_id ? 'selected' : ''}>${device.cs_device_name}</option>
        `;
    });

    var info_HTML =
        `
    <div class="sop_group">
    <div>
        <p><span>Claiming Slip:</span> ${data.cid_cs_number ? data.cid_cs_number : 'N/A'}</p>
    </div>
    <hr>
    <div>
        <p><span>Unit Details / Brand Model: </span></p>
        <div class="d-flex flex-row align-items-center">
        <textarea class="form-control mb-1 unit_details" rows="4" cols="50">${data.cid_unit_details ? data.cid_unit_details : 'N/A'}</textarea>
        <button class="btn btn-primary save_btn ms-2" style="width: 10%; height: auto;" data-type="save_infos">Save</button>
        </div>
    </div>
    <hr>
    <div>
        <p><span>REMARKS: (SCRATCHES, COLORS, LCD, ETC)</span></p>
        <div class="d-flex flex-row align-items-center">
            <textarea class="form-control mb-1 remarks" rows="4" cols="50">${data.cid_remarks ? data.cid_remarks : 'N/A'}</textarea>
        <button class="btn btn-primary save_btn ms-2" style="width: 10%; height: auto;" data-type="save_infos">Save</button>
        </div>
    </div>
    <hr>
    <div>
        <p><span>UNIT HISTORY / PROBLEMS / ISSUES & INFORMATION PROVIDED BY CLIENT:</span></p>
        <div class="d-flex flex-row align-items-center"> 
            <textarea class="form-control mb-1 unit_history" rows="4" cols="50">${data.cid_unit_history ? data.cid_unit_history : 'N/A'}</textarea>
        <button class="btn btn-primary save_btn ms-2" style="width: 10%; height: auto;" data-type="save_infos">Save</button>
        </div>
    </div>
    <hr>
    
    <div>
        <p><span>Device Type:</span></p>
        <div class="d-flex flex-row align-items-center"> 
        <select class="form-select device_type" id="device_type">
         ${select_device}
        </select>
        <button class="btn btn-primary save_btn ms-2" style="width: 10%; height: auto;" data-type="save_infos">Save</button>
        </div>
    </div>
    </div>
    <hr>
    <div>
        <div class="my-auto">
        <p><span>TECHNICIAN(s): 
        <iconify-icon class="ms-2 edit_tech" icon="tabler:edit"></iconify-icon>
        <iconify-icon class="ms-2 opt_tech" icon="gg:remove"></iconify-icon>
        </span></p>
        </div>
        <div>   
            <p>${data.technician_names ? data.technician_names : 'N/A'}</p>
        </div>
    </div>
    <hr>
    <div>
    
    <p><span>STATUS: </span>${data.cid_status ? data.cid_status : 'N/A'}</p>
    <div class="d-flex flex-row">
        <div class="w-100">
        <select class="form-select" id="cid_status">
            if data.cid_status = Completed add disabled to all option other thatn completed and ongoing
            <option value="On-going" ${data.cid_status === 'On-going' ? 'selected' : ''}>On-going</option>
            <option value="Completed" ${data.cid_status === 'Completed' ? 'selected' : ''}>Completed</option>
            <option value="Pending" ${data.cid_status === 'Pending' ? 'selected' : ''}>Pending</option>
            <option value="Abandoned" ${data.cid_status === 'Abandoned' ? 'selected' : ''}>Abandoned</option>
            <option value="For Release" ${data.cid_status === 'For Release' ? 'selected' : ''}>For Release</option>
            <option value="Return To Owner" ${data.cid_status === 'Return To Owner' ? 'selected' : ''}>Return To Owner</option>
            
        </select>
        </div>
        <div class="w-20">
            <button class="form-control btn-primary save_btn ms-2 w-20" data-type="status_save">Save</button>
        </div>
    </div>
    `;
    info_container.append(info_HTML);

    //Populate Summary of Repairs
    $('#sor_ta').val(data.cid_sor_content ? data.cid_sor_content : '');
    $('#sor_we_text').text(data.formatted_warranty_end ? data.formatted_warranty_end : '');
    $('#sor_donor').val(data.cid_sor_warranty_start ? data.cid_sor_warranty_start : '');
    $('#sor_we').val(data.cid_sor_we_value ? data.cid_sor_we_value : '');
    $('#sor_du').val(data.cid_sor_we_duration ? data.cid_sor_we_duration : '');
    $('#sor_service').val(data.cid_sor_service ? data.cid_sor_service : '');
    $('#sor_sord').val(data.cid_sor_start_date ? data.cid_sor_start_date : '');
    $('#sor_eord').val(data.cid_sor_end_date ? data.cid_sor_end_date : '');

    //Populate Recommendations
    $('#reco_ta').val(data.recommendation ? data.recommendation : '');

    //Populate Summary of Payments
    $('#sop_cr').val(data.cid_sop_cr ? data.cid_sop_cr : '');
    $('#sop_or').val(data.cid_sop_or ? data.cid_sop_or : '');

    //
}



function save_infos(type, clickedButton) {
    var $sop_group = $(clickedButton).closest('.sop_group');
    var unit_details = $sop_group.find('.unit_details').val();
    var remarks = $sop_group.find('.remarks').val();
    var unit_history = $sop_group.find('.unit_history').val();
    var device_type = $sop_group.find('.device_type').val();

    var dataToSend = {
        cid_number: cid_number,
        type: type,
        unit_details: unit_details,
        remarks: remarks,
        unit_history: unit_history,
        device_type: device_type
    };

    console.log(dataToSend);
    save_data(dataToSend);
}

function populate_select_technician(data) {
    var select_technician_containers = $('.select_technician');
    select_technician_containers.empty();

    data.forEach(function (data) {
        var select_technician_HTML =
            `
                <option value="${data.csu_id}">${data.csu_name}</option>
                `;
        select_technician_containers.append(select_technician_HTML);
    });

}

function populate_sor_service(service, s_service) {
    var select_service_container = $('#sor_service');
    select_service_container.empty();
    service.forEach(function (service) {
        var select_service_HTML = `<option value="${service.cid_sop_service}" ${service.cid_sop_service === s_service.cid_sor_service ? 'selected' : ''}>${service.cid_sop_service}</option>`;
        select_service_container.append(select_service_HTML);
    });
}

function populate_select_technician(data) {
    var select_technician_containers = $('.select_technician');
    select_technician_containers.empty();

    data.forEach(function (data) {
        var select_technician_HTML =
            `
                <option value="${data.csu_id}">${data.csu_name}</option>
                `;
        select_technician_containers.append(select_technician_HTML);
    });
}


//Populate Summmry of Payments
function populate_summary_of_payments(data) {
    let payment = data.payments_data;
    let service = data.service_data;
    var sop_data_container = $('#sop_data_container');

    sop_data_container.empty();
    console.log("data");
    console.log(data);

    payment.forEach(function (payment, index) {
        let service_select_HTML = `
            
        `;

        service.forEach(function (service) {
            service_select_HTML += `
                <option value="${service.cs_service_id}" ${service.cs_service_id == payment.cid_service_id ? 'selected' : ''}>${service.cs_service_name}</option>
            `;
        });

        var sop_data_HTML =
            `
            <div class="d-flex flex-row w-100 mb-3 sop_group flex-wrap">
                <div class="w-100">
                    <p><span>Service/Product #${index + 1}</span></p>
                </div>
                <input type="hidden" class="sop_id" value="${payment.cid_sop_id}">
                <div class="d-flex flex-column flex-fill me-3 mb-3">
                    <label for="service_${index}" class="form-label">Service/Product</label>
                    <select class="form-control service" id="service_${index}" required>
                        ${service_select_HTML}
                    </select>
                </div>
                <div class="d-flex flex-column flex-fill me-3 mb-3">
                    <label for="cost_${index}" class="form-label">Cost</label>
                    <input id="cost_${index}" class="form-control cost" type="number" min="0" placeholder="Cost" value="${payment.cid_sop_cost}" required>
                </div>
                <div class="d-flex flex-column flex-fill me-3 mb-3">
                    <label for="discount_${index}" class="form-label">Discount (%)</label>
                    <input id="discount_${index}" class="form-control discount" type="number" min="0" max="100" placeholder="Discount (%)" value="${payment.cid_sop_discount}">
                </div>
                <div class="d-flex flex-column flex-fill me-3 mb-3">
                    <label for="discounted_price_${index}" class="form-label">Discounted Price</label>
                    <input id="discounted_price_${index}" class="form-control" type="number" placeholder="Discounted Price" value="${payment.cid_sop_discounted_price}" disabled>
                </div>
                <div class="d-flex flex-column flex-fill me-3 mb-3">
                    <label for="warranty_start_${index}" class="form-label">Warranty Start</label>
                    <input id="warranty_start_${index}" class="form-control warranty_start" type="date" placeholder="Warranty Start" value="${payment.cid_sop_warranty_start}">
                </div>
                <div class="d-flex flex-column flex-fill me-3 mb-3">
                    <label for="warranty_duration_${index}" class="form-label">Warranty Duration</label>
                    <input id="warranty_duration_${index}" class="form-control warranty_duration" type="number" placeholder="Warranty Duration" value="${payment.cid_sop_warranty_duration}">
                </div>
                <div class="d-flex flex-column flex-fill me-3 mb-3">
                    <label for="warranty_unit_${index}" class="form-label">Warranty Unit</label>
                    <select id="warranty_unit_${index}" class="form-control warranty_unit">
                        <option value="Day" ${payment.cid_sop_warranty_unit === 'Day' ? 'selected' : ''}>Day</option>
                        <option value="Week" ${payment.cid_sop_warranty_unit === 'Week' ? 'selected' : ''}>Week</option>
                        <option value="Month" ${payment.cid_sop_warranty_unit === 'Month' ? 'selected' : ''}>Month</option>
                        <option value="Year" ${payment.cid_sop_warranty_unit === 'Year' ? 'selected' : ''}>Year</option>
                    </select>
                </div>
                <div class="d-flex flex-column flex-fill me-3 mb-3">
                    <label for="warranty_type_${index}" class="form-label">Warranty Type</label>
                    <select id="warranty_type_${index}" class="form-control warranty_type">
                        <option value="Service" ${payment.cid_sop_warranty_type === 'Service' ? 'selected' : ''}>Service</option>
                        <option value="Manufacturer" ${payment.cid_sop_warranty_type === 'Manufacturer' ? 'selected' : ''}>Manufacturer</option>
                    </select>
                </div>
                <div class="d-flex flex-row w-100 mb-3">
                    <button class="form-control btn-primary save_btn me-2" data-type="sop_data_save">Save</button>
                    <button class="form-control btn-danger delete_btn me-2" data-type="sop_data_delete">Delete</button>
                </div>
            </div>
            `;
        sop_data_container.append(sop_data_HTML);
    });
}


function opt_tech(type) {
    var dataToSend = {
        cid_number: cid_number,
        type: type
    };
    save_data(dataToSend, function () {
        window.location.href = "../PAGES/cids.php";
    });
}

function save_tech(type) {
    var technicians = $('#technician').val();
    var technicians_container = $('#technician');

    if (!technicians_container[0].checkValidity()) {
        alert_display('Please select a technician.', 'danger');
        return;
    }

    var dataToSend = {
        cid_number: cid_number,
        type: type,
        technicians: technicians
    };
    console.log(dataToSend);

    save_data(dataToSend, function () {
        technicians_container.empty();
    });
}

function status_save(type) {
    var status = $('#cid_status').val();

    var dataToSend = {
        cid_number: cid_number,
        type: type,
        status: status
    };

    save_data(dataToSend);
}

function getValues() {
    var components = document.querySelectorAll('.checklist-table tbody tr');
    var results = {};
    components.forEach(function (component) {
        var componentName = component.querySelector('td').textContent.trim();
        var radios = component.querySelectorAll('input[type="radio"]');
        radios.forEach(function (radio) {
            if (radio.checked) {
                results[componentName] = radio.value;
            }
        });
    });
    return results;
}

function sor_save(type) {
    var sor_content = $('#sor_ta').val();
    var sor_sord = $('#sor_sord').val();
    var sor_eord = $('#sor_eord').val();

    var checklistValues = getValues();

    var dataToSend = {
        cid_number: cid_number,
        type: type,
        sor_content: sor_content,
        sor_sord: sor_sord,
        sor_eord: sor_eord,
        checklist: checklistValues // checklistValues will be an empty object if no radios are checked
    };

    console.log(dataToSend); // To verify the data structure

    save_data(dataToSend);
}

function reco_save(type) {
    var reco_content = $('#reco_ta').val();
    var dataToSend = {
        cid_number: cid_number,
        type: type,
        reco_content: reco_content
    };
    save_data(dataToSend);
}

function sop_validations() {
    $('#sop_container').on('click', '.save_btn', function () {
        var type = $(this).data('type');
        sop_data_save(type, this);
    });

    $('#sop_data_container').on('click', '.save_btn', function () {
        var type = $(this).data('type');
        sop_data_save(type, this);
    });

    $('#sop_data_container').on('click', '.delete_btn', function () {
        var type = $(this).data('type');
        sop_delete(type, this);
    });
}

function sop_r_save(type) {
    var sop_cr = $('#sop_cr').val();
    var sop_or = $('#sop_or').val();
    var dataToSend = {
        cid_number: cid_number,
        type: type,
        sop_cr: sop_cr,
        sop_or: sop_or
    };
    save_data(dataToSend);
}


function add_sop() {
    $.ajax({
        url: "../PHP/get_services.php",
        method: "GET",
        dataType: "json",
        data: {
            cid_number: cid_number
        },
        success: function (data) {
            populate_add_sop(data.services_not_in_summary);
            console.log(data);
        },
        error: function (xhr, status, error) {
            console.error("Error fetching data:", error, xhr, status);
        }
    });
}

function populate_add_sop(data) {
    var sop_container = $('#sop_container');
    var sop_form_HTML =
        ` 
        <div class="sop_group">
        <div class="row w-100 mb-3">
            <div class="col-md-3">
                <label for="service" class="form-label">Service/Product</label>
                <select id="service" class="form-control service" required>
                    `;
    data.forEach(function (service) {
        sop_form_HTML += `<option value="${service.service_id}">${service.service_name}</option>`;
    });

    sop_form_HTML +=
        `</select>
            </div>
            <div class="col-md-3">
                <label for="cost" class="form-label">Cost</label>
                <input id="cost" class="form-control cost" type="number" min="0" placeholder="Cost" required>
            </div>
            <div class="col-md-3">
                <label for="discount" class="form-label">Discount (%)</label>
                <input id="discount" class="form-control discount" type="number" min="0" max="100" placeholder="Discount (%)" value="0">
            </div>
            <div class="col-md-3">
                <label for="discounted_price" class="form-label">Discounted Price</label>
                <input id="discounted_price" class="form-control" type="number" placeholder="Discounted Price" disabled>
            </div>
        </div>
        <div class="row w-100 mb-3">
            <div class="col-md-3">
                <label for="warranty_start" class="form-label">Warranty Start</label>
                <input id="warranty_start" class="form-control warranty_start" type="date" placeholder="Warranty Start">
            </div>
            <div class="col-md-3">
                <label for="warranty_duration" class="form-label">Warranty Duration</label>
                <input id="warranty_duration" class="form-control warranty_duration" type="number" placeholder="Warranty Duration">
            </div>
            <div class="col-md-3">
                <label for="warranty_unit" class="form-label">Warranty Unit</label>
                <select id="warranty_unit" class="form-control warranty_unit" required>
                    <option value="Day">Day</option>
                    <option value="Week">Week</option>
                    <option value="Month">Month</option>
                    <option value="Year">Year</option>
                </select>
            </div>
            <div class="col-md-3">
                <label for="warranty_type" class="form-label">Warranty Type</label>
                <select id="warranty_type" class="form-control warranty_type" required>
                    <option value="Service">Service</option>
                    <option value="Manufacturer">Manufacturer</option>
                </select>
            </div>
        </div>
        <div class="row w-100 mb-3">
            <div class="col-md-12 d-flex justify-content-end">
                <button class="form-control btn-primary save_btn me-2" data-type="sop_data_save">Save</button>
            </div>
        </div>
        </div>
    `;
    sop_container.append(sop_form_HTML);
}



function sop_data_save(type, clickedButton) {
    var $sopGroup = $(clickedButton).closest('.sop_group');
    var isValid = true;

    $sopGroup.find('input, select').each(function () {
        var $input = $(this);
        if (!$input[0].checkValidity()) {
            $input.addClass('is-invalid');
            setTimeout(function () {
                $input.removeClass('is-invalid');
            }, 2000);
            isValid = false;
        }
    });

    if (!isValid) {
        return;
    }

    var sop_id = $sopGroup.find('.sop_id').val();
    var service = $sopGroup.find('.service').val();
    var cost = parseFloat($sopGroup.find('.cost').val());
    var discount = parseFloat($sopGroup.find('.discount').val());
    var discounted_price = cost - (cost * (discount / 100));
    var paid = $sopGroup.find('.paid').is(":checked") ? "1" : "0";
    var warranty_start = $sopGroup.find('.warranty_start').val();
    var warranty_duration = parseInt($sopGroup.find('.warranty_duration').val(), 10);
    var warranty_unit = $sopGroup.find('.warranty_unit').val();
    var warranty_type = $sopGroup.find('.warranty_type').val();

    var dataToSend = {
        cid_number: cid_number,
        type: type,
        sop_id: sop_id,
        service: service,
        cost: cost,
        discounted_price: discounted_price,
        discount: discount,
        paid: paid
    };

    if (warranty_start && warranty_duration) {
        var warranty_start_date = new Date(warranty_start);
        var warranty_end_date = new Date(warranty_start_date);

        switch (warranty_unit) {
            case 'Day':
                warranty_end_date.setDate(warranty_start_date.getDate() + warranty_duration);
                break;
            case 'Week':
                warranty_end_date.setDate(warranty_start_date.getDate() + (warranty_duration * 7));
                break;
            case 'Month':
                warranty_end_date.setMonth(warranty_start_date.getMonth() + warranty_duration);
                break;
            case 'Year':
                warranty_end_date.setFullYear(warranty_start_date.getFullYear() + warranty_duration);
                break;
            default:
                break;
        }

        dataToSend.warranty_start = warranty_start;
        dataToSend.warranty_duration = warranty_duration;
        dataToSend.warranty_unit = warranty_unit;
        dataToSend.warranty_type = warranty_type;
        dataToSend.warranty_end = warranty_end_date.toISOString().split('T')[0];
    }


    console.log(dataToSend);

    save_data(dataToSend, function () {
        $sopGroup.remove();
    });
}



function sop_delete(type, clickedButton) {
    var $sopGroup = $(clickedButton).closest('.sop_group');
    var sop_id = $sopGroup.find('.sop_id').val();
    var dataToSend = {
        cid_number: cid_number,
        type: type,
        sop_id,
        sop_id
    };
    save_data(dataToSend);
}

function save_data(data, onSuccess) {
    $.ajax({
        url: "../PHP/save_data.php",
        method: "POST",
        dataType: "json",
        data: data,
        success: function (data) {
            alert_display(data.message);
            if (typeof onSuccess === 'function') {
                onSuccess();
            }
            get_data();

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
        $('.alert').fadeOut('slow');
    }, 3000);
}