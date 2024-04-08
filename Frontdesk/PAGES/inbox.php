<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inbox</title>

    <!-- Header -->
    <?php include "../../header.php"; ?>

    <!-- CSS -->
    <link rel="stylesheet" href="../../style.css">
    <link rel="stylesheet" href="../CSS/add_cid_modal.css">
    <link rel="stylesheet" href="../CSS/frontdesk.css">
    <link rel="stylesheet" href="../CSS/inbox.css">
</head>

<body>
    <div class="inbox_page">
        <div class="card" id="message">
            <div class="card-body inbox_message">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">
                                <input type="checkbox" id="select-all-checkbox">
                            </th>
                            <th scope="col">Profile Pic</th>
                            <th scope="col">Name</th>
                            <th scope="col">Message</th>
                            <th scope="col">Date</th>
                            <th scope="col">Read</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox" class="message_checkbox"></td>
                            <td> <img src="https://via.placeholder.com/50" alt="Notification 2"></td>
                            <td>John Doe</td>
                            <td>Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet,
                                consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing
                                elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>
                            <td>April 8, 2024</td>
                            <td>Read</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" class="message_checkbox"></td>
                            <td> <img src="https://via.placeholder.com/50" alt="Notification 2"></td>
                            <td>Jane Smith</td>
                            <td>Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</td>
                            <td>April 7, 2024</td>
                            <td>Unread</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" class="message_checkbox"></td>
                            <td> <img src="https://via.placeholder.com/50" alt="Notification 2"></td>
                            <td>Jane Smith</td>
                            <td>Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</td>
                            <td>April 7, 2024</td>
                            <td>Unread</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" class="message_checkbox"></td>
                            <td> <img src="https://via.placeholder.com/50" alt="Notification 2"></td>
                            <td>Jane Smith</td>
                            <td>Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</td>
                            <td>April 7, 2024</td>
                            <td>Unread</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" class="message_checkbox"></td>
                            <td> <img src="https://via.placeholder.com/50" alt="Notification 2"></td>
                            <td>Jane Smith</td>
                            <td>Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</td>
                            <td>April 7, 2024</td>
                            <td>Unread</td>
                        </tr>
                        <!-- More rows can be added here -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="../JS/frontdesk.js"></script>


</body>

</html>