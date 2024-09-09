<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CMS</title>

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
            <p class="page_title mb-2">Content Management</p>
            <div id="cms_container">


            </div>
            <br>
        </div>
        <?php include "logout.php"; ?>
        <script src="../JS/get_data.js"></script>

        <script>
            $(document).ready(function() {
                get_data('cms');
            });

            function populate_cms(cms) {
                let cms_data = cms.cms[0];
                console.log(cms_data);
                let cms_container = $('#cms_container');
                cms_container.empty();

                var cms_HTML = `
                <div class="sop_group">
                    <p class="mt-2">Company Name:</p>
                    <input type="text" name="company_name" value="${cms_data.cms_company_name}" class="form-control company_name" id="company_name">

                    <p class="mt-2">Email:</p>
                    <input type="email" name="email" value="${cms_data.cms_email}" class="form-control email" id="email">

                    <p class="mt-2">Address:</p>
                    <textarea name="address"  class="form-control address" id="address" cols="30" rows="3">${cms_data.cms_address}</textarea>

                    <p class="mt-2">Cellphone #1:</p>
                    <input type="text" name="cellphone1" value="${cms_data.cms_cp1}" class="form-control cp1" id="cellphone1">

                    <p class="mt-2">Cellphone #2:</p>
                    <input type="text" name="cellphone2" value="${cms_data.cms_cp2}" class="form-control cp2" id="cellphone2">

                    <p class="mt-2">Cellphone #3:</p>
                    <input type="text" name="cellphone3" value="${cms_data.cms_cp3}" class="form-control cp3" id="cellphone3">

                    <p class="mt-2">Acknowledgement:</p>
                    <textarea name="acknowledgement"  class="form-control acknowledgement" id="acknowledgement" cols="30" rows="3">${cms_data.cms_acknowledgement}</textarea>

                    <p class="mt-2">Disclaimer:</p>
                    <textarea name="disclaimer"  class="form-control disclaimer" id="disclaimer" cols="30" rows="3">${cms_data.cms_disclaimer}</textarea>

                    <button class="btn btn-primary mt-3" id="save_cms">Save</button>
                </div>
                `;
                cms_container.append(cms_HTML);
            }
        </script>
</body>

</html>