<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!-- Header -->
    <?php include "../header.php"; ?>

    <!-- CSS -->
    <link rel="stylesheet" href="../style.css">
    <link rel="stylesheet" href="../Frontdesk/CSS/create_cid.css">
    <link rel="stylesheet" href="../Frontdesk/CSS/frontdesk.css">

    <style>
        .create_cid_page {
            overflow-y: hidden;
            padding: 5%;
            background-color: #EFF5F9;
            text-align: justify;
        }

        .custom-select {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background-color: #f8f9fa;
            border: 1px solid #ced4da;
            border-radius: 5px;
            padding: 8px 12px;
            font-size: 16px;
            cursor: pointer;
        }

        .custom-select:focus {
            outline: none;
            border-color: #4d94ff;
        }

        #client_name {
            width: 300px !important;
        }

        #client_email {
            width: 280px !important;
        }

        #contact_number {
            border: none;
            border-bottom: 1px solid black;
        }

        #platinum_number {
            border: none;
            border-bottom: 1px solid black;
        }


        #Technician {
            justify-content: space-between;
        }

        .disclaimer-row {
            font-family: 'Poppins', sans-serif;
            margin-bottom: 9%;
            font-size: 16px;
            font-weight: 600;
            font-style: italic;
            text-decoration: underline;
            color: #000000;
            line-height: 24px;
        }

        .row-of-information {
            margin-bottom: 9%;
        }

        input[type="text"] {
            border: none;
            border-bottom: 1px solid black;
            outline: none;
        }

        input[type="checkbox"]:checked {
            background-color: #22C997;

        }


        .form-check-label::before {
            border-color: #22C997;
        }


        .form-check-input[type="checkbox"]:hover {
            background-color: #1EAD87;
        }


        .form-check-label:hover::before {
            border-color: #1EAD87;
        }

        input[type="radio"]:checked {
            background-color: #22C997;
        }

        .form-check-tos-comletion {
            margin-bottom: 4%;
        }

        .form-check-nested {
            margin-left: 90px;
        }

        .form-check {
            margin-bottom: 10px;
        }

        .form-check-content {
            display: flex;
            align-items: center;
        }


        .number {
            margin-right: 10px;
            flex-shrink: 0;
            width: 30px;
        }

        .modal-header {
            border-bottom: none;
            padding-bottom: 0;
        }

        .modal-body {
            padding: 7%;
            margin-bottom: 3%;
            text-align: justify;
        }

        .add_cid_footer {
            display: flex;
            align-items: center;
            justify-content: space-around;
            margin: 0 auto;
            border-top: none;
            bottom: 0;
            left: 0;
            width: 50%;
            padding: 50px 15px 15px 15px;
            background-image: linear-gradient(to bottom, transparent, white);
            z-index: 1041;

        }

        .add_cid_footer button {
            margin: 0 5px;
            /* Puwang sa kaliwa at kanan ng bawat button */
        }

        .form-check {
            margin-bottom: 14px;
        }

        .tos_span {
            font-weight: 700;
        }

        .btn_cancel {
            width: 200px;
            background-color: #fff;
            color: #22C997;
            border-color: #22C997;
        }

        .btn_cancel:hover {
            background-color: #22C997;
            color: #fff;
            border-color: #22C997;
        }

        .btn_Cancel_Slip {
            width: 150px;
            background-color: #fff;
            color: #22C997;
            border-color: #22C997;
        }

        .btn_Cancel_Slip:hover {
            background-color: #22C997;
            color: #fff;
            border-color: #22C997;
        }

        .btn_Create {
            width: 150px;
        }

        .btn_save {
            width: 200px;
        }

        #claiming_slip {
            width: 150px;
        }

        #add_CID_label {
            margin-left: 6%;
            font-weight: 700;
            font-size: 3em;
        }

        ::-webkit-scrollbar {
            width: 7px;
        }

        ::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 10px;
        }

        ::-webkit-scrollbar-thumb {
            background: #345AFD;
            border-radius: 10px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: #345AFD;
        }

        #dropdown {
            display: flex;
            flex-direction: row;

        }

        .tos_terms_of_service {
            display: block;
            margin-bottom: 50px;
            font-size: 52px;
            font-family: 'Poppins', sans-serif;
            font-weight: 700px;
        }

        #create_cid_container {
            margin: 0% 15%;
        }

        .creade_cid_body {
            padding: 5% 10%;
        }

        #signature_input #signature-pad {
            border: 1px solid #000;
        }

        #signature_display:hover {
            cursor: pointer;
        }

        #signature_display {
            height: 200px;
            width: 500px;
        }

        .signature-pad--body {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .signature_body {
            padding: 1%;
            margin: 0%;
        }

        #signature_display {
            background-color: white;
        }

        * {
            box-sizing: border-box;
        }

        a {
            text-decoration: none;
            color: #379937;
        }


        .dropdown {
            position: flex;
            font-size: 14px;
            color: #333;
            border-radius: 20%;

            .dropdown-list {

                background: #fff;
                position: flex;

                left: 2px;
                right: 2px;
                box-shadow: 0 1px 2px 1px rgba(0, 0, 0, .15);
                transform-origin: 50% 0;
                transform: scale(1, 0);
                transition: transform .15s ease-in-out .15s;
                max-height: 30vh;

                overflow-y: scroll;
            }

            .dropdown-option {
                display: flex;
                padding: 8px 12px;
                opacity: 0;
                transition: opacity .15s ease-in-out;
            }

            .dropdown-label {
                display: block;
                height: 30px;
                background: #fff;
                border: 1px solid #ccc;
                padding: 6px 12px;
                line-height: 1;
                cursor: pointer;
                width: 150px;

                &:before {
                    content: '▼';
                    float: right;
                }
            }

            &.on {
                .dropdown-list {
                    transform: scale(1, 1);
                    transition-delay: 0s;

                    .dropdown-option {
                        opacity: 1;
                        transition-delay: .2s;
                    }
                }

                .dropdown-label:before {
                    content: '▲';
                }
            }

            [type="checkbox"] {
                position: relative;
                top: -1px;
                margin-right: 4px;
            }
        }
    </style>
