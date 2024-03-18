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

    <!-- CSS Components -->
    <link rel="stylesheet" href="../../Assets/CSS/checkbox.css">

    <title>Frontdesk Page</title>
</head>

<body>
    <div id="front_desk_page">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#add_CID_modal">
            <iconify-icon icon="ic:round-plus"></iconify-icon>
        </button>
    </div>

    <!-- Add CID Modal -->
    <div class="modal fade" id="add_CID_modal" tabindex="-1" aria-labelledby="add_CID_label" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="add_CID_label">Terms of Service</h5>
                </div>
                <div class="modal-body">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                        <label class="form-check-label" for="defaultCheck1">
                            1. You must be of legal age. If not, additional consent from a legal guardian is required.
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck2">
                        <label class="form-check-label" for="defaultCheck2">
                            2. FREE INITIAL CHECK-UP-limited to Physical and Basic Troubleshooting.
                        </label>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="nestedCheckbox1">
                            <label class="form-check-label" for="nestedCheckbox1">
                                Advanced diagnostic Check-up-procedures are required to address the issues that
                                necessitate deep troubleshooting.
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="nestedCheckbox2">
                            <label class="form-check-label" for="nestedCheckbox2">
                                RUSH FEE -A rush fee is applicable for urgent repair units. Kindly coordinate with the
                                responsible technician to facilitate the process.
                            </label>
                        </div>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck3">
                        <label class="form-check-label" for="defaultCheck3">
                            3. The client is MANDATORY to avail deep cleaning service for units with significant debris
                            and dirt accumulation so that skilled technicians can proceed with diagnosing the issue.
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck4">
                        <label class="form-check-label" for="defaultCheck4">
                            4. Ensure your data is backed up before we access your system. We're not liable for data
                            loss. If you haven't backed up, contact us to arrange it. Be aware that hard drive failure
                            or malware can cause data loss during our check-up. We might need to reinstall your
                            operating sysiem; lel us know if you want dala backed up, bul Lhis incurs exira charges.
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck5">
                        <label class="form-check-label" for="defaultCheck5">
                            5. Physical verification happens at TECHYDAVID I.T SOLUTIONS' Physical Store.
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck6">
                        <label class="form-check-label" for="defaultCheck6">
                            6. Your system must have a License Windows or Apple OS X Os; we'll install a retail version
                            if needed, with additional costs and time.We can't work on unlicensed Operating System.
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck7">
                        <label class="form-check-label" for="defaultCheck7">
                            7. REMOTE REPAIR: We'll do our best to solve requested issues remotely. If needed, we'll
                            discuss options for repair. Conditions: Services within Standard Business Hours: 9:00 AM -
                            8:00 PM, MON - SAT, except Holidays
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck8">
                        <label class="form-check-label" for="defaultCheck8">
                            8. Board Repair Units: Lead time mostly 3-5 months and above depending on the issue, client
                            is informed first to proceed , if client change of mind incurs charges a specific amount.
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck9">
                        <label class="form-check-label" for="defaultCheck9">
                            9. Technical Parts: If it becomes necessary to order parts to proceed with the repair,
                            please be aware that we do not have control over the shipment lead time of parts from the
                            manufacturer.
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck10">
                        <label class="form-check-label" for="defaultCheck10">
                            10. Data Recovery: As part of the data recovery process, it is essential to inform you that
                            we are unable to selectively choose which chance to be recovered. In the event
                            ofunsuccessful data recovery, a fee of P1,500.00 will be charged as an Advance Diagnostic
                            Service Fee.
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck11">
                        <label class="form-check-label" for="defaultCheck11">
                            11. Advertising: We may use before and after pictures of your unit for promotion. We can add
                            our company sticker for tracking and advertising. YES_ NO_
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck12">
                        <label class="form-check-label" for="defaultCheck12">
                            12. Third-Party Pickups: We're not responsible for items picked up via Lalamove/Grab & other
                            Courier that may affect the unit. We guarantee test and make sure complete units before
                            release. Down payment of 80% is required
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck13">
                        <label class="form-check-label" for="defaultCheck13">
                            13. RTO Units Notice: Client(s) are informed about RTO (Return to the owner) units. Units
                            are released unless client specifies a reason for delay. Kindiy Relay to Pick-up
                            Responsibility.
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck14">
                        <label class="form-check-label" for="defaultCheck14">
                            14. BRAND AWARENESS: Client must uphold the TECHYDAVID I.T SOLUTIONS brand and refrain from
                            disseminating negative Jnformation or comments that undermine or are detrimental to
                            TECHYDAVID I.T SOLUTIONS, the brand, and its products and employees, through any means
                            (including but not limited to verbal, written, screenshots ,online, or media channels).
                            Negotiation must be donc between TECHYDAVID I.T SOLUTIONS and Clicnt only.
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck15">
                        <label class="form-check-label" for="defaultCheck15">
                            15. Unforeseen Issues During Repair: During repair, unexpected problems may arise. We're not
                            responsible for resulting to any damages.
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck16">
                        <label class="form-check-label" for="defaultCheck16">
                            16. Act of God Circumstances: TECHYDAVID IT SOLUTIONS shall not be liable for the damage on
                            Items in case of fire ,earthquake,-flood and other similar natural calamities
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck17">
                        <label class="form-check-label" for="defaultCheck17">
                            17. Confidential Accounts: It is the client's responsibility to ensure the secure management
                            of sensitive and confidential accounts by logging out of them appropriately.
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck18">
                        <label class="form-check-label" for="defaultCheck18">
                            18. Claiming Slip Requirement: claiming slip is mandatory, In the event of a missing
                            claiming slip, please present a valid government ID for verification.
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck19">
                        <label class="form-check-label" for="defaultCheck19">
                            19. Client Rights: Clients can request a copy of these terms and unit diagnosis details upon
                            request.
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck20">
                        <label class="form-check-label" for="defaultCheck20">
                            20. When Initiating a warranty claim, please be aware that we have implemented a mandatory
                            inspection procedure. This step ensures that our technical experts can thoroughly assess the
                            issue before proceeding with the claim. This approach enables us to address your concern
                            promptly and accurately. NO OFFICIAL RECEIPT NO WARRANTY
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck21">
                        <label class="form-check-label" for="defaultCheck21">
                            21. Official receipt turnover upon completion of service.
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary btn_cancel" data-bs-dismiss="modal">CANCEL</button>
                    <button type="button" class="btn btn-primary btn_save">PROCEED</button>
                </div>
            </div>
        </div>
    </div>
</body>

</html>