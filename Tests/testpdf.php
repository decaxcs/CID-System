<!DOCTYPE html>
<html>
<head>
    <title>Generate PDF from Webpage</title>
    <script src="https://unpkg.com/jspdf@latest/dist/jspdf.umd.min.js"></script>
</head>
<body>
    <h1>My Webpage</h1>
    <p>This is some content on my webpage.</p>
    <button id="generatePdfBtn">Generate PDF</button>

    <script>
        // JavaScript code to generate PDF
        document.getElementById('generatePdfBtn').addEventListener('click', function() {
            // Create a new jsPDF instance
            var doc = new jsPDF();
            
            // Get the HTML content of the entire page
            var htmlContent = document.documentElement.innerHTML;

            // Add the HTML content to the PDF
            doc.html(htmlContent, {
                callback: function () {
                    // Save the PDF
                    doc.save('webpage.pdf');
                }
            });
        });
    </script>
</body>
</html>
