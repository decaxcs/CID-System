<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <?php include "../header.php"; ?> 
  <title>Signature Capture</title>
</head>
<body>
    <div class="container">
        <h1>Signature Capture</h1>
        <div id="signature-pad" class="signature-pad">
          <div class="signature-pad--body">
            <canvas></canvas>
          </div>
          <div class="signature-pad--footer">
              <button type="button" class="btn btn-secondary" id="clear">Clear</button> 
              <button type="button" class="btn btn-primary" id="save">Save</button>
          </div>
       </div>
    </div>

  <script src="https://cdn.jsdelivr.net/npm/signature_pad@4.1.7/dist/signature_pad.umd.min.js"></script>
  <script>
      const canvas = document.querySelector("canvas"); // Select the canvas element
      const signaturePad = new SignaturePad(canvas);

      // Clear button 
      const clearButton = document.getElementById("clear");
      clearButton.addEventListener("click", () => {
          signaturePad.clear();
      });

      // Save button (replace with your server-side save logic)
      const saveButton = document.getElementById("save");
      saveButton.addEventListener("click", () => {
          if (signaturePad.isEmpty()) {
            alert("Please provide a signature first.");
          } else {
              const dataURL = signaturePad.toDataURL(); 
              // Replace with your logic to send dataURL to your server
              console.log(dataURL); // For now, let's just log it
          }
      });
  </script>
</body>
</html>
