<div class="tab-pane fade show active" id="nav-info" role="tabpanel" aria-labelledby="nav-info-tab">
    <div class="mx-2 my-3 py-3" id="info_container">

    </div>

    <div class="alert_container">

    </div>
</div>

<div class="tab-pane fade" id="nav-sor" role="tabpanel" aria-labelledby="nav-sor-tab">
    <div class="mx-2 my-3 py-3">
        <div class="form-group">
            <label for="sor_ta"><span>SUMMARY OF REPAIRS:</span></label>
            <textarea class="form-control mb-3" id="sor_ta" rows="10"></textarea>
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
            <div>
                <span>Check List</span>
                <table class="table table-bordered checklist-table">
                    <thead>
                        <tr>
                            <th scope="col">Component Name</th>
                            <th scope="col" class="text-center">Working?</th>
                            <th scope="col" class="text-center">Not Working?</th>
                            <th scope="col" class="text-center">Not Applicable</th>
                        </tr>
                    </thead>
                    <tbody id="checklist_tbody">
                        
                    </tbody>
                </table>
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
            <div id="sop_data_container">

            </div>
            <div id="sop_container">

            </div>
            <div class="alert_container">

            </div>
        </div>
    </div>
</div>