<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Header -->
    <?php include "../../header.php"; ?>

    <!-- CSS -->
    <link rel="stylesheet" href="../../style.css">
    <link rel="stylesheet" href="../CSS/front_desk.css">

    <title>Frontdesk Page</title>
</head>

<body>
    <div id="front_desk_page">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#add_CID">
            <iconify-icon icon="ic:round-plus"></iconify-icon>
        </button>
        <p id="p1">
            TECHYDAVID I.T. SOLUTIONS
        </p>
        <p id="p2">
            TECHYDAVID I.T. SOLUTIONS
        </p>
</div>

    <!-- Add CID Modal -->
    <div class="modal fade" id="add_CID" tabindex="-1" aria-labelledby="add_CID_label" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="add_CID_label">Terms of Service</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                        <label class="form-check-label" for="flexCheckDefault">

                        </label>
                    </div>

                    <label class="form-check-label" for="cid_client_full_name">
                        CLIENT FULL NAME:
                    </label>
                    <input class="form-control" id="cid_client_full_name" type="text">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
</body>

</html>