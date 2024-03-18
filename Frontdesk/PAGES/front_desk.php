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

    <?php include "add_cid_modal.php"; ?>
</body>

</html>