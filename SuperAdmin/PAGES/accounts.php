<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accounts</title>

    <!-- Header -->
    <?php include "../../header.php"; ?>

    <!-- CSS -->
    <link rel="stylesheet" href="../../style.css">
    <link rel="stylesheet" href="../CSS/super_admin.css">

    
    <!-- Plotly -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
</head>

<body>
    <div>
        <?php include "super_admin_header.php"; ?>

        <div class="container">
            <p class="page_title mb-2">Accounts</p>
            <button type="button" class="btn btn-success align-self-start mb-2" data-bs-toggle="modal"
                data-bs-target="#account_add_modal">Add Account</button>
            <div id="accounts_container">

            </div>
            <br>
        </div>

        <div class="modal fade" id="account_add_modal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false"
            role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalTitleId">Add Account</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>Name:</p>
                        <input class="form-control new_csu_name" type="text">
                        <p>Permission:</p>
                        <select class="form-control new_csu_permission" name="" id="">
                            <option value="Frontdesk">Frontdesk</option>
                            <option value="Technician">Technician</option>
                            <option value="Super Admin">Super Admin</option>
                        </select>
                        <p>Username:</p>
                        <input class="form-control new_csu_username" type="text">
                        <p>Password:</p>
                        <input class="form-control new_csu_password" type="text">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="add-account">Save</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="account_view_modal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false"
            role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-xl" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalTitleId">Account Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div id="view_account_container">

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>


        <?php include "logout.php"; ?>
        <script src="../JS/get_data.js"></script>

        <script>
            $(document).ready(function () {
                get_data('accounts');
            });
        </script>


</body>

</html>