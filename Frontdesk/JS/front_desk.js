function navigateToLink(url) {
    window.location.href = url;
}

function openNewTab(url) {
    window.open(url, '_blank');
}

$(document).ready(function() {
    $('#recent_cid_table').DataTable( {
        "lengthMenu": [[4], [4]],
    });
}); 

// function updateTime() {
//     var currentTime = new Date();
//     var hours = currentTime.getHours();
//     var minutes = currentTime.getMinutes();
//     var meridiem = hours >= 12 ? 'PM' : 'AM';

//     hours = hours % 12;
//     hours = hours ? hours : 12;

//     minutes = minutes < 10 ? '0' + minutes : minutes;

//     var currentTimeString = hours + ':' + minutes + ' ' + meridiem;
//     document.getElementById('current-time').textContent = currentTimeString;
// }

// updateTime();
// setInterval(updateTime, 1000);

    document.addEventListener("DOMContentLoaded", function() {
        // Kunin ang mga elementong may id na click_release, click_ongoing, at click_warranty
        var release = document.getElementById("click_release");
        var ongoing = document.getElementById("click_ongoing");
        var warranty = document.getElementById("click_warranty");

        // Idagdag ang event listener para sa click event sa bawat elemento
        release.addEventListener("click", function() {
            // Dalhin sa target na pahina kapag i-click ang release
            window.location.href = "https://datatables.net/examples/styling/bootstrap5.html";
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

