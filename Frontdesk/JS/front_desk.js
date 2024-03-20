function navigateToLink(url) {
    window.location.href = url;
}

function openNewTab(url) {
    window.open(url, '_blank');
}

//Data Table
$(document).ready(function() {
    $('#recent_cid_table').DataTable( {
        "lengthMenu": [[4], [4]],
    });
});

//Calendar Script

//Time Script
function updateTime() {
    var currentTime = new Date();
    var hours = currentTime.getHours();
    var minutes = currentTime.getMinutes();
    var meridiem = hours >= 12 ? 'PM' : 'AM';

    hours = hours % 12;
    hours = hours ? hours : 12;

    minutes = minutes < 10 ? '0' + minutes : minutes;

    var currentTimeString = hours + ':' + minutes + ' ' + meridiem;
    document.getElementById('current-time').textContent = currentTimeString;
}

updateTime();
setInterval(updateTime, 1000);