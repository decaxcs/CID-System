<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payments</title>

    <!-- Header -->
    <?php include "../../header.php"; ?>

    <!-- CSS -->
    <link rel="stylesheet" href="../../style.css">
    <link rel="stylesheet" href="../CSS/super_admin.css">
    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

</head>

<body>
    <div>
        <?php include "super_admin_header.php"; ?>

        <div class="container">
            <p class="page_title mb-2">Payments</p>
            <div id="payments_container">

            </div>
            <br>
        </div>
    </div>



    <div class="modal fade" id="payment_add_modal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalTitleId">Add Service/Product</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Name:</p>
                    <input class="form-control new_payment" type="text">

                    <p class="mt-2">Convenience Fee (%):</p>
                    <input class="form-control new_cf" type="number" min="0" max="100" id="cf-input">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="save-new-payment">Save</button>
                </div>
            </div>
        </div>
    </div>

    <?php include "logout.php"; ?>
    <script src="../JS/get_data.js"></script>

    <script>
        $(document).ready(function() {
            get_data('payments');

            $(document).on('click', '#save_vat', function() {
                save_vat('save_vat', this);
            });

            $('#save-new-payment').click(function() {
                save_payment('add_payment', this);
            });

            $(document).on('click', '#update-mop', function() {
                save_payment('update_payment', this);
            });

            $(document).on('click', '#delete-mop', function() {
                save_payment('delete_payment', this);
            });

            // Add input validation for VAT and Convenience Fee
            $('#payments_container').on('input', '#vat-input', function() {
                validateInput(this);
            });

            $('#payments_container').on('input', '.cs_mop_fee', function() {
                validateInput(this);
            });

            $('#cf-input').on('input', function() {
                validateInput(this);
            });
        });

        function populate_payments(data) {
            console.log(data);
            let vat_value = data.vat_value[0].cs_settings_value;
            let vat_name = data.vat_value[0].cs_settings_unit;
            let mop_list = data.mop_list;

            console.log(mop_list);

            let payments_container = $('#payments_container')
            payments_container.empty();

            let mop_list_HTML = ``;

            mop_list.forEach(function(mop) {
                mop_list_HTML += `
                <div class="row mt-2 mop_group">
                    <input type="hidden" value="${mop.cs_mop_id }" class="cs_mop_id" name="">
                    <div class="col-4">
                        <input type="text" value="${mop.cs_mop_name}" class="form-control cs_mop_name">
                    </div>
                    <div class="col-4">
                        <input type="number" value="${mop.cs_mop_fee}" min="0" max="100" class="form-control cs_mop_fee">
                    </div>
                    <div class="col-4 d-flex flex-row">
                        <button type="button" class="btn btn-primary me-2" id="update-mop">Save</button>
                        <button type="button" class="btn btn-danger" id="delete-mop">Delete</button>
                    </div>
                </div>
                `;
            });

            let payments_HTML = `
            <div class="d-flex flex-column">
                <div class="row">
                    <div class="col-4">
                        <p class="fw-bold">Tax Name:</p>
                    </div>
                    <div class="col-4">
                        <p class="fw-bold">Tax value(%):</p>
                    </div>
                    <div class="col-4">
                        <p class="fw-bold">Actions</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4">
                        <input id="vat-namr" class="form-control vat_name" value="${vat_name}" type="text">
                    </div>
                    <div class="col-4">
                        <input id="vat-input" class="form-control vat" value="${vat_value}" min="0" max="100" type="number">
                    </div>
                    <div class="col-4">
                        <button type="button" class="btn btn-primary" id="save_vat">Save</button>
                    </div>
                </div>
                <p class="fw-bold mt-2">Payment Methods</p>
                <button type="button" class="btn btn-success align-self-start mb-2" data-bs-toggle="modal" data-bs-target="#payment_add_modal">Add Method</button>
            </div>

            <div>
                <div class="row">
                    <div class="col-4">
                        <p class="fw-bold">Mode of Payment Name:</p>
                    </div>
                    <div class="col-4">
                        <p class="fw-bold">Convinience Fee (%):</p>
                    </div>
                    <div class="col-4">
                        <p class="fw-bold">Actions</p>
                    </div>
                </div>
                ${mop_list_HTML}
            </div>
            
            `;

            payments_container.append(payments_HTML);
        }

        function validateInput(inputElement) {
            let value = $(inputElement).val();
            let min = parseInt($(inputElement).attr('min'));
            let max = parseInt($(inputElement).attr('max'));

            if (value < min) {
                $(inputElement).val(min);
            } else if (value > max) {
                $(inputElement).val(max);
            }
        }

        function save_vat(type, clickedButton) {
            validateInput($('#vat-input')); // Ensure value is within range before saving

            var data = {
                type: type,
                vat_name: $('.vat_name').val(),
                vat: $('.vat').val()
            };

            console.log(data)

            save_data(data, type);
        }

        function save_payment(type, clickedButton) {
            var mop_group = $(clickedButton).closest('.mop_group');
            var data = {
                type: type,
            };

            if (type === 'add_payment') {
                data.new_payment = $('.new_payment').val();
                data.new_cf = $('.new_cf').val();
            } else if (type === 'update_payment') {
                data.cs_mop_id = mop_group.find('.cs_mop_id').val();
                data.cs_mop_name = mop_group.find('.cs_mop_name').val();
                data.cs_mop_fee = mop_group.find('.cs_mop_fee').val();
            } else if (type === 'delete_payment') {
                data.cs_mop_id = mop_group.find('.cs_mop_id').val();
            }

            console.log(data)

            save_data(data, type);
        }
    </script>
</body>

</html>