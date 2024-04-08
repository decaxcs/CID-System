<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Header -->
    <?php include "../header.php"; ?>
    <title>Document</title>
</head>

<body>

    <canvas id="signatureCanvas" width="1000" height="2000"></canvas>

    <script>
        const canvas = document.getElementById("signatureCanvas");
        const context = canvas.getContext("2d");

        let isDrawing = false;

        canvas.addEventListener('mousedown', startDrawing);
        canvas.addEventListener('mousemove', draw);
        canvas.addEventListener('mouseup', stopDrawing);
        canvas.addEventListener('mouseout', stopDrawing);

        function startDrawing(event) {
            isDrawing = true;
            context.beginPath();
            context.moveTo(event.clientX - canvas.offsetLeft, event.clientY - canvas.offsetTop);
        }

        function draw(event) {
            if (isDrawing) {
                context.lineTo(event.clientX - canvas.offsetLeft, event.clientY - canvas.offsetTop);
                context.stroke();
            }
        }

        function stopDrawing() {
            isDrawing = false;
        }

        function saveSignature() {
            const dataURL = canvas.toDataURL();
            // You can now send the dataURL to your server for storage
        }
    </script>
    </script>

</body>

</html>