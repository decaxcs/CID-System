<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Header -->
    <?php include "../header.php"; ?>
    <link rel="stylesheet" href="../style.css">

    <title>Print CID</title>
    <style>
        @media print {
            .line {
                background-color: black;
                height: 2px;
                margin: 5px 0;
                border: 1px solid black;
            }

            .cid_footer {
                position: absolute;
                bottom: 0;
                margin-bottom: 20px;
                margin-right: 40px;
            }
        }

        @page {
            size: A4;
            margin: 0;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: "Work Sans", sans-serif;
            background-color: #ffffff;
        }

        .cid_print_container {
            width: 100%;
            max-width: 100%;
            margin: 0 auto;
            padding: 20px;
            box-sizing: border-box;
        }

        .cid_print_content {
            width: 100%;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            box-sizing: border-box;
            background-color: #f0f0f0;

            text-align: justify;
            line-height: 1.5;
            font-size: 10px;
        }

        .cid_print_content p,
        .cid_print_content label {
            margin-top: auto;
            margin-bottom: auto;
        }

        .cid_print_text_bold {
            font-weight: 700;
        }

        .text_red {
            color: #c22510;
        }

        .cid_print_text_small {
            font-size: 8px;
        }

        .text-right {
            text-align: right;
        }

        .line {
            width: 100%;
            height: 2px;
            background-color: black;
            margin: 5px 0;
        }

        input[type="text"] {
            border: none;
            border-bottom: 1px solid black;
        }

        .logo {
            width: auto;
            height: 40px;
            margin: 15px;
        }

        .title {
            font-weight: bold;
            font-family: 'Ethnocentric', sans-serif;
            color: #2291FD;
        }
    </style>
</head>