</head>

<body>

    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#newModal">
        Launch demo modal
    </button>
    <!-- Bagong Modal -->
    <div class="modal fade" id="newModal" tabindex="-1" aria-labelledby="newModalLabel" aria-hidden="true"
        data-bs-backdrop="static">
        <div class="modal-dialog modal-dialog-scrollable modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="modal-title" id="newModalLabel"></div>
                </div>
                <!-- Bagong div sa loob ng modal body -->
                <div class="modal-body">
                    <div class="row">
                        <div class="col">
                            <div class="row mb-4 ">
                                <div class="col">
                                    <p class="tos_span">CID: <span class="tos_span" id="cid_number"> 20241-3</span></p>
                                </div>
                                <!-- <div class="col ms-5">
                            </div> -->
                            </div>
                        </div>
                    </div>
                    <div class="row mb-5">
                        <!-- Dagdag ng margin sa ibaba -->
                        <div class="col my-auto">
                            <div class="unit_details">
                                <div class="form-group">
                                    <label for="unit_details"><span class="tos_span ">Unit Details/Brand
                                            Models:</span></label>
                                    <textarea class="form-control required" id="unit_details" rows="3"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row mb-5">
                        <!-- Dagdag ng margin sa ibaba -->
                        <div class="col my-auto">
                            <div class="remarks">
                                <div class="form-group">
                                    <label for="remarks"><span class="tos_span ">Remarks:(Scratches,Color,lcd
                                            etc)</span></label>
                                    <textarea class="form-control required" id="remarks" rows="5"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mb-3" id="dropdown">
                        <div class="dropdown" data-control="checkbox-dropdown">
                            <label class="dropdown-label">Technician</label>
                            <div class="dropdown-list" id="dropdown_technician">
                                <!-- <a href="#" data-toggle="check-all" class="dropdown-option">Check All</a> -->
                                <label class="dropdown-option">
                                    <input type="checkbox" name="dropdown-group" value="John Doe" />
                                    John Doe
                                </label>
                                <label class="dropdown-option">
                                    <input type="checkbox" name="dropdown-group" value="Jane Doe" />
                                    Jane Doe
                                </label>
                                <label class="dropdown-option">
                                    <input type="checkbox" name="dropdown-group" value="Alex Smith" />
                                    Alex Smith
                                </label>
                                <label class="dropdown-option">
                                    <input type="checkbox" name="dropdown-group" value="Emily Jones" />
                                    Emily Jones
                                </label>
                                <!-- Add other technicians as needed -->
                            </div>
                        </div>
                        <div class="ms-5 mb-3">
                            <p> <span class="tos_span ">Computer Service:</span>
                                <select id="computer_service" name="computer_service"
                                    class="custom-select select_services">
                                </select>
                            </p>
                        </div>
                    </div>


                </div>
                <div class="modal-footer justify-content-end" id="ads_slip">
                    <button type="button" class="btn btn-secondar btn_Cancel_Slip"
                        data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary btn_Create" id="create_button">Create</button>
                </div>
            </div>
        </div>
    </div>
    </div>
