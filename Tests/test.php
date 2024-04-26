<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Claiming Slip Modal</title>

    <?php include "../header.php"; ?>

    <!-- CSS -->
    <link rel="stylesheet" href="../style.css">
    <link rel="stylesheet" href="../Frontdesk/CSS/create_cid.css">
    <link rel="stylesheet" href="../Frontdesk/CSS/claiming_slip_modal.css">
    <link rel="stylesheet" href="../Frontdesk/CSS/cid.css">
    <style>
        .claiming_slip_header_1{
    display: flex;
    justify-content: center;
    text-align: center;
    font-size: 30px;
    font-weight: bold;
    color: red;
}

.claiming_text_body{
    font-size: 20px;
    color: black;
    opacity: 1px;
}

.slip_line{
    width: 100%;
    height: 3px;
    background-color: black;
    margin: 5px 0;
}

    </style>
</head>

<body>

    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#claiming_slip_modal">
        Launch demo modal
    </button>

    <!-- Modal -->
    <div class="modal fade" id="claiming_slip_modal" tabindex="-1" aria-labelledby="claiming_slip_modal" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="claiming_slip_modalLabel"></h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row mb-3">
                        <div class="claiming_slip_header_1">Claiming Slip #<span>1283913</p></div>
                    </div>
                    <div class="row">
                        <div class="claiming_text_body">Name:<span>John Doe</p></div>
                    </div>
                    <div class="row">
                        <div class="claiming_text_body">Contact Number:<span>18372371897132</p></div>
                    </div>
                    <div class="row">
                        <div class="claiming_text_body">Platinum Card#:<span>8797</p></div>
                    </div>
                    <div class="row">
                        <div class="d-flex flex-row justify-content-between">
                            <div>
                                <p><span class="claiming_text_body">CID#:<span>8797</p>
                                    </span>
                                </p>
                            </div>
                            <div>
                                <p><span class="claiming_text_body">DATE: <span>2/24/2024</p></span>
                                </p>
                            </div>
                            <div>
                        
                            </div>
                            <div>
                              
                            </div>
                        </div>
                            <div class="row">
                            <div class="claiming_text_body">Tech In Charge:<span>Gerard</p></div>
                            </div>
                            <div class="slip_line mb-2"></div>
                            <div class="row">
                            <div class="claiming_text_body">ITEM/SERVICES: WARRANTY CLAIM OTHERS:<span>Iphone</p></div>
                            </div>
                            <div class="row">
                            <div class="claiming_text_body">Unit Details:<span>Iphone</p></div>
                            </div>
                            <div class="row">
                        <div class="d-flex flex-row justify-content-between">
                            <div>
                                <p><span class="claiming_text_body">Brand:<span>Iphone</p>
                                    </span>
                                </p>
                            </div>
                            <div>
                                <p><span class="claiming_text_body">Color: <span>2/24/2024</p></span>
                                </p>
                            </div>
                            <div>
                        
                            </div>
                            <div>
                              
                            </div>
                            </div>
                            <div class="row">
                            <div class="claiming_text_body">Accessories:<input
                                class="required" type="text" id="accessories_name" name="accessories_name"></div>
                            </div>
                            <div class="row">
                            <div class="claiming_text_body mb-4">Note/Remarks:<input
                                class="required" type="text" id="note/remarks_name" name="note/remarks_name"></div>
                            </div>
                        </div>
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