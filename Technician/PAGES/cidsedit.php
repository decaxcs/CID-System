<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Header -->
    <?php include "../../header.php"; ?>

    <!-- CSS -->
    <link rel="stylesheet" href="../../style.css">
    <link rel="stylesheet" href="../CSS/technician.css">
    <link rel="stylesheet" href="../CSS/header_back.css">

    <title>Technician Page</title>
</head>

<body>
    <div>
        <div id="header">
            <iconify-icon id="backButton" class="back_icon ms-3" icon="mingcute:back-fill"></iconify-icon>
        </div>
        <div class="content_container">
            <div>
                <p class="mb-3">CID: <span id="cid_number_text"></span></p>
            </div>
            <nav>
                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                    <button class="nav-link active" id="nav-info-tab" data-bs-toggle="tab" data-bs-target="#nav-info" type="button" role="tab" aria-controls="nav-info" aria-selected="true">Info</button>

                    <button class="nav-link" id="nav-sor-tab" data-bs-toggle="tab" data-bs-target="#nav-sor" type="button" role="tab" aria-controls="nav-sor" aria-selected="false">Summary of
                        Repairs</button>

                    <button class="nav-link" id="nav-reco-tab" data-bs-toggle="tab" data-bs-target="#nav-reco" type="button" role="tab" aria-controls="nav-reco" aria-selected="false">Recommendations</button>

                    <button class="nav-link" id="nav-sop-tab" data-bs-toggle="tab" data-bs-target="#nav-sop" type="button" role="tab" aria-controls="nav-sop" aria-selected="false">Summary of
                        Payments</button>
                </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
                <?php include "cidsedittabcontent.php"; ?>

            </div>
        </div>
    </div>
    <div class="modal fade" id="u_tech_opt_modal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">
                        Warning: Technician Options
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center" id="u_tech_opt_modal_body">
                    <p>Are you sure you want to withdraw from the project?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        Close
                    </button>
                    <button type="button" class="btn btn-primary save_btn" data-type="opt_tech">Save</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="u_tech_edit_modal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">
                        Add Technician
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center" id="u_tech_opt_modal_body">
                    <p>Add Technician:</p>
                    <select class="select_technician multiple_select form-control" id="technician" multiple="multiple" required>

                    </select>
                    <div class="alert_container mt-2">

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        Close
                    </button>
                    <button type="button" class="btn btn-primary save_btn" data-type="save_tech">Save</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="add_payment_modal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">
                        Add Payment
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center" id="add_payment_container">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        Close
                    </button>
                    <button type="button" class="btn btn-primary add_payment" data-type="add_payment">Save</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="view_payment_modal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">
                        View Payments
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center" id="view_payment_container">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        Close
                    </button>
                </div>
            </div>
        </div>
    </div>
    <script>
        document.getElementById('backButton').addEventListener('click', function() {
            history.back();
        });
    </script>
    <script src="../JS/cidsedittabcontent.js"></script>
</body>

</html>