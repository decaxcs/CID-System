<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Header -->
    <?php include "../../header.php"; ?>

    <!-- CSS -->
    <link rel="stylesheet" href="../../style.css">
    <link rel="stylesheet" href="../CSS/create_cid.css">
    <link rel="stylesheet" href="../CSS/frontdesk.css">

    <title>Frontdesk Page</title>
</head>

<body>

    <div class="create_cid_page">
        <div class="card" id="create_cid_container">
            <div class="card-body creade_cid_body">
                <span class="tos_terms_of_service">Terms Of Service</span>
                <div id="tos_container">

                </div>

                <div class="row mt-4 disclaimer-row">
                    <div class="col">
                        Disclaimer: By signing this TECHYDAVID IT SOLUTIONS’ TERMS OF SERVICE, the REPRESENTATIVE
                        confirms discussing terms. As the client, you’ve read, understood, and agreed all terms.
                    </div>
                </div>

                <div class="row-of-information">
                    <div class="col">
                        <div class="mb-4"> <span class="tos_span">TIME & DATE: <span id="currentDateTime"></span></div>
                        <div class="mb-4"><span class="tos_span">CLIENT FULL NAME WITH SIGNATURE:</span> <input
                                class="required" type="text" id="client_name" name="client_name"></div>

                        <div class="signature_container">
                            <p><span class="tos_span">ENTER SIGNATURE:</span></p>
                            <div id="signature-pad" class="signature-pad">
                                <img id="signature_display" src="../../Assets/Images/white_bg.png" alt="">
                            </div>
                        </div>

                        <div class="mb-4"> <span class="tos_span">CONTACT NUMBER:</span> <input type="number" class="required"
                                id="contact_number" name="contact_number"></div>
                        <div class="row mb-5 align-items-center">
                            <!-- Dito ay idinagdag ang 'align-items-center' -->
                            <div class="col">
                                <span class="tos_span">PLATINUM MEMBER:</span>
                                <select id="platinum_member" name="platinum_member" class="custom-select required">
                                    <option value="No">No</option>
                                    <option value="Yes">Yes</option>
                                </select>
                            </div>
                            <div class="col">
                                <span class="tos_span">PLATINUM#:</span> <input type="number" id="platinum_number"
                                    name="platinum_number" disabled>
                            </div>
                        </div>
                        <div class="mb-3"> <span class="tos_span">TECHYDAVID IT SOLUTIONS’ REPRESENTATIVE:</span>
                            <select id="representative" name="representative" class="custom-select select_technician required">

                            </select>
                        </div>
                        <div class="mb-5"> <span class="tos_span">HOW DO YOU KNOW ABOUT US?:</span>
                            <select id="how_know" name="how_know" class="custom-select required">
                                <option value="Advertisement">Advertisement</option>
                                <option value="Word of Mouth">Word of Mouth</option>
                                <option value="Online Search">Online Search</option>
                                <!-- Add more options as needed -->
                            </select>
                        </div>
                    </div>
                    <div id="alertContainer"></div>
                    <div class="add_cid_footer">
                        <button type="button" class="btn btn-primary btn_cancel">CANCEL</button>
                        <button type="button" class="btn btn-primary btn_save" id="proceed_button">PROCEED</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

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
                        <div class="">
                            <p> <span class="tos_span ">Technician: </span>
                                <select id="technician" name="technician" class="custom-select select_technician">

                                </select>
                            </p>
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

    <div class="modal fade" id="signature_modal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false"
        role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalTitleId">
                        Enter Signature:
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body signature_body">
                    <div id="signature-pad" class="signature-pad">
                        <div class="signature-pad--body">
                            <canvas id="signature_input" width="1100" height="500"></canvas>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" id="clear">
                        Clear
                    </button>
                    <button type="button" class="btn btn-primary" id="save">Save</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/signature_pad@4.1.7/dist/signature_pad.umd.min.js"></script>
    <script src="../JS/add_cid_modal.js"></script>
</body>

</html>