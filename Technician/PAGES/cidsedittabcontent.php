<div class="tab-pane fade show active" id="nav-info" role="tabpanel" aria-labelledby="nav-info-tab">
    <div class="mx-2 my-3 py-3" id="info_container">

    </div>
</div>

<div class="tab-pane fade" id="nav-sor" role="tabpanel" aria-labelledby="nav-sor-tab">
    <div class="mx-2 my-3 py-3">
        <div class="form-group">
            <label for="sor_ta"><span>SUMMARY OF REPAIRS:</span></label>
            <textarea class="form-control mb-3" id="sor_ta" rows="10"></textarea>
            <div class="d-flex flex-row w-100 mb-3">
                <div class="d-flex flex-column w-100 me-3">
                    <label for="sor_donor"><span>Date of 1st Notification of Release: </span>
                        <input class="form-control" type="date" name="sor_donor" id="sor_donor">
                </div>
                <div class="d-flex flex-column w-100">
                    <div class="d-flex flex-row">
                        <label for="sor_we" class="me-2"><span>Warranty End: </span></label>
                        <p id="sor_we_text"></p>
                    </div>
                    <div class="d-flex flex-row">
                        <input class="form-control me-3" type="number" name="sor_we" id="sor_we"
                            placeholder="Enter Number">
                        <select class="form-select" aria-label="Default select example" id="sor_du">
                            <option selected disabled>Select Duration:</option>
                            <option value="day">Day(s)</option>
                            <option value="week">Week(s)</option>
                            <option value="year">Year(s)</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="d-flex flex-row w-100 mb-3">
                <div class="d-flex flex-column w-100 me-3">
                    <label for="sor_sord"><span>START OF REPAIR DATE: </span>
                        <input class="form-control" type="datetime-local" name="sor_sord" id="sor_sord">
                </div>
                <div class="d-flex flex-column w-100">
                    <label for="sor_eord"><span>END OF REPAIR DATE: </span>
                        <input class="form-control" type="datetime-local" name="sor_eord" id="sor_eord">
                </div>
            </div>
            <button class="form-control btn-primary save_btn mb-3" data-type="sor_save">Save</button>
            <div class="alert_container">

            </div>
        </div>
    </div>
</div>

<div class="tab-pane fade" id="nav-reco" role="tabpanel" aria-labelledby="nav-reco-tab">
    <div class="mx-2 my-3 py-3" id="reco_container">
        <div class="form-group mb-3">
            <label for="sor_ta"><span>RECOMMENDATIONS:</span></label>
            <textarea class="form-control mb-3" id="reco_ta" rows="10"></textarea>
            <button class="form-control btn-primary save_btn" data-type="reco_save">Save</button>
        </div>
        <div class="alert_container">

        </div>
    </div>
</div>

<div class="tab-pane fade" id="nav-sop" role="tabpanel" aria-labelledby="nav-sop-tab">
    <div class="mx-2 my-3 py-3">
        <div class="form-group">
            <div class="d-flex flex-row w-100 mb-3">
                <div class="d-flex flex-column w-100 me-3">
                    <label for="sop_cr"><span>CR: </span>
                        <input class="form-control" type="text" name="sop_cr" id="sop_cr">
                </div>
                <div class="d-flex flex-column w-100 me-3">
                    <label for="sop_or"><span>OR: </span>
                        <input class="form-control" type="text" name="sop_or" id="sop_or">
                </div>
                <div class="d-flex flex-column w-20">
                    <br>
                    <button class="form-control btn-primary save_btn mb-3 w-20" data-type="sop_r_save">Save</button>
                </div>
            </div>

            <div class="d-flex flex-row align-items-center">
                <div class="me-3">
                    <span>SUMMARY OF PAYMENTS:</span>
                </div>
                <div>
                    <button class="form-control btn-primary save_btn" data-type="add_sop">Add</button>
                </div>
                <div class="ms-auto">
                    <p>Total: <span id="total_amount"></span></p>
                    <p>Paid: <span id="paid_amount"></span></p>
                    <p>Unpaid: <span id="unpaid_amount"></span></p>
                </div>
            </div>

            <div class="d-flex flex-row w-100 mb-3">
                <div class="d-flex flex-column w-100 me-3">
                    <span>Service: </span>
                </div>
                <div class="d-flex flex-column w-50 me-3">
                    <span>Cost:</span>
                </div>
                <div class="d-flex flex-column w-50 me-3">
                    <span>Method:</span>
                </div>
                <div class="d-flex flex-column w-100 me-3">
                    <span>Ref #:</span>
                </div>
                <div class="d-flex flex-column w-50 me-3">
                    <span>Discount(%):</span>
                </div>
                <div class="d-flex flex-column w-50 me-3">
                    <span>% Price:</span>
                </div>
                <div class="d-flex flex-column w-50 me-3">
                    <span class="mx-auto">Paid?</span>
                </div>
                <div class="d-flex flex-column w-100">
                    <span>Action:</span>
                </div>
            </div>
        </div>
        <div id="sop_data_container">

        </div>
        <div id="sop_container">

        </div>
        <div class="alert_container">

        </div>
    </div>
</div>

<div class="modal fade" id="u_tech_opt_modal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false"
    role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    Warning: Technician Options
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center" id="u_tech_opt_modal_body">
                <p>Are you sure you want to withdraw from the project?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                    Close
                </button>
                <button type="button" class="btn btn-primary save_btn" data-type="opt_tech">Save</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="u_tech_edit_modal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false"
    role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    Add Technician
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center" id="u_tech_opt_modal_body">
                <p>Add Technician:</p>
                <select class="select_technician multiple_select form-control" id="technician" multiple="multiple">

                </select>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                    Close
                </button>
                <button type="button" class="btn btn-primary save_btn" data-type="save_tech">Save</button>
            </div>
        </div>
    </div>
</div>

<script src="../JS/cidsedittabcontent.js"></script>