</body>

</html>

<script>
    (function ($) {
        var CheckboxDropdown = function (el) {
            var _this = this;
            this.isOpen = false;
            this.areAllChecked = false;
            this.$el = $(el);
            this.$label = this.$el.find('.dropdown-label');
            this.$checkAll = this.$el.find('[data-toggle="check-all"]').first();
            this.$inputs = this.$el.find('[type="checkbox"]');

            this.onCheckBox();

            this.$label.on('click', function (e) {
                e.preventDefault();
                _this.toggleOpen();
            });

            this.$checkAll.on('click', function (e) {
                e.preventDefault();
                _this.onCheckAll();
            });

            this.$inputs.on('change', function (e) {
                _this.onCheckBox();
            });
        };

        CheckboxDropdown.prototype.onCheckBox = function () {
            this.updateStatus();
        };

        CheckboxDropdown.prototype.updateStatus = function () {
            var checked = this.$el.find(':checked');

            this.areAllChecked = false;
            this.$checkAll.html('Check All');

            if (checked.length <= 0) {
                this.$label.html('Select Options');
            } else if (checked.length === 1) {
                this.$label.html(checked.parent('label').text());
            } else if (checked.length === this.$inputs.length) {
                this.$label.html('All Selected');
                this.areAllChecked = true;
                this.$checkAll.html('Uncheck All');
            } else {
                this.$label.html(checked.length + ' Selected');
            }
        };

        CheckboxDropdown.prototype.onCheckAll = function (checkAll) {
            if (!this.areAllChecked || checkAll) {
                this.areAllChecked = true;
                this.$checkAll.html('Uncheck All');
                this.$inputs.prop('checked', true);
            } else {
                this.areAllChecked = false;
                this.$checkAll.html('Check All');
                this.$inputs.prop('checked', false);
            }

            this.updateStatus();
        };

        CheckboxDropdown.prototype.toggleOpen = function (forceOpen) {
            var _this = this;

            if (!this.isOpen || forceOpen) {
                this.isOpen = true;
                this.$el.addClass('on');
                $(document).on('click', function (e) {
                    if (!$(e.target).closest('[data-control]').length) {
                        _this.toggleOpen();
                    }
                });
            } else {
                this.isOpen = false;
                this.$el.removeClass('on');
                $(document).off('click');
            }
        };

        var checkboxesDropdowns = document.querySelectorAll('[data-control="checkbox-dropdown"]');
        for (var i = 0, length = checkboxesDropdowns.length; i < length; i++) {
            new CheckboxDropdown(checkboxesDropdowns[i]);
        }
    })(jQuery);


    (function ($) {
        var CheckboxDropdown = function (el) {
            var _this = this;
            this.isOpen = false;
            this.areAllChecked = false;
            this.$el = $(el);
            this.$label = this.$el.find('.dropdown-label');
            this.$checkAll = this.$el.find('[data-toggle="check-all"]').first();
            this.$inputs = this.$el.find('[type="checkbox"]');

            this.onCheckBox();

            this.$label.on('click', function (e) {
                e.preventDefault();
                _this.toggleOpen();
            });

            this.$checkAll.on('click', function (e) {
                e.preventDefault();
                _this.onCheckAll();
            });

            this.$inputs.on('change', function (e) {
                _this.onCheckBox();
            });
        };

        CheckboxDropdown.prototype.onCheckBox = function () {
            this.updateStatus();
        };

        CheckboxDropdown.prototype.updateStatus = function () {
            var checked = this.$el.find(':checked');

            this.areAllChecked = false;
            this.$checkAll.html('Check All');

            if (checked.length <= 0) {
                this.$label.html('Select Options');
            } else if (checked.length === 1) {
                this.$label.html(checked.parent('label').text());
            } else if (checked.length === this.$inputs.length) {
                this.$label.html('All Selected');
                this.areAllChecked = true;
                this.$checkAll.html('Uncheck All');
            } else {
                this.$label.html(checked.length + ' Selected');
            }
        };

        CheckboxDropdown.prototype.onCheckAll = function (checkAll) {
            if (!this.areAllChecked || checkAll) {
                this.areAllChecked = true;
                this.$checkAll.html('Uncheck All');
                this.$inputs.prop('checked', true);
            } else {
                this.areAllChecked = false;
                this.$checkAll.html('Check All');
                this.$inputs.prop('checked', false);
            }

            this.updateStatus();
        };

        CheckboxDropdown.prototype.toggleOpen = function (forceOpen) {
            var _this = this;

            if (!this.isOpen || forceOpen) {
                this.isOpen = true;
                this.$el.addClass('on');
                $(document).on('click', function (e) {
                    if (!$(e.target).closest('[data-control]').length) {
                        _this.toggleOpen();
                    }
                });
            } else {
                this.isOpen = false;
                this.$el.removeClass('on');
                $(document).off('click');
            }
        };

        var checkboxesDropdowns = document.querySelectorAll('[data-control="checkbox-dropdown"]');
        for (var i = 0, length = checkboxesDropdowns.length; i < length; i++) {
            new CheckboxDropdown(checkboxesDropdowns[i]);
        }
    })(jQuery);

    (function ($) {
        var CheckboxDropdown = function (el) {
            var _this = this;
            this.isOpen = false;
            this.areAllChecked = false;
            this.$el = $(el);
            this.$label = this.$el.find('.dropdown-label');
            this.$checkAll = this.$el.find('[data-toggle="check-all"]').first();
            this.$inputs = this.$el.find('[type="checkbox"]');

            this.onCheckBox();

            this.$label.on('click', function (e) {
                e.preventDefault();
                _this.toggleOpen();
            });

            this.$checkAll.on('click', function (e) {
                e.preventDefault();
                _this.onCheckAll();
            });

            this.$inputs.on('change', function (e) {
                _this.onCheckBox();
            });
        };

        CheckboxDropdown.prototype.onCheckBox = function () {
            this.updateStatus();
        };

        CheckboxDropdown.prototype.updateStatus = function () {
            var checked = this.$el.find(':checked');

            this.areAllChecked = false;
            this.$checkAll.html('Check All');

            if (checked.length <= 0) {
                this.$label.html('Technician');
            } else if (checked.length === 1) {
                this.$label.html(checked.parent('label').text());
            } else if (checked.length === this.$inputs.length) {
                this.$label.html('All Selected');
                this.areAllChecked = true;
                this.$checkAll.html('Uncheck All');
            } else {
                this.$label.html(checked.length + ' Selected');
            }
        };

        CheckboxDropdown.prototype.onCheckAll = function (checkAll) {
            if (!this.areAllChecked || checkAll) {
                this.areAllChecked = true;
                this.$checkAll.html('Uncheck All');
                this.$inputs.prop('checked', true);
            } else {
                this.areAllChecked = false;
                this.$checkAll.html('Check All');
                this.$inputs.prop('checked', false);
            }

            this.updateStatus();
        };

        CheckboxDropdown.prototype.toggleOpen = function (forceOpen) {
            var _this = this;

            if (!this.isOpen || forceOpen) {
                this.isOpen = true;
                this.$el.addClass('on');
                $(document).on('click', function (e) {
                    if (!$(e.target).closest('[data-control]').length) {
                        _this.toggleOpen();
                    }
                });
            } else {
                this.isOpen = false;
                this.$el.removeClass('on');
                $(document).off('click');
            }
        };

        var checkboxesDropdowns = document.querySelectorAll('[data-control="checkbox-dropdown"]');
        for (var i = 0, length = checkboxesDropdowns.length; i < length; i++) {
            new CheckboxDropdown(checkboxesDropdowns[i]);
        }
    })(jQuery);
</script>


</body>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>