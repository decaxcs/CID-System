<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <?php include "../header.php"; ?>
  <title>Snackbar Example</title>

  <style>
    .style {
      color: yellow;
    }
  </style>

</head>
<body>
<div id="container">

</div>
<script>

$(document).ready(function () {
  populate();
});


function populate() {
  var container = $('#container');
  var html = 
  `
  <p class="style">Yellow</p>
  `;

  
}
</script>

</body>
</html>
