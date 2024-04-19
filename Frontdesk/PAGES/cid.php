<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CID</title>
    <!-- Header -->
    <?php include "../../header.php"; ?>

    <!-- CSS -->
    <link rel="stylesheet" href="../../style.css">
    <link rel="stylesheet" href="../CSS/create_cid.css">
    <link rel="stylesheet" href="../CSS/frontdesk.css">
    <link rel="stylesheet" href="../CSS/cid.css">


</head>

<body>

    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#cid">
        Buksan ang Modal
    </button>

    <div class="modal fade" id="cid" tabindex="-1" aria-labelledby="cidLabel" aria-hidden="true"
        data-bs-backdrop="static">
        <div class="modal-dialog modal-lg" id="cid_dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="">
                        <div class="row">
                            <div class="col-auto me-auto" id="person_in_charge">FILL UP BY PERSON IN CHARGE ONLY</div>
                            <div class="col-auto" id="cid_bold">DIAGNOSTIC REPAIR REPORT</div>
                        </div>
                        <div class="row mb-4">
                            <div class="col-auto me-auto" id="cid_bold">SPECIFY THE FF:</div>
                            <div class="col-auto" id="cid_number">CID 32024-52</div>
                        </div>
                        <div class="row">
                            <div class="col-auto me-auto" id="cid_bold">Unit Details/ Brand Model:<span
                                    class="cid_text">Apple MacBook Pro (2021)</p>
                            </div>
                            <div class="col-auto ms-auto" id="cid_bold">Claiming Slip:<span>0911234</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-auto me-auto">

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-auto me-auto" id="cid_bold">REMARKS; SCRATCHES, COLORS/ LCD ETC:<span
                                    class="cid_text">Minor scratches on the top cover, screen in good condition.</p>
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="row" id="unit_history">
                            <div class="col-auto me-auto" id="cid_bold">UNIT HISTORY / PROBLEMS / ISSUES & INFORMATION
                                PROVIDED
                                BY CLIENT:<span class="cid_text">Client reported malfunctioning keyboard and slow
                                    performance. No physical damage observed.</p>
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="row mb-2">
                            <div class="d-flex flex-row justify-content-between">
                                <div>
                                    <p><span class="cid_print_text_bold" id="cid_bold">SUMMARY OF REPAIRS / DIAGNOSTIC /
                                            OBSERVATION ETC:
                                        </span>
                                    </p>
                                </div>
                                <div>
                                    <p><span class="cid_print_text_bold text_red" id="cid_number">Date of 1st
                                            Notification of Release: <span>2/24/2024</p></span>
                                    </p>
                                    <p><span class="cid_print_text_bold text_red" id="cid_number">Warranty
                                            End:<span>3/20/2024</p> </span></p>
                                </div>
                            </div>
                        </div>
                        <div>
                            <p class="summary_of_repairs_content mb-4">Upon inspection, the laptop showed signs of
                                overheating, which likely caused the system instability. Additionally, the screen had
                                minor scratches, and the keyboard exhibited some non-responsive keys. Further diagnostic
                                tests revealed issues with the CPU fan and a faulty RAM module. Recommendations include
                                replacing the fan and upgrading the RAM</p>
                        </div>
                        <div class="row d-flex justify-content-center justify-content-between">
                            <div class="col-auto" id="cid_bold">START OF REPAIR DATE:<span>2/29/2024</p>
                            </div>
                            <div class="col-auto" id="cid_bold">END OF REPAIR DATE:<span>3/20/2024</p>
                            </div>
                            <div class="col-auto" id="cid_bold">TECH IN CHARGE:<span>Armein</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="line"></div>
                            <div class="row " id="reccomendations_cid">
                                <div class="col-auto me-auto" id="cid_bold">
                                    RECOMMENDATIONS:<span class="cid_text">Perform regular maintenance checks every
                                        three months to ensure optimal performance.</p>
                                </div>
                            </div>
                            <div class="line"></div>

                            <div class="row d-flex justify-content-between mb-4" id="mode_of_payments">
                                <div class="col-auto" id="cid_bold">SUMMARY OF PAYMENTS:</div>
                                <div class="col-auto" id="cid_bold">CR:<span>500</p>
                                </div>
                                <div class="col-auto" id="cid_bold">OR:<span>700</p>
                                </div>
                                <div class="col-auto" id="cid_bold">MODE OF PAYMENTS:<span>Credit Card</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-auto me-auto mb-4">
                                    <span>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae tortor
                                        ultrices, aliquet ex ut, vehicula libero. Fusce eget aliquet quam. Duis
                                        condimentum, dui ut commodo fringilla, mi neque dapibus tortor, ut suscipit nisl
                                        turpis vel ligula. Suspendisse nec fringilla velit.</p>
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