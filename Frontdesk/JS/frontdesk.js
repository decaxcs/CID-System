
$(document).ready(function () {
    document.getElementById('btn_create').addEventListener('click', function() {
        window.location.href = 'create_cid.php';
    });

    function get_user_account() {
        $.ajax({
            url: "../PHP/get_user_account.php",
            type: "GET",
            success: function (response) {
                if (response.status === "success") {
                    var csu_name = response.csu_name;
                    $("#tech_name").text(csu_name);
                    $("#greetings_text").text("Hello, " + csu_name);
                } else {
                    console.log("Error: " + response.message);
                }
            },
            error: function (xhr, status, error) {
                console.log("Error:", error);
                console.log("Status:", status);
                console.log("XHR:", xhr);
                console.log("An error occurred while fetching data from the server.");
            }
        });
    }

    function get_technician_ongoing() {
        $.ajax({
            url: "../PHP/get_technician_ongoing.php",
            type: "GET",
            success: function (response) {
                if (response.status === "success") {
                    populate_technician_ongoing(response.data);
                } else {
                    console.log("Error: No data found.");
                }
            },
            error: function (xhr, status, error) {
                console.log("Error:", error);
                console.log("Status:", status);
                console.log("XHR:", xhr);
                console.log("An error occurred while fetching data from the server.");
            }
        });
    }

    function populate_technician_ongoing(data) {
        var technician_ongoing_container = $('.technician_ongoing_container');
        technician_ongoing_container.empty();

        data.forEach(function (item) {
            var technician_ongoing_HTML =
                `
                <p class="technician_name">${item.technician_name}</p>
                <div class="progress">
                    <div class="progress-bar w-75" role="progressbar" aria-valuenow="${item.ongoing_service_count}" aria-valuemin="0"
                        aria-valuemax="100">${item.ongoing_service_count}</div>
                </div>
                `;
            technician_ongoing_container.append(technician_ongoing_HTML);
        });
    }

    function get_services() {
        $.ajax({
            url: "../PHP/get_services.php",
            type: "GET",
            success: function (response) {
                if (response.status === "success") {
                    populate_services(response.data);
                } else {
                    console.log("Error: No data found.");
                }
            },
            error: function (xhr, status, error) {
                console.log("Error:", error);
                console.log("Status:", status);
                console.log("XHR:", xhr);
                console.log("An error occurred while fetching data from the server.");
            }
        });
    }

    function populate_services(data) {
        var service_container = $('.service_container');
        var carousel_inner = $('.carousel-inner');

        carousel_inner.empty();

        var items_per_slide = 5;
        var num_items = data.length;
        var num_slides = Math.ceil(num_items / items_per_slide);

        for (var i = 0; i < num_slides; i++) {
            var slide_HTML =
                `<div class="carousel-item ${i === 0 ? 'active' : ''}">
                    <div class="card_container"></div>
                </div>`;
            carousel_inner.append(slide_HTML);
        }

        data.forEach(function (item, index) {
            var current_slide = Math.floor(index / items_per_slide);
            var service_HTML =
                `<div class="card services_card">
                    <div class="card-body services_card_body">
                        <div class="services_icon_container">
                            <iconify-icon icon="iconoir:laptop-fix"></iconify-icon>
                        </div>
                        <div class="info_container">
                            <p class="services_name">${item.service_name} Service</p>
                            <p class="services_number">${item.cid_count}</p>
                        </div>
                    </div>
                </div>`;
            carousel_inner.find('.carousel-item').eq(current_slide).find('.card_container').append(service_HTML);
        });
    }

    function get_status_count(){
        $.ajax({
            url: "../PHP/get_status_count.php",
            type: "GET",
            success: function (response) {
                if (response.status === "success") {
                    console.log(response.data);
                    populate_status_count(response.data);
                } else {
                    console.log("Error: No data found.");
                }
            },
            error: function (xhr, status, error) {
                console.log("Error:", error);
                console.log("Status:", status);
                console.log("XHR:", xhr);
                console.log("An error occurred while fetching data from the server.");
            }
        });
    }

    function populate_status_count(data) {
        $('#release_count').text(data.Release);
        $('#ongoing_count').text(data["On-going"]);
        $('#warranty_count').text(data.Warranty);
    }

    get_user_account();
    get_technician_ongoing();
    get_services();
    get_status_count();

    document.addEventListener("DOMContentLoaded", function() {
        // Kunin ang mga elementong may id na click_release, click_ongoing, at click_warranty
        var release = document.getElementById("click_release");
        var ongoing = document.getElementById("click_ongoing");
        var warranty = document.getElementById("click_warranty");
    
        // Idagdag ang event listener para sa click event sa bawat elemento
        release.addEventListener("click", function() {
            // Dalhin sa target na pahina kapag i-click ang release
            window.location.href = "release.php";
        });
    
        ongoing.addEventListener("click", function() {
            // Dalhin sa target na pahina kapag i-click ang ongoing
            window.location.href = "https://example.com/ongoing-page";
        });
    
        warranty.addEventListener("click", function() {
            // Dalhin sa target na pahina kapag i-click ang warranty
            window.location.href = "https://example.com/warranty-page";
        });
    });
    
    new DataTable('#my_table');
});

