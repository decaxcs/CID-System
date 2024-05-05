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
                <p class="mb-3" >CID: <span id="cid_number_text"></span></p>
            </div>
            <nav>
                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                    <button class="nav-link active" id="nav-info-tab" data-bs-toggle="tab" data-bs-target="#nav-info"
                        type="button" role="tab" aria-controls="nav-info" aria-selected="true">Info</button>

                    <button class="nav-link" id="nav-sor-tab" data-bs-toggle="tab" data-bs-target="#nav-sor"
                        type="button" role="tab" aria-controls="nav-sor" aria-selected="false">Summary of
                        Repairs</button>

                    <button class="nav-link" id="nav-reco-tab" data-bs-toggle="tab" data-bs-target="#nav-reco"
                        type="button" role="tab" aria-controls="nav-reco" aria-selected="false">Recommendations</button>

                    <button class="nav-link" id="nav-sop-tab" data-bs-toggle="tab" data-bs-target="#nav-sop"
                        type="button" role="tab" aria-controls="nav-sop" aria-selected="false">Summary of
                        Payments</button>
                </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
            <?php include "cidsedittabcontent.php"; ?>
            </div>
        </div>
    </div>
    <script>
        document.getElementById('backButton').addEventListener('click', function () {
            history.back();
        });
    </script>
</body>

</html>