<body>
    <div class="cid_print_container">
        <div class="cid_print_content d-flex flex-column">
            <div class="d-flex flex-row align-items-center">
                <div>
                    <img src="../Assets/Images/logo.png" class="logo" alt="" srcset="">
                </div>
                <div>
                    <p class="title">TechyDavid I.T Solutions</p>
                    <p>📌Daisy St. Plaridel 3 Subd. Bayan Luma 7 , Imus, Philippines</p>
                    <p>📱0968 855 5399 | 📱0961 149 4441 | ☎️046-424-5604 | 📩techydavid2020@techydavid.com</p>
                </div>
            </div>
            <div>
                <p class="text-right"><span class="cid_print_text_bold">DIAGNOSTIC REPAIR REPORT</span></p>
                <p class="text-right"><span class="cid_print_text_bold text_red">CID </span></p>
                <p class="text-right"><span class="cid_print_text_bold">Claiming Slip: </span></p>
            </div>
            <div>
                <p><span class="cid_print_text_bold">Unit Details / Brand Model: </span></p>
                <div>
                    <p class="unit_details_content"></p>
                </div>
            </div>

            <div class="line"></div>

            <div>
                <div>
                    <p><span class="cid_print_text_bold">REMARKS: (SCRATCHES, COLORS, LCD, ETC)</span></p>
                    <div>
                        <p class="remarks_content"></p>
                    </div>
                </div>

                <div class="line"></div>

                <div>
                    <p><span class="cid_print_text_bold">UNIT HISTORY / PROBLEMS / ISSUES & INFORMATION PROVIDED BY
                            CLIENT:</span></p>
                    <div>
                        <p class="unit_history_content"></p>
                    </div>
                </div>
            </div>

            <div class="line"></div>

            <div>
                <div class="d-flex flex-row justify-content-between">
                    <div>
                        <p><span class="cid_print_text_bold">SUMMARY OF REPAIRS / DIAGNOSTIC / OBSERVATION ETC:
                            </span>
                        </p>
                    </div>
                    <div>
                        <p><span class="cid_print_text_bold text_red">Date of 1st Notification of Release: </span>
                        </p>
                        <p><span class="cid_print_text_bold text_red">Warranty End: </span></p>
                    </div>
                </div>
                <div>
                    <p class="summary_of_repairs_content"></p>
                </div>
                <div class="d-flex flex-row justify-content-between">
                    <p><span class="cid_print_text_bold">START OF REPAIR DATE: </span></p>
                    <p><span class="cid_print_text_bold">END OF REPAIR DATE: </span></p>
                    <p><span class="cid_print_text_bold">TECH IN CHARGE: </span></p>
                </div>
            </div>

            <div class="line"></div>

            <div>
                <p><span class="cid_print_text_bold">RECCOMENDATIONS: </span></p>
                <div>
                    <p class="reccomendations_content"></p>
                </div>
            </div>

            <div class="line"></div>

            <div>
                <div class="d-flex flex-row justify-content-between">
                    <p><span class="cid_print_text_bold">SUMMARY OF PAYMENTS: </span></p>
                    <p><span class="cid_print_text_bold">CR: </span></p>
                    <p><span class="cid_print_text_bold">OR: </span></p>
                    <p><span class="cid_print_text_bold">MODE OF PAYMENT:</span> </p>
                </div>
                <div>
                    <p class="summary_of_payments_content"></p>
                </div>
            </div>

            <div class="cid_footer">
                <div>
                    <div class="line"></div>
                    <p class="cid_print_text_small">I hereby acknowledge that I have received and throughly reviewed
                        the
                        diagnostic summary provided by the
                        TECHYDAVID I.T SOLUTIONS .1. The
                        diagnostic summary outlines the findings ,recommendations , and necessary repairs for the
                        units
                        or
                        items
                        in questions. I have the opportunity to
                        discuss and clarify the questions. I understand that any actions or decisions made regarding
                        the
                        repairs
                        and recommendations mentioned in the
                        diagnostic summary are my sole responsibility.4.TECHYDAVID I.T SOLUTIONS is not liable to
                        any
                        consequences ,damages, or losses that may arise
                        from my decisions or actions taken based on the diagnostic summary or representatives
                        explanations.
                        Furthermore, I confirm that I have recieved
                        all the items mentioned in our agreement and find them to be complete and in satisfactory
                        conditions. By
                        signing below, I acknowledge that I have
                        read, understood and agree terms outlined in the disclaimer.</p>
                    <br>
                </div>
                <div class="d-flex flex-row">
                    <div class="me-3">
                        <label class="cid_print_text_bold" for="name_with_signature">Name With Signature:</label>
                        <input type="text" id="name_with_signature" name="name_with_signature"><br>
                    </div>

                    <div>
                        <label class="cid_print_text_bold" for="pickup_date_time">Date & Time of Pick-Up:</label>
                        <input type="text" id="pickup_date_time" name="pickup_date_time"><br>
                    </div>
                </div>
                <br>
                <div class="d-flex flex-row">
                    <div class="me-3">
                        <label class="cid_print_text_bold" for="released_by">Released Unit by:</label>
                        <input type="text" id="released_by" name="released_by"><br>
                    </div>

                    <div class="me-3">
                        <label class="cid_print_text_bold" for="release_date_time">Released Date & Time:</label>
                        <input type="text" id="release_date_time" name="release_date_time"><br>
                    </div>

                    <div>
                        <label class="cid_print_text_bold" for="released_thru">Released thru:</label>
                        <input type="text" id="released_thru" name="released_thru"><br>
                    </div>
                </div>
                <div class="line"></div>
                <div class="cid_print_text_small text_red">Confidentiality, Copyright and other Intellectual property rights.
                </div>
                <div class="cid_print_text_small">
                    The information contained herein is confidential and proprietary to TECHYDAVID I.T SOLUTIONS.It may
                    not be disclosed or transferred, directly or indirectly, to any third party without the explicit
                    written permission of TECHYDAVID I.T SOLUTIONS. All rights reserved. No part of this document may be
                    reproduced, stored in a retrieval system, translated, or transmitted in any form or by any means,
                    electronic, mechanical, photocopying, recording, or otherwise, without prior written permission of
                    TECHYDAVID I.T SOLUTIONS.
                </div>
            </div>
        </div>
    </div>
</body>

</html>