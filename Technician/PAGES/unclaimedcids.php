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

    <title>Technician Page</title>
</head>

<body>
    <div>
        <?php include "technician_header.php"; ?>
        <div class="content_container">
            <div id="table_container">
                <div class="card">
                    <p class="title">Unclaimed CIDs</p>
                    <div class="card-body">
                        <table id="cids_table" data-type="unclaimed" class="table table-striped table-hover"
                            width="100%">
                            <thead>
                                <tr>
                                    <th>CID</th>
                                    <th>Client</th>
                                    <th>Unit Details</th>
                                    <th>Remarks</th>
                                    <th>Unit History</th>
                                    <th>Status</th>
                                    <th>Date Added</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="u_cid_modal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false"
        role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="cid_number_m">

                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center" id="u_cid_modal_body"></div>
                <div class="alert_container">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        Close
                    </button>
                    <button type="button" class="btn btn-primary claim_btn" data-type="cid_claim">Claim CID</button>
                </div>
            </div>
        </div>
    </div>

    <?php include "logout.php"; ?>
    <script src="../JS/technician_table.js"></script>
    <script src="../JS/unclaimedcids.js"></script>
</body>

</html>