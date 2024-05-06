<div id="header">
    <img class="logo" src="../../Assets/Images/logo.png" alt="logo">
    <div class="nav_container">
        <a class="nav_item ms-2" href="technician.php">Home</a>
        <a class="nav_item ms-2" href="cids.php">CIDs</a>
        <a class="nav_item ms-2" href="unclaimedcids.php">Unclaimed CIDs</a>
    </div>
    <div id="header_container">
        <p id="tech_name"></p>
        <iconify-icon id="logout" icon="basil:logout-solid"></iconify-icon>
    </div>
</div>

<script>
    var currentPageUrl = window.location.href;
    var navLinks = document.querySelectorAll('.nav_container a');
    navLinks.forEach(function(link) {
        if (link.href === currentPageUrl) {
            link.classList.add('nav_current');
        }
    });
</script>
