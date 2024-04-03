<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Header -->
    <?php include "../../header.php"; ?>

    <!-- CSS -->
    <link rel="stylesheet" href="../../style.css">
    <link rel="stylesheet" href="../CSS/add_cid_modal.css">
    <link rel="stylesheet" href="../CSS/frontdesk.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">

    

    <title>Frontdesk Page</title>
</head>

<body>
    <div id="frontdesk_page">
        <div id="header">
            <img id="logo" src="../../Assets/Images/logo.png" alt="logo">
            <div id="notif_container">
                <div id="notif_icon_container">
                    <iconify-icon id="notif_icon" icon="mingcute:notification-line"></iconify-icon>
                    <div id="notif_dot">

                    </div>
                </div>
                <!-- <img id="profile_pic" src="../../Assets/Images/logo.png" alt="logo"> -->
                <p id="tech_name">Armein</p>
                <iconify-icon id="drop_down_icon" icon="iconamoon:arrow-down-2"></iconify-icon>
            </div>
        </div>
        <div id="greetings_header">
            <img id="group_pic" src="../../Assets/Images/Group.svg" alt="group_pic">
            <p id="greetings_text">Hello, Armein</p>
            <button type="button" class="btn btn-primary btn_create" data-bs-toggle="modal" data-bs-target="#newModal">
                CREATE
            </button>
        </div>
        <div id="dashboard_container">
            <div id="services">
                <p id="services_title" class="title">Services</p>
                <div id="services_container">
                    <div id="carouselExample" class="carousel slide">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <div class="card_container">
                                    <div class="card services_card">
                                        <div class="card-body services_card_body">
                                            <div class="services_icon_container">
                                                <iconify-icon icon="icon-park-outline:new-computer"></iconify-icon>
                                            </div>
                                            <div class="info_container">
                                                <p class="services_name">Computer Service</p>
                                                <p class="services_number">16</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card services_card">
                                        <div class="card-body services_card_body">
                                            <div class="services_icon_container">
                                                <iconify-icon icon="icon-park-outline:new-computer"></iconify-icon>
                                            </div>
                                            <div class="info_container">
                                                <p class="services_name">Computer Service</p>
                                                <p class="services_number">16</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card services_card">
                                        <div class="card-body services_card_body">
                                            <div class="services_icon_container">
                                                <iconify-icon icon="icon-park-outline:new-computer"></iconify-icon>
                                            </div>
                                            <div class="info_container">
                                                <p class="services_name">Computer Service</p>
                                                <p class="services_number">16</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card services_card">
                                        <div class="card-body services_card_body">
                                            <div class="services_icon_container">
                                                <iconify-icon icon="icon-park-outline:new-computer"></iconify-icon>
                                            </div>
                                            <div class="info_container">
                                                <p class="services_name">Computer Service</p>
                                                <p class="services_number">16</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card services_card">
                                        <div class="card-body services_card_body">
                                            <div class="services_icon_container">
                                                <iconify-icon icon="icon-park-outline:new-computer"></iconify-icon>
                                            </div>
                                            <div class="info_container">
                                                <p class="services_name">Computer Service</p>
                                                <p class="services_number">16</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="card_container">
                                    <div class="card services_card">
                                        <div class="card-body services_card_body">
                                            <div class="services_icon_container">
                                                <iconify-icon icon="icon-park-outline:new-computer"></iconify-icon>
                                            </div>
                                            <div class="info_container">
                                                <p class="services_name">Computer Service</p>
                                                <p class="services_number">16</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample"
                            data-bs-slide="prev">
                            <span class="carousel-control-prev-icon visually-hidden" aria-hidden="true"></span>
                            <iconify-icon class="prev_icon" icon="uiw:left"></iconify-icon>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample"
                            data-bs-slide="next">
                            <span class="carousel-control-next-icon visually-hidden" aria-hidden="true"></span>
                            <iconify-icon class="next_icon" icon="uiw:right"></iconify-icon>
                        </button>
                    </div>
                </div>
            </div>
            <div id="technician_progress">
                <div id="technician_container">
                    <p id="technician_title" class="title">Technician</p>
                    <div class="card technician_progress_card">
                        <div class="card-body">
                            <p class="technician_name">Armein</p>
                            <div class="progress">
                                <div class="progress-bar w-75" role="progressbar" aria-valuenow="75" aria-valuemin="0"
                                    aria-valuemax="100"></div>
                            </div>
                            <p class="technician_name">Gerard</p>
                            <div class="progress">
                                <div class="progress-bar w-75" role="progressbar" aria-valuenow="75" aria-valuemin="0"
                                    aria-valuemax="100"></div>
                            </div>
                            <p class="technician_name">Benjie</p>
                            <div class="progress">
                                <div class="progress-bar w-75" role="progressbar" aria-valuenow="75" aria-valuemin="0"
                                    aria-valuemax="100"></div>
                            </div>
                            <p class="technician_name">Bogart</p>
                            <div class="progress">
                                <div class="progress-bar w-75" role="progressbar" aria-valuenow="75" aria-valuemin="0"
                                    aria-valuemax="100"></div>
                            </div>
                            <p class="technician_name">Kristelle</p>
                            <div class="progress">
                                <div class="progress-bar w-75" role="progressbar" aria-valuenow="75" aria-valuemin="0"
                                    aria-valuemax="100"></div>
                            </div>
                        </div>
                    </div>
                </div>
    <div id="progress_container">
    <p id="progress_title" class="title">Progress</p> <!-- Ilalabas sa labas ng card-body -->
    <div class="card-body card" id="progress_card">
        <!-- Row 1 -->
        <div class="row" id="click_release">
            <!-- Mga larawan -->
            <div class="col-2 icon_col">
                <!-- Pangalanan ang col bilang icon_col at gamitin ang col-4 -->
                <div class="icon_container">
                    <iconify-icon icon="radix-icons:rocket" height="3em" style="color: #345AFD;"></iconify-icon>
                </div>
            </div>
            <div class="col-1 number_col">
                <!-- Pangalanan ang col bilang number_col at gamitin ang col-4 -->
                <div class="number_container">
                    <p class="number_text">8</p> <!-- Dagdagan ng class name -->
                </div>
            </div>
            <!-- Mga text -->
            <div class="col-1 text_col">
                <!-- Pangalanan ang col bilang text_col at gamitin ang col-4 -->
                <div class="text_container">
                    <p class="text_content">Release</p> <!-- Dagdagan ng class name -->
                </div>
            </div>
            <div class="col-1 text_col">
                <!-- Pangalanan ang col bilang text_col at gamitin ang col-4 -->
                <div class="arrow_container">
                <iconify-icon icon="raphael:arrowright" width="1.2em" height="1.2em"  style="color: A7A7A7"></iconify-icon> <!-- Dagdagan ng class name -->
                </div>
            </div>
        </div>
        <!-- Line -->
        <hr>
        <!-- Row 2 -->
        <div class="row" id="click_ongoing">
            <!-- Mga larawan -->
            <div class="col-2 icon_col">
                <!-- Pangalanan ang col bilang icon_col at gamitin ang col-4 -->
                <div class="icon_container">
                    <iconify-icon icon="uiw:reload" height="3em" style="color: #345AFD;"></iconify-icon>
                </div>
            </div>
            <div class="col-1 number_col">
                <!-- Pangalanan ang col bilang number_col at gamitin ang col-4 -->
                <div class="number_container">
                    <p class="number_text">8</p> <!-- Dagdagan ng class name -->
                </div>
            </div>
            <!-- Mga text -->
            <div class="col-1 text_col">
                <!-- Pangalanan ang col bilang text_col at gamitin ang col-4 -->
                <div class="text_container">
                    <p class="text_content">Release</p> <!-- Dagdagan ng class name -->
                </div>
            </div>
            <div class="col-1 text_col">
                <!-- Pangalanan ang col bilang text_col at gamitin ang col-4 -->
                <div class="arrow_container">
                <iconify-icon icon="raphael:arrowright" width="1.2em" height="1.2em"  style="color: A7A7A7"></iconify-icon> <!-- Dagdagan ng class name -->
                </div>
            </div>
        </div>
        <!-- Line -->
        <hr>
        <!-- Row 3 -->
        <div class="row" id="click_warranty">
            <!-- Mga larawan -->
            <div class="col-2 icon_col">
                <!-- Pangalanan ang col bilang icon_col at gamitin ang col-4 -->
                <div class="icon_container">
                    <iconify-icon icon="iconamoon:shield-yes-duotone" height="3em" style="color: #345AFD;"></iconify-icon>
                </div>
            </div>
            <div class="col-1 number_col">
                <!-- Pangalanan ang col bilang number_col at gamitin ang col-4 -->
                <div class="number_container">
                    <p class="number_text">8</p> <!-- Dagdagan ng class name -->
                </div>
            </div>
            <!-- Mga text -->
            <div class="col-1 text_col">
                <!-- Pangalanan ang col bilang text_col at gamitin ang col-4 -->
                <div class="text_container">
                    <p class="text_content">Release</p> <!-- Dagdagan ng class name -->
                </div>
            </div>
            <div class="col-1 text_col">
                <!-- Pangalanan ang col bilang text_col at gamitin ang col-4 -->
                <div class="arrow_container">
                <iconify-icon icon="raphael:arrowright" width="1.2em" height="1.2em"  style="color: A7A7A7"></iconify-icon> <!-- Dagdagan ng class name -->
                </div>
            </div>
        </div>
        
    </div>
