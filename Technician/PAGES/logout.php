<style>
    #logout_titled {
        background-color: #345AFD;
        color: #fff;
        text-align: center;
        justify-content: center;
    }

    #logout_footer {
        justify-content: center;
    }
</style>

<div class="modal fade" id="logout_modal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog"
    aria-labelledby="modalTitleId" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-sm" role="document">
        <div class="modal-content">
            <div class="modal-header" id="logout_titled">
                <h5 class="modal-title" id="logoutTitleId">Logout Confirmation</h5>
            </div>
            <div class="modal-body">Are you sure you want to log out from your account?</div>
            <div class="modal-footer" id="logout_footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" id="logout_button">Logout</button>
            </div>
        </div>
    </div>
</div>

<script>
    document.getElementById('logout').addEventListener('click', function () {
        $("#logout_modal").modal('show');
    });

    document.getElementById('logout_button').addEventListener('click', function () {
        $.ajax({
            url: '../../logout.php',
            type: 'POST',
            success: function () {
                window.location.href = '../../index.php';
            },
            error: function (xhr, status, error) {
                ajax_error_handling(xhr, status, error)
            }
        });
    });
</script>