var cid_number;

$(document).ready(function () {
    cid_number = sessionStorage.getItem('cid_number');

    get_data();

    $('.save_btn').click(function () {
        var type = $(this).data('type');
        switch (type) {
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
                break;
            default:
                console.error('Invalid type:', type);
                return;
        }
    });

    sop_validations();
});


var cid_number = $('#cid_number_text');

function get_data() {
    if (cid_number) {
        $.ajax({
            url: "../PHP/get_data.php",
            method: "GET",
            dataType: "json",
            data: {
                cid_number: cid_number,
            },
            success: function (data) {
                populate_cid_content(data.data[0]);
                populate_summary_of_payments(data.payments_data);
                console.log(data);
            },
            error: function (xhr, status, error) {
                console.error("Error fetching data:", error, xhr, status);
            }
        });
    } else {
        console.error("cid_number not found in session storage");
    }
}

function populate_cid_content(data) {

    $('#cid_number_text').text(data.cid_number_cid);

    // Populate Info
    var info_container = $('#info_container');
    info_container.empty();
    var info_HTML =
        `
    <div>
        <p><span>Claiming Slip:</span> ${data.cid_cs_number ? data.cid_cs_number : ''}</p>
    </div>
    <hr>
    <div>
        <p><span>Unit Details / Brand Model: </span>${data.cid_unit_details ? data.cid_unit_details : ''}</p>
    </div>
    <hr>
    <div>
        <p><span>REMARKS: (SCRATCHES, COLORS, LCD, ETC)</span></p>
        <div>
            <p>${data.cid_remarks ? data.cid_remarks : ''}</p>
        </div>
    </div>
    <hr>
    <div>
        <p><span>UNIT HISTORY / PROBLEMS / ISSUES & INFORMATION PROVIDED BY CLIENT:</span></p>
        <div>   
            <p>${data.cid_unit_history ? data.cid_unit_history : ''}</p>
        </div>
    </div>
    `
    info_container.append(info_HTML);

    //Populate Summary of Repairs
    $('#sor_ta').val(data.cid_sor_content ? data.cid_sor_content : '');
    $('#sor_we_text').text(data.formatted_warranty_end ? data.formatted_warranty_end : '');
    $('#sor_donor').val(data.cid_sor_warranty_start ? data.cid_sor_warranty_start : '');
    $('#sor_we').val(data.cid_sor_we_value ? data.cid_sor_we_value : '');
    $('#sor_du').val(data.cid_sor_we_duration ? data.cid_sor_we_duration : '');
    $('#sor_sord').val(data.cid_sor_start_date ? data.cid_sor_start_date : '');
    $('#sor_eord').val(data.cid_sor_end_date ? data.cid_sor_end_date : '');

    //Populate Recommendations
    $('#reco_ta').val(data.recommendation ? data.recommendation : '');

    //Populate Summary of Payments
    $('#sop_cr').val(data.cid_sop_cr ? data.cid_sop_cr : '');
    $('#sop_or').val(data.cid_sop_or ? data.cid_sop_or : '');
    $('#total_amount').text(data.total_discounted_price ? data.total_discounted_price : '0');
    $('#unpaid_amount').text(data.unpaid_discounted_price ? data.unpaid_discounted_price : '0');
    $('#paid_amount').text(data.paid_discounted_price ? data.paid_discounted_price : '0');
}

//Populate Summmry of Payments
function populate_summary_of_payments(data) {
    var sop_data_container = $('#sop_data_container');
    console.log(data);
    sop_data_container.empty();

    data.forEach(function (payment) {
        var sop_data_HTML =
            `
            <div class="d-flex flex-row w-100 mb-3 sop_group">
                <input type="hidden" class="sop_id" value="${payment.cid_sop_id}">
                <div class="d-flex flex-column w-100 me-3">
                    <input class="form-control service" type="text" placeholder="Service" value="${payment.cid_sop_service}" required>
                </div>
                <div class="d-flex flex-column w-50 me-3">
                    <input class="form-control cost" type="number" min="0" placeholder="Cost" value="${payment.cid_sop_cost}" required>
                </div>
                <div class="d-flex flex-column w-50  me-3">
                    <select class="form-control payment_method" required>
                        <option value="cash" ${payment.cid_sop_payment_method === 'cash' ? 'selected' : ''}>Cash</option>
                        <option value="gcash" ${payment.cid_sop_payment_method === 'gcash' ? 'selected' : ''}>Gcash</option>
                        <option value="credit" ${payment.cid_sop_payment_method === 'credit' ? 'selected' : ''}>Credit Card</option>
                    </select>
                </div>
                <div class="d-flex flex-column w-100 me-3">
                    <input class="form-control ref_number" type="text" placeholder="Ref #" value="${payment.cid_sop_ref_no}">
                </div>
                <div class="d-flex flex-column w-50 me-3">
                    <input class="form-control discount" type="number" min="0" max="100" placeholder="Discount (%)" value="${payment.cid_sop_discount}">
                </div>
                <div class="d-flex flex-column w-50 me-3">
                    <input class="form-control" type="number" placeholder="Discounted Price" value="${payment.cid_sop_discounted_price}">
                </div>
                <div class="d-flex flex-column w-50 me-3">
                    <input class="form-check-input paid mx-auto my-auto" type="checkbox" value="${payment.cid_sop_paid ? 1 : 0}" ${payment.cid_sop_paid == 1 ? 'checked' : ''}>
                </div>
                <div class="d-flex flex-row w-100">
                    <button class="form-control btn-primary save_btn me-2" data-type="sop_data_save">Save</button>
                    <button class="form-control btn-danger delete_btn me-2" data-type="sop_data_delete">Delete</button>
                </div>
            </div>
            `;
        sop_data_container.append(sop_data_HTML);
    });
}

