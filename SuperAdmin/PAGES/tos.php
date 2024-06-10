<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terms of Service</title>

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
            <p class="page_title mb-2">Terms of Service</p>
            <button type="button" class="btn btn-success align-self-start mb-2" data-bs-toggle="modal"
                data-bs-target="#tos_add_modal">Add ToS</button>
            <div id="tos_container">

            </div>
            <br>
        </div>
    </div>
    <div class="modal fade" id="tos_add_modal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false"
        role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalTitleId">Add ToS</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Content:</p>
                    <textarea class="form-control mb-1 new_tos_content" rows="4" cols="50"></textarea>
                    <p>Sequence:</p>
                    <input class="form-control new_tos_sequence" type="number">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="save-new-tos">Save</button>
                </div>
            </div>
        </div>
    </div>


    <?php include "logout.php"; ?>
    <script src="../JS/get_data.js"></script>

    <script>
        $(document).ready(function () {
            get_data('tos');
        });
    </script>


</body>

</html>