</div>
                <?php include "add_cid_modal.php"; ?>
            </div>
            <div id="table_container">
            <table id="my_table" class="table table-striped" style="width:100%">
        <thead>
            <tr>
                <th>CID</th>
                <th>Client</th>
                <th>Technician</th>
                <th>Unit Details</th>
                <th>Date</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>22055-55</td>
                <td>System Architect</td>
                <td>Edinburgh</td>
                <td>61</td>
                <td>2011-04-25</td>
            </tr>
            <tr>
                <td>Garrett Winters</td>
                <td>Accountant</td>
                <td>Tokyo</td>
                <td>63</td>
                <td>2011-07-25</td>
            </tr>
            <tr>
                <td>Ashton Cox</td>
                <td>Junior Technical Author</td>
                <td>San Francisco</td>
                <td>66</td>
                <td>2009-01-12</td>
            </tr>
            <tr>
                <td>Cedric Kelly</td>
                <td>Senior Javascript Developer</td>
                <td>Edinburgh</td>
                <td>22</td>
                <td>2012-03-29</td>
            </tr>
            <tr>
                <td>Airi Satou</td>
                <td>Accountant</td>
                <td>Tokyo</td>
                <td>33</td>
                <td>2008-11-28</td>
            </tr>
            <tr>
                <td>Brielle Williamson</td>
                <td>Integration Specialist</td>
                <td>New York</td>
                <td>61</td>
                <td>2012-12-02</td>
            </tr>
            <tr>
                <td>Herrod Chandler</td>
                <td>Sales Assistant</td>
                <td>San Francisco</td>
                <td>59</td>
                <td>2012-08-06</td>
            </tr>
            <tr>
                <td>Rhona Davidson</td>
                <td>Integration Specialist</td>
                <td>Tokyo</td>
                <td>55</td>
                <td>2010-10-14</td>
            </tr>
            <tr>
                <td>Colleen Hurst</td>
                <td>Javascript Developer</td>
                <td>San Francisco</td>
                <td>39</td>
                <td>2009-09-15</td>
            </tr>
            <tr>
                <td>Sonya Frost</td>
                <td>Software Engineer</td>
                <td>Edinburgh</td>
                <td>23</td>
                <td>2008-12-13</td>
            </tr>
            <tr>
                <td>Jena Gaines</td>
                <td>Office Manager</td>
                <td>London</td>
                <td>30</td>
                <td>2008-12-19</td>
            </tr>
            <tr>
                <td>Quinn Flynn</td>
                <td>Support Lead</td>
                <td>Edinburgh</td>
                <td>22</td>
                <td>2013-03-03</td>
            </tr>
            <tr>
                <td>Charde Marshall</td>
                <td>Regional Director</td>
                <td>San Francisco</td>
                <td>36</td>
                <td>2008-10-16</td>
            </tr>
            <tr>
                <td>Haley Kennedy</td>
                <td>Senior Marketing Designer</td>
                <td>London</td>
                <td>43</td>
                <td>2012-12-18</td>
            </tr>
            <tr>
                <td>Tatyana Fitzpatrick</td>
                <td>Regional Director</td>
                <td>London</td>
                <td>19</td>
                <td>2010-03-17</td>
            </tr>
            <tr>
                <td>Michael Silva</td>
                <td>Marketing Designer</td>
                <td>London</td>
                <td>66</td>
                <td>2012-11-27</td>
            </tr>
            <tr>
                <td>Paul Byrd</td>
                <td>Chief Financial Officer (CFO)</td>
                <td>New York</td>
                <td>64</td>
                <td>2010-06-09</td>
            </tr>
            <tr>
                <td>Gloria Little</td>
                <td>Systems Administrator</td>
                <td>New York</td>
                <td>59</td>
                <td>2009-04-10</td>
            </tr>
            <tr>
                <td>Bradley Greer</td>
                <td>Software Engineer</td>
                <td>London</td>
                <td>41</td>
                <td>2012-10-13</td>
            </tr>
            <tr>
                <td>Dai Rios</td>
                <td>Personnel Lead</td>
                <td>Edinburgh</td>
                <td>35</td>
                <td>2012-09-26</td>
            </tr>
            <tr>
                <td>Jenette Caldwell</td>
                <td>Development Lead</td>
                <td>New York</td>
                <td>30</td>
                <td>2011-09-03</td>
            </tr>
            <tr>
                <td>Yuri Berry</td>
                <td>Chief Marketing Officer (CMO)</td>
                <td>New York</td>
                <td>40</td>
                <td>2009-06-25</td>
            </tr>
            <tr>
                <td>Caesar Vance</td>
                <td>Pre-Sales Support</td>
                <td>New York</td>
                <td>21</td>
                <td>2011-12-12</td>
            </tr>
            <tr>
                <td>Doris Wilder</td>
                <td>Sales Assistant</td>
                <td>Sydney</td>
                <td>23</td>
                <td>2010-09-20</td>
            </tr>
            <tr>
                <td>Angelica Ramos</td>
                <td>Chief Executive Officer (CEO)</td>
                <td>London</td>
                <td>47</td>
                <td>2009-10-09</td>
            </tr>
            <tr>
                <td>Gavin Joyce</td>
                <td>Developer</td>
                <td>Edinburgh</td>
                <td>42</td>
                <td>2010-12-22</td>
            </tr>
            <tr>
                <td>Jennifer Chang</td>
                <td>Regional Director</td>
                <td>Singapore</td>
                <td>28</td>
                <td>2010-11-14</td>
            </tr>
            <tr>
                <td>Brenden Wagner</td>
                <td>Software Engineer</td>
                <td>San Francisco</td>
                <td>28</td>
                <td>2011-06-07</td>
            </tr>
            <tr>
                <td>Fiona Green</td>
                <td>Chief Operating Officer (COO)</td>
                <td>San Francisco</td>
                <td>48</td>
                <td>2010-03-11</td>
            </tr>
            <tr>
                <td>Shou Itou</td>
                <td>Regional Marketing</td>
                <td>Tokyo</td>
                <td>20</td>
                <td>2011-08-14</td>
            </tr>
            <tr>
                <td>Michelle House</td>
                <td>Integration Specialist</td>
                <td>Sydney</td>
                <td>37</td>
                <td>2011-06-02</td>
            </tr>
            <tr>
                <td>Suki Burks</td>
                <td>Developer</td>
                <td>London</td>
                <td>53</td>
                <td>2009-10-22</td>
            </tr>
            <tr>
                <td>Prescott Bartlett</td>
                <td>Technical Author</td>
                <td>London</td>
                <td>27</td>
                <td>2011-05-07</td>
            </tr>
            <tr>
                <td>Gavin Cortez</td>
                <td>Team Leader</td>
                <td>San Francisco</td>
                <td>22</td>
                <td>2008-10-26</td>
            </tr>
            <tr>
                <td>Martena Mccray</td>
                <td>Post-Sales support</td>
                <td>Edinburgh</td>
                <td>46</td>
                <td>2011-03-09</td>
            </tr>
            <tr>
                <td>Unity Butler</td>
                <td>Marketing Designer</td>
                <td>San Francisco</td>
                <td>47</td>
                <td>2009-12-09</td>
            </tr>
            <tr>
                <td>Howard Hatfield</td>
                <td>Office Manager</td>
                <td>San Francisco</td>
                <td>51</td>
                <td>2008-12-16</td>
            </tr>
            <tr>
                <td>Hope Fuentes</td>
                <td>Secretary</td>
                <td>San Francisco</td>
                <td>41</td>
                <td>2010-02-12</td>
            </tr>
            <tr>
                <td>Vivian Harrell</td>
                <td>Financial Controller</td>
                <td>San Francisco</td>
                <td>62</td>
                <td>2009-02-14</td>
            </tr>
            <tr>
                <td>Timothy Mooney</td>
                <td>Office Manager</td>
                <td>London</td>
                <td>37</td>
                <td>2008-12-11</td>
            </tr>
            <tr>
                <td>Jackson Bradshaw</td>
                <td>Director</td>
                <td>New York</td>
                <td>65</td>
                <td>2008-09-26</td>
            </tr>
            <tr>
                <td>Olivia Liang</td>
                <td>Support Engineer</td>
                <td>Singapore</td>
                <td>64</td>
                <td>2011-02-03</td>
            </tr>
            <tr>
                <td>Bruno Nash</td>
                <td>Software Engineer</td>
                <td>London</td>
                <td>38</td>
                <td>2011-05-03</td>
            </tr>
            <tr>
                <td>Sakura Yamamoto</td>
                <td>Support Engineer</td>
                <td>Tokyo</td>
                <td>37</td>
                <td>2009-08-19</td>
            </tr>
            <tr>
                <td>Thor Walton</td>
                <td>Developer</td>
                <td>New York</td>
                <td>61</td>
                <td>2013-08-11</td>
            </tr>
            <tr>
                <td>Finn Camacho</td>
                <td>Support Engineer</td>
                <td>San Francisco</td>
                <td>47</td>
                <td>2009-07-07</td>
            </tr>
            <tr>
                <td>Serge Baldwin</td>
                <td>Data Coordinator</td>
                <td>Singapore</td>
                <td>64</td>
                <td>2012-04-09</td>
            </tr>
            <tr>
                <td>Zenaida Frank</td>
                <td>Software Engineer</td>
                <td>New York</td>
                <td>63</td>
                <td>2010-01-04</td>
            </tr>
            <tr>
                <td>Zorita Serrano</td>
                <td>Software Engineer</td>
                <td>San Francisco</td>
                <td>56</td>
                <td>2012-06-01</td>
            </tr>
            <tr>
                <td>Jennifer Acosta</td>
                <td>Junior Javascript Developer</td>
                <td>Edinburgh</td>
                <td>43</td>
                <td>2013-02-01</td>
            </tr>
            <tr>
                <td>Cara Stevens</td>
                <td>Sales Assistant</td>
                <td>New York</td>
                <td>46</td>
                <td>2011-12-06</td>
            </tr>
            <tr>
                <td>Hermione Butler</td>
                <td>Regional Director</td>
                <td>London</td>
                <td>47</td>
                <td>2011-03-21</td>
            </tr>
            <tr>
                <td>Lael Greer</td>
                <td>Systems Administrator</td>
                <td>London</td>
                <td>21</td>
                <td>2009-02-27</td>
            </tr>
            <tr>
                <td>Jonas Alexander</td>
                <td>Developer</td>
                <td>San Francisco</td>
                <td>30</td>
                <td>2010-07-14</td>
            </tr>
            <tr>
                <td>Shad Decker</td>
                <td>Regional Director</td>
                <td>Edinburgh</td>
                <td>51</td>
                <td>2008-11-13</td>
            </tr>
            <tr>
                <td>Michael Bruce</td>
                <td>Javascript Developer</td>
                <td>Singapore</td>
                <td>29</td>
                <td>2011-06-27</td>
            </tr>
            <tr>
                <td>Donna Snider</td>
                <td>Customer Support</td>
                <td>New York</td>
                <td>27</td>
                <td>2011-01-25</td>
            </tr>
        </tbody>
    </table>
     </div>

            <script src="../JS/frontdesk.js"></script>
</body>

</html>