function sor_save(type) {
    var sor_content = $('#sor_ta').val();
    var sor_donor = $('#sor_donor').val();
    var sor_we = $('#sor_we').val();
    var sor_du = $('#sor_du').val();
    var sor_sord = $('#sor_sord').val();
    var sor_eord = $('#sor_eord').val();
    var warranty_end = new Date(sor_donor);
    if (sor_du === 'day') {
        warranty_end.setDate(warranty_end.getDate() + parseInt(sor_we));
    } else if (sor_du === 'week') {
        warranty_end.setDate(warranty_end.getDate() + (parseInt(sor_we) * 7));
    } else if (sor_du === 'year') {
        warranty_end.setFullYear(warranty_end.getFullYear() + parseInt(sor_we));
    }
    var formatted_warranty_end = warranty_end.toISOString().slice(0, 10);
    var dataToSend = {
        cid_number: cid_number,
        type: type,
        sor_content: sor_content,
        sor_donor: sor_donor,
        sor_we: sor_we,
        sor_du: sor_du,
        sor_sord: sor_sord,
        sor_eord: sor_eord,
        warranty_end: formatted_warranty_end
    };

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
        sop_save(type, this);
    });

    $('#sop_data_container').on('click', '.save_btn', function () {
        var type = $(this).data('type');
        sop_save(type, this);
    });

    $('#sop_data_container').on('click', '.delete_btn', function () {
        var type = $(this).data('type');
        sop_delete(type, this);
    });

    $('#sop_container').on('change', '.payment_method', function () {
        var $refNumberInput = $(this).closest('.sop_group').find('.ref_number');
        if ($(this).val() !== 'cash') {
            $refNumberInput.prop('required', true);
        } else {
            $refNumberInput.prop('required', false);
        }
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
    var sop_container = $('#sop_container');
    var sop_form_HTML =
        `
    <div class="d-flex flex-row w-100 mb-3 sop_group">
        <div class="d-flex flex-column w-100 me-3">
            <input class="form-control service" type="text" placeholder="Service" required>
        </div>
        <div class="d-flex flex-column w-50  me-3">
            <input class="form-control cost" type="number" min="0" placeholder="Cost" required>
        </div>
        <div class="d-flex flex-column w-50  me-3">
            <select class="form-control payment_method" required>
                <option value="cash">Cash</option>
                <option value="gcash">Gcash</option>
                <option value="credit">Credit Card</option>
            </select>
        </div>
        <div class="d-flex flex-column w-100 me-3">
            <input class="form-control ref_number" type="text" placeholder="Ref #">
        </div>
        <div class="d-flex flex-column w-50 me-3">
            <input class="form-control discount" type="number" min="0" max="100" placeholder="Discount (%)">
        </div>
        <div class="d-flex flex-column w-50 me-3">
            <input class="form-control" type="number" placeholder="Discounted Price" disabled>
        </div>
        <div class="d-flex flex-column w-50 me-3">
            <input class="form-check-input paid mx-auto my-auto" type="checkbox" value="">
        </div>
        <div class="d-flex flex-row w-100">
            <button class="form-control btn-primary save_btn me-2" data-type="sop_data_save">Save</button>
        </div>
    </div>
    `
    sop_container.append(sop_form_HTML);
}

function sop_save(type, clickedButton) {
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
    var service = $sopGroup.find('.service').val();
    var cost = parseFloat($sopGroup.find('.cost').val());
    var payment_method = $sopGroup.find('.payment_method').val();
    var ref_number = $sopGroup.find('.ref_number').val();
    var discount = parseFloat($sopGroup.find('.discount').val());
    var discounted_price = cost - (cost * (discount / 100));
    var paid = $sopGroup.find('.paid').is(":checked") ? "1" : "0";
    var dataToSend = {
        cid_number: cid_number,
        type: type,
        service: service,
        cost: cost,
        discounted_price: discounted_price,
        payment_method: payment_method,
        ref_number: ref_number,
        discount: discount,
        paid: paid
    };

    console.log("" + dataToSend.paid);
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

function alert_display(data) {
    var alert_container = $('.alert_container');
    alert_container.empty();
    var alert_HTML =
        `
    <div class="alert alert-success" role="alert">
    ${data}
    </div>
    `
    alert_container.append(alert_HTML);
    setTimeout(function () {
        $('.alert').fadeOut('slow');
    }, 3000);
}