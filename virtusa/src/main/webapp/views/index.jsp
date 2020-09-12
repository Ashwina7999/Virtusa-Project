<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Weather Forecast</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <!-- INDEX STYLE SHEET-->
    <link rel="stylesheet" href="CSS/style.css">
    <!-- TITLE ICON-->
    <link rel="icon" type="image/png" href="images/icons/02d.png" />
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <!-- MAPBOX-->
    <script src="https://api.mapbox.com/mapbox-gl-js/v1.11.1/mapbox-gl.js"></script>
    <link href="https://api.mapbox.com/mapbox-gl-js/v1.11.1/mapbox-gl.css" rel="stylesheet" />
    <!-- AJAX JQUERY-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- DATE PICKER FORECAST CSS-->
    <link href="JS/forecast/datepicker/daterangepicker.css" rel="stylesheet" media="all">
    <!-- FORECAST BOX STYLE CSS-->
    <link href="CSS/forecast_style.css" rel="stylesheet" media="all">


</head>

<body>

    <!-- SCREEN LOADER BEFORE PAGE STARTS-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

    <!-- BACKGROUND IMAGE -->
    <div class="bgimg w3-animate-opacity"
        style="background-image: url('images/bg/scattered clouds.jpg');height: auto;background-position: center;background-size: cover; ">

        <!-- LOGO AND SIDE BAR ICON -->
        <div class="logo">
            Virtusa
            <div class="sidebar_icon">
                <i class="fas fa-bars" onclick="opensidebar()"></i>
            </div>
        </div>


        <!-- SEARCH BAR -->
        <br><br><br><br>
        <header>
            <input type="text" autocomplete="off" class="search-box" placeholder="Search your City">
            <i class="w3-xlarge fa fa-map-marker search-button"></i>
        </header>


        <!--3 ROW BOXES-->
        <div class="container" style="max-width: 1500px;">
            <div class="row">
                <!--1st ROW BOX-->
                <div class="col-sm-4">
                    <br>
                    <h1 class="city">Coimbatore</h1>
                    <p class="D-M-Y">Friday, 11 September 2020</p>
                    <p class="country">IN</P>
                    <p class="temperature"><mark class="temp">26</mark><mark
                            style="background:none;color: white;margin-left: -30px">°c</mark><img id="icon"
                            class="temp_img" style="margin-left: -13px" src="images/icons/03d.png"></p>

                    <h5 class="description" style="color: white;text-align: center;font-weight: bold">scattered clouds
                    </h5>
                </div>


                <!-- 2nd ROW BOX-->
                <div class="col-sm-4" style="height: 315px">
                    <br><br>
                    <p class="humidity"><img src="images/icons/icon-humidity.png"> <b>Humidity</b>
                        <br><mark class="humi">74</mark>%</p>

                    <p class="feels_like"><img src="images/icons/icon-feels_like.png"><b>Feels Like</b>
                        <br><mark class="preci">25.84</mark>%</p>
                    <br><br><br><br>

                    <p class="pressure"><img src="images/icons/icon-pressure.png"> <b>Pressure</b>
                        <br><mark class="press">1009</mark>mb</p>

                    <p class="wind_degree"><img src="images/icons/wind degree.png" style="background: none;"> <b>Wind
                            Degree</b>
                        <br><mark class="wind_d">190</mark></p>

                    <br><br><br><br>

                    <p class="wind_speed"><img src="images/icons/wind speed.png"> <b>Wind Speed</b>
                        <br><mark class="wind_s">6.2</mark>mi</p>

                    <p class="visibility"><img src="images/icons/visibility.png"> <b>Visibility</b>
                        <br><mark class="visible">5000</mark></p>
                </div>


                <!-- 3rd ROW BOX-->
                <div class="col-sm-4">
                    <br>
                    <div id="map" class="map" frameborder="0" allowfullscreen="" aria-hidden="false" tabindex="0"></div>
                    <br> <br> <br>
                </div>

            </div>
        </div>
        <br>



        <!--***********************************************************FORECAST BOX***********************************************************************-->

        <!-- FORECAST 5 BOXES-->
        <div class="w3-content" style="max-width:900px;">

            <div class="w3-row-padding" id="about">
                <div class="w3-third w3-margin-bottom">
                    <!-- FORECAST BOX 1-->
                    <div id="bx1" class="forecast-left" onclick="document.getElementById('id01').style.display='block'">
                        <P class="box1">SAT 12<br>
                            <img src="images/icons/03d.png" style="margin-top: 15px;"><br>
                            24&#176;c<br>23&#176;c</p>
                    </div>

                    <!-- FORECAST BOX 2-->
                    <div id="bx2" class="forecast-right"
                        onclick="document.getElementById('id01').style.display='block'">
                        <P class="box2">SUN 13<br>
                            <img src="images/icons/04d.png" style="margin-top: 15px;"><br>
                            31&#176;c<br>23&#176;c</p>
                    </div>
                    <br><br><br><br><br><br><br>
                </div>

                <div class="w3-third w3-margin-bottom">
                    <!-- FORECAST BOX 3-->
                    <div id="bx3" class="forecast-left" onclick="document.getElementById('id01').style.display='block'">
                        <P class="box3">MON 14<br>
                            <img src="images/icons/04d.png" style="margin-top: 15px;"><br>
                            27&#176;c<br>23&#176;c</p>
                    </div>

                    <!-- FORECAST BOX 4-->
                    <div id="bx4" class="forecast-right"
                        onclick="document.getElementById('id01').style.display='block'">
                        <P class="box4">TUE 15<br>
                            <img src="images/icons/01d.png" style="margin-top: 15px;"><br>
                            30&#176;c<br>23&#176;c</p>
                    </div>
                    <br><br><br><br><br><br><br>
                </div>

                <div class="w3-third w3-margin-bottom">
                    <!-- FORECAST BOX 5-->
                    <div id="bx5" class="forecast-left" onclick="document.getElementById('id01').style.display='block'">
                        <P class="box5">WED 16<br>
                            <img src="images/icons/04d.png" style="margin-top: 15px;"><br>
                            26&#176;c<br>23&#176;c</p>
                    </div>

                    <!-- FORECAST + BOX-->
                    <div id="bx6" class="forecast-right" onclick="open_fore_sidebox()" style="height: 155px">
                        <br><br>
                        <i style="font-size:24px;color: white" class="fa">&#xf067;</i>
                        <br><br><br>
                    </div>
                    <br><br><br><br><br><br><br>
                </div>
            </div>

        </div>



        <!--*****************************************************************ADDITIONAL DETAILS************************************************************************************-->

        <br><br><br>
        <!-- HEADING-->
        <h3 style="color: white;text-align: center;text-decoration: underline;">Additional Details</h3>
        <br>

        <div class="additional">

            <div class="w3-row">
                <div class="w3-col l3 s6">
                    <br><br>
                    <div class="w3-container">
                        <p><img src="images/icons/latitude.png" style="width: 25px"> <b>Latitude</b><br><mark
                                class="lat">11</mark>
                        </p>
                    </div>
                    <br><br>
                    <div class="w3-container">
                        <p><img src="images/icons/temp min.png" style="width: 25px"><b>Min-Temp</b><br><mark
                                class="min_temp">25</mark></p>
                    </div>
                </div>

                <div class="w3-col l3 s6">
                    <br><br>
                    <div class="w3-container">
                        <p><img src="images/icons/longitude.png" style="width: 25px"> <b>Longitude</b><br><mark
                                class="lon">76.9</mark></p>
                    </div>
                    <br><br>
                    <div class="w3-container">
                        <p><img src="images/icons/temp max.png" style="width: 25px"><b>Max-Temp</b><br><mark
                                class="max_temp">26</mark></p>
                    </div>
                </div>

                <div class="w3-col l3 s6">
                    <br><br>
                    <div class="w3-container">
                        <p><img src="images/icons/01d.png" style="width: 33px"><b>Sun - Rise</b><br><mark
                                class="sun_rise">06:11:40</mark></p>
                    </div>
                    <br><br>
                    <div class="w3-container">
                        <p><img src="images/icons/timezone.png" style="width: 25px"><b>Time-zone</b><br><mark
                                class="timezone">3600</mark></p>
                    </div>
                </div>

                <div class="w3-col l3 s6">
                    <br><br>
                    <div class="w3-container">
                        <p style="margin-top: 5px;"><img src="images/icons/moon.png" style="width: 20px"> <b>Sun -
                                Set</b><br><mark class="sun_set">18:36:21</mark></p>
                    </div>

                    <br><br>
                    <div class="w3-container">
                        <p style="margin-top: 5px;"><img src="images/icons/02d.png" style="width: 25px"><b>All
                                Clouds/Main</b><br><mark class="cloud_main">99 / Clouds</mark></p>
                    </div>
                </div>
            </div>
        </div><!-- END ADDITIONAL-->
        <br><br>




        <!--SIDEBAR SMALL FROM LEFT-->
        <div id="sidebar" class="sidebar">
            <p class="closesidebar" onclick="closesidebar()">&times;</p>
            <br><br>
            <a href="#">
                <p onclick="openairbox()">Air Pollution</p>
            </a>
            <a href="#">
                <p onclick="open_fore_sidebox()">Forecast</p>
            </a>
            <a href="#">
                <p onclick="open_mapbox()">Maps</p>
            </a>
            <a href="#">
                <p onclick="document.getElementById('alert_box').style.display='block';">City Alerts</p>
            </a>
            <a href="#">
                <p onclick="open_history_sidebox()">Historical Data</p>
            </a>
            <a href="/edit">
                <p>Profile</p>
            </a>
            <a href="/logout">
                <p>Logout</p>
            </a>
        </div>


        <!--***********************************************************AIR POLLUTION BOX***********************************************************************-->

        <div id="airbox" class="airbox">

            <button onclick="closeairbox()"
                style="float: right;background-color: yellow;width: 40px;height: 40px;font-size: 35px;margin-top:25px;margin-right: 20px;border: none;outline: 0;">
                <p style="margin-top: -10px;">&times;</p>
            </button>
            <br>
            <div class="air_additional" style="color: white;text-align: center;font-family: 'Segoe UI';">
                <br><br><br><br>
                <h2 style="font-weight: 600;">Air Pollution Data</h2>
                <br><br>
                <div class="w3-row">

                    <!--FIRST HALF-->
                    <div class="w3-col l3 s6">
                        <br><br>
                        <div class="w3-container">
                            <p><img src="images/icons/aqi.png" style="width: 25px"> <b>AQI</b><br><mark
                                    class="aqi">27</mark></p>
                        </div>
                        <br><br>
                        <div class="w3-container">
                            <p><img src="images/icons/mold level.png" style="width: 25px"> <b>Mold Level</b><br><mark
                                    class="mold_level">null</mark></p>
                        </div>
                    </div>

                    <div class="w3-col l3 s6">
                        <br><br>
                        <div class="w3-container">
                            <p><img src="images/icons/co.png" style="width: 25px"> <b>CO</b><br><mark
                                    class="co">437.26</mark></p>
                        </div>
                        <br><br>
                        <div class="w3-container">
                            <p><img src="images/icons/no2.png" style="width: 25px"> <b>NO2</b><br><mark
                                    class="no2">4.82495</mark></p>
                        </div>
                    </div>

                    <div class="w3-col l3 s6">
                        <br><br>
                        <div class="w3-container">
                            <p><img src="images/icons/o3.png" style="width: 23px"> <b>O3</b><br><mark
                                    class="o3">58.5616</mark></p>
                        </div>
                        <br><br>
                        <div class="w3-container">
                            <p><img src="images/icons/pm10.jpg" style="width: 25px"> <b>Pm 10</b><br><mark
                                    class="pm10">3.37937</mark>
                            </p>
                        </div>
                    </div>

                    <div class="w3-col l3 s6">
                        <br><br>
                        <div class="w3-container">
                            <p style="margin-top: 5px;"><img src="images/icons/so2.png" style="width: 25px">
                                <b>SO2</b><br><mark class="so2">1.43237</mark></p>
                        </div>

                        <br><br>
                        <div class="w3-container">
                            <p style="margin-top: 5px;"><img src="images/icons/pm25.png" style="width: 25px"> <b>Pm
                                    25</b><br><mark class="pm25">1.16384</mark></p>
                        </div>
                    </div>



                    <!--SECOND HALF-->
                    <div class="w3-col l3 s6">
                        <br><br>
                        <div class="w3-container">
                            <p><img src="images/icons/grass.png" style="width: 25px"> <b>Pollen Level Grass</b><br><mark
                                    class="grass">null</mark>
                            </p>
                        </div>
                        <br><br>

                        <div class="w3-container">
                            <p><img src="images/icons/state code.png" style="width: 25px"> <b>State Code</b><br><mark
                                    class="state_code">20</mark>
                            </p>
                        </div>
                    </div>

                    <div class="w3-col l3 s6">
                        <br><br>
                        <div class="w3-container">
                            <p><img src="images/icons/weed.png" style="width: 25px"> <b>Pollen Level Weed</b><br><mark
                                    class="weed">null</mark></p>
                        </div>
                    </div>

                    <div class="w3-col l3 s6">
                        <br><br>
                        <div class="w3-container">
                            <p><img src="images/icons/tree.png" style="width: 25px"> <b>Pollen Level Tree</b><br><mark
                                    class="tree">null</mark></p>
                        </div>
                    </div>

                    <div class="w3-col l3 s6">
                        <br><br>
                        <div class="w3-container">
                            <p style="margin-top: 5px;"><img src="images/icons/predom.png" style="width: 25px">
                                <b>Predominant Pollen
                                    Type</b><br><mark class="predom">1.43237</mark></p>
                        </div>
                    </div>

                </div>
                <!--ROW END-->
            </div><!-- End ADDITIONAL DETAILS -->
        </div>
        <!--END AIR BOX-->



        <!--***************************************************** 16 DAYS FORECAST PAGE BOX ***********************************************************************-->

        <div id="fore_sidebox" class="fore_sidebox">

            <button onclick="close_fore_sidebox()"
                style="float: right;background-color: yellow;width: 40px;height: 40px;font-size: 35px;margin-top:25px;margin-right: 20px;border: none;outline: 0;">
                <p style="margin-top: -10px;">&times;</p>
            </button>

            <br>

            <div class="air_additional" style="color: white;text-align: center;font-family: 'Segoe UI';">
                <br><br><br><br>
                <h2 style="font-weight: 600;">Forecasting</h2>
                <p style="font-family: verdana;color: orange">Note: The Forecating is available only for 16 days from
                    the
                    current date</p>
                <br>

                <div class="wrapper wrapper--w680" style="text-align: center;">
                    <div class="card card-1">
                        <div class="card-body">

                            <div class="input-group">
                                <input class="input--style-1 js-datepicker" id="forecast_inpt" autocomplete="off"
                                    type="text" placeholder="DD/MM/YY">
                                <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                            </div>

                            <button class="btn danger" id="forecastbtn">Submit</button>

                        </div>
                    </div>
                </div>
            </div>
        </div><!--END OF FORECAST BOX-->






        <!--*****************************************************ALERT BOX***********************************************************************-->

        <div id="alert_box" class="w3-modal w3-animate-opacity">
            <div class="w3-modal-content" style="padding:32px;">
                <div class="w3-container w3-white">
                    <i onclick="document.getElementById('alert_box').style.display='none'"
                        class="fa fa-remove w3-transparent w3-button w3-xlarge w3-right"></i>
                    <h2 style="text-align: center;text-decoration: underline">Alert</h2>

                    <p class="heading">Title:</p>
                    <p class="title_alert">Null</p>

                    <p class="heading">Description:</p>
                    <p class="description_alert">Null</p>

                    <p class="heading">Severity:</p>
                    <p class="severity">Null</p>

                    <p class="heading">Effective UTC:</p>
                    <p class="effective_utc">Null</p>

                    <p class="heading">Effective Local:</p>
                    <p class="effective_local">Null</p>

                    <p class="heading">Expires Local:</p>
                    <p class="expires_local">Null</p>

                    <p class="heading">Expires UTC:</p>
                    <p class="expires_utc">Null</p>

                    <p class="heading">URL:</p>
                    <p class="url">Null</p>

                    <p class="heading">Regions:</p>
                    <p class="regions">Null</p>

                </div>
            </div>
        </div>




        <!--***********************************************HISTORICAL DATA FOR PREVIOUS 5 DAYS BOX***********************************************************************-->

        <div id="history_sidebox" class="history_sidebox">

            <button onclick="close_history_sidebox()"
                style="float: right;background-color: yellow;width: 40px;height: 40px;font-size: 35px;margin-top:25px;margin-right: 20px;border: none;outline: 0;">
                <p style="margin-top: -10px;">&times;</p>
            </button>

            <br>
            <div class="air_additional" style="color: white;text-align: center;font-family: 'Segoe UI';">
                <br><br><br><br>
                <h2 style="font-weight: 600;">Historical Data</h2>
                <p style="font-family: verdana;color: orange">Note: The Historical Data is available for Previous 5 days
                    from the
                    current date</p>
                <br>

                <div class="wrapper wrapper--w680" style="text-align: center;">
                    <div class="card card-1">
                        <div class="card-body">
                            <div class="input-group">
                                <input class="input--style-1 js-datepicker" id="history_inpt" autocomplete="off"
                                    type="text" placeholder="DD/MM/YY">
                                <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                            </div>
                            <button class="btn danger" id="historybtn" >Submit</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--END OF HISTORICAL DATA BOX-->




        <!--*****************************************************************FORECAST LARGE BOX id01************************************************************************************-->

        <div id="id01" class="fore_box">
            <div class="fore_box-content forebox_animate">

                <div class="image_container">
                    <span onclick="document.getElementById('id01').style.display='none'"
                        class="close_forebox">&times;</span>
                </div>

                <div class="container">
                    <br><br>

                    <!-- FIRST HALF -->
                    <div class="container" style="max-width: 80%;font-family: Segoe UI;">
                        <div class="row first">
                            <div class="col-sm-4 feels_temp">
                                <br>
                                <p><b>Feels Like</b></p>
                                <p class="feel_temp">Morn: <mark class="feel_morn">31</mark>&deg;c<br>
                                    After: <mark class="feel_after">31</mark>&deg;c<br>
                                    Even: <mark class="feel_even">30</mark>&deg;c<br>
                                    Night: <mark class="feel_night">30</mark>&deg;c</p>

                            </div>

                            <div class="col-sm-4">
                                <br><br>
                                <p class="fore_D-M-Y">Saturday, 15 August 2020</p>
                                <p class="fore_temperature"><mark class="fore_temp">27</mark><mark
                                        style="background:none;color: white;margin-left: -15px">°c</mark><img
                                        id="fore_icon" class="temp_img" style="margin-left: -5px"
                                        src="images/icons/01d.png"></p>
                                <p class="fore_desc">haze</p>
                            </div>

                            <div class="col-sm-4 feels_temp">
                                <br>
                                <p><b>Temperature</b></p>
                                <p class="feel_temp">Morn: <mark class="temp_morn">25</mark>&deg;c<br>
                                    After: <mark class="temp_after">29</mark>&deg;c<br>
                                    Even: <mark class="temp_even">25</mark>&deg;c<br>
                                    Night: <mark class="temp_night">34</mark>&deg;c</p>
                            </div>
                        </div>
                    </div>



                    <!-- SECOND HALF -->

                    <div class="fore_additional">

                        <div class="w3-row">

                            <div class="w3-col l3 s6">
                                <br><br>
                                <div class="w3-container">
                                    <p><img src="images/icons/icon-humidity.png" style="width: 25px">
                                        <b>Humidity</b><br><mark class="fore_humi">72</mark>%</p>
                                </div>
                                <br><br>
                                <div class="w3-container">
                                    <p><img src="images/icons/icon-pressure.png"
                                            style="width: 20px"><b>Pressure</b><br><mark
                                            class="fore_press">1006</mark>hpa</p>
                                </div>
                            </div>

                            <div class="w3-col l3 s6">
                                <br><br>
                                <div class="w3-container">
                                    <p><img src="images/icons/icon-feels_like.png" style="width: 30px"> <b>Feels
                                            Like</b><br><mark class="fore_feels">24</mark>&deg;c</p>
                                </div>
                                <br><br>
                                <div class="w3-container">
                                    <p><img src="images/icons/wind degree.png" style="width: 20px"><b>Wind
                                            Degree</b><br><mark class="fore_wind_d">249</mark>&deg;N</p>
                                </div>
                            </div>

                            <div class="w3-col l3 s6">
                                <br><br>
                                <div class="w3-container">
                                    <p><img src="images/icons/01d.png" style="width: 33px"><b>Sun-Rise</b><br><mark
                                            class="fore_sun_rise">06:10:51</mark>
                                    </p>
                                </div>
                                <br><br>
                                <div class="w3-container">
                                    <p><img src="images/icons/wind speed.png" style="width: 20px"><b>Wind
                                            spd</b><br><mark class="fore_wind_s">7</mark>m/s
                                    </p>
                                </div>
                            </div>

                            <div class="w3-col l3 s6">
                                <br><br>
                                <div class="w3-container">
                                    <p style="margin-top: 5px;"><img src="images/icons/moon.png" style="width: 20px">
                                        <b>Sun -
                                            Set</b><br><mark class="fore_sun_set">18:45:30</mark></p>
                                </div>

                                <br><br>
                                <div class="w3-container">
                                    <p style="margin-top: 5px;"><img src="images/icons/visibility.png"
                                            style="width: 20px"><b>Visible</b><br><mark class="fore_visi">null</mark>
                                    </p>
                                </div>
                            </div>

                            <!--******************************************************************************************-->

                            <div class="w3-col l3 s6">
                                <br><br>
                                <div class="w3-container">
                                    <p><img src="images/icons/dew.png" style="width: 23px"> <b>Dew.Pt</b><br><mark
                                            class="fore_dew">20</mark>&deg;c</p>
                                </div>
                                <br><br>
                                <div class="w3-container">
                                    <p><img src="images/icons/temp min.png" style="width: 20px"><b> Min
                                            Temp</b><br><mark class="fore_min_t">23</mark>&deg;c</p>
                                </div>
                            </div>

                            <div class="w3-col l3 s6">
                                <br><br>
                                <div class="w3-container">
                                    <p><img src="images/icons/preci.png" style="width: 23px"> <b>POP</b><br><mark
                                            class="fore_pop">0.58</mark>%</p>
                                </div>
                                <br><br>
                                <div class="w3-container">
                                    <p><img src="images/icons/temp max.png" style="width: 20px"><b>Max Temp</b><br><mark
                                            class="fore_max_t">28</mark>&deg;c</p>
                                </div>
                            </div>

                            <div class="w3-col l3 s6">
                                <br><br>
                                <div class="w3-container">
                                    <p><img src="images/icons/04d.png" style="width: 25px"><b>Clouds</b><br><mark
                                            class="fore_clouds">75</mark>%
                                    </p>
                                </div>
                                <br><br>
                                <div class="w3-container">
                                    <p><img src="images/icons/uvi.png" style="width: 20px"><b> Uvi</b><br><mark
                                            class="fore_uvi">13</mark>
                                    </p>
                                </div>
                            </div>

                            <div class="w3-col l3 s6">
                                <br><br>
                                <div class="w3-container">
                                    <p style="margin-top: 5px;"><img src="images/icons/10d.png" style="width: 25px">
                                        <b>Rain</b><br><mark class="fore_rain">1</mark>mm</p>
                                </div>

                                <br><br>
                                <div class="w3-container">
                                    <p style="margin-top: 5px;"><img src="images/icons/02d.png" style="width: 23px;"><b>
                                            Main</b><br><mark class="fore_main">Clouds</mark></p>
                                </div>
                            </div>


                        </div><!--END row-->
                        <br>
                    </div><!--END container-->
                </div>
            </div>
        </div>



        <!--*****************************************************************FORECAST LARGE BOX ID id02************************************************************************************-->


        <div id="id02" class="fore_box">

            <div class="fore_box-content forebox_animate" action="/action_page.php" method="post">

                <div class="image_container">
                    <span onclick="document.getElementById('id02').style.display='none'"
                        class="close_forebox">&times;</span>

                </div>

                <div class="container">
                    <br><br>

                    <!--FIRST HALF-->
                    <div class="container" style="max-width: 80%;font-family: Segoe UI;">
                        <div class="row first">
                            <div class="col-sm-4 feels_temp">
                                <br>
                                <p><b>Clouds Description</b></p>
                                <p class="feel_temp">Clouds: <mark class="clouds">51</mark>%<br>
                                    low: <mark class="clouds_low">28</mark>%<br>
                                    mid: <mark class="clouds_mid">19</mark>%<br>
                                    high: <mark class="clouds_high">26</mark>%</p>
                            </div>

                            <div class="col-sm-4">
                                <br><br>
                                <p class="fore_D-M-Y">Saturday, 15 August 2020</p>
                                <p class="fore_temperature"><mark class="fore_temp">26</mark><mark
                                        style="background:none;color: white;margin-left: -15px">°c</mark><img
                                        id="fore_icon" class="temp_img" style="margin-left: -5px"
                                        src="images/icons/01d.png"></p>
                                <p class="fore_desc">haze</p>
                            </div>


                            <div class="col-sm-4 feels_temp">
                                <br>
                                <p><b>Temperature</b></p>
                                <p class="feel_temp">Morn: <mark class="min_temp">25</mark>&deg;c<br>
                                    After: <mark class="max_tempr">29</mark>&deg;c<br>
                                    Even: <mark class="app_max_temp">25</mark>&deg;c<br>
                                    Night: <mark class="app_min_temp">34</mark>&deg;c</p>
                            </div>
                        </div>
                    </div>

                    <!--SECOND HALF-->
                    <div class="fore_additional">
                        <div class="w3-row">
                            <div class="w3-col l3 s6">
                                <br><br>
                                <div class="w3-container">
                                    <p><img src="images/icons/icon-humidity.png" style="width: 25px">
                                        <b>Humidity</b><br><mark class="fore_humi">72</mark>%</p>
                                </div>
                                <br><br>
                                <div class="w3-container">
                                    <p><img src="images/icons/icon-pressure.png"
                                            style="width: 20px"><b>Pressure</b><br><mark
                                            class="fore_press">1006</mark>hpa</p>
                                </div>
                            </div>

                            <div class="w3-col l3 s6">
                                <br><br>
                                <div class="w3-container">
                                    <p><img src="images/icons/icon-feels_like.png" style="width: 30px">
                                        <b>precipitation</b><br><mark class="fore_perci">24</mark>&deg;c</p>
                                </div>
                                <br><br>
                                <div class="w3-container">
                                    <p><img src="images/icons/wind degree.png" style="width: 20px"><b>Wind
                                            Degree</b><br><mark class="fore_wind_d">249</mark></p>
                                </div>
                            </div>

                            <div class="w3-col l3 s6">
                                <br><br>
                                <div class="w3-container">
                                    <p><img src="images/icons/01d.png" style="width: 33px"><b>Sun-Rise</b><br><mark
                                            class="fore_sun_rise">06:10:51</mark>
                                    </p>
                                </div>
                                <br><br>
                                <div class="w3-container">
                                    <p><img src="images/icons/wind speed.png" style="width: 20px"><b>Wind
                                            spd</b><br><mark class="fore_wind_s">7</mark>m/s
                                    </p>
                                </div>
                            </div>

                            <div class="w3-col l3 s6">
                                <br><br>
                                <div class="w3-container">
                                    <p style="margin-top: 5px;"><img src="images/icons/moon.png" style="width: 20px">
                                        <b>Sun -
                                            Set</b><br><mark class="fore_sun_set">18:45:30</mark></p>
                                </div>

                                <br><br>
                                <div class="w3-container">
                                    <p style="margin-top: 5px;"><img src="images/icons/visibility.png"
                                            style="width: 20px"><b>Visible</b><br><mark class="fore_visi">21</mark>km
                                    </p>
                                </div>
                            </div>

                            <!--******************************************************************************************-->

                            <div class="w3-col l3 s6">
                                <br><br>
                                <div class="w3-container">
                                    <p><img src="images/icons/dew.png" style="width: 23px"> <b>Dew.Pt</b><br><mark
                                            class="fore_dew">20</mark>&deg;c</p>
                                </div>
                                <br><br>
                                <div class="w3-container">
                                    <p><img src="images/icons/temp min.png" style="width: 20px"><b> Min
                                            Temp</b><br><mark class="fore_min_t">23</mark>&deg;c</p>
                                </div>
                            </div>

                            <div class="w3-col l3 s6">
                                <br><br>
                                <div class="w3-container">
                                    <p><img src="images/icons/preci.png" style="width: 23px"> <b>POP</b><br><mark
                                            class="fore_pop">0.58</mark>%</p>
                                </div>
                                <br><br>
                                <div class="w3-container">
                                    <p><img src="images/icons/temp max.png" style="width: 20px"><b>Max Temp</b><br><mark
                                            class="fore_max_t">28</mark>&deg;c</p>
                                </div>
                            </div>

                            <div class="w3-col l3 s6">
                                <br><br>
                                <div class="w3-container">
                                    <p><img src="images/icons/o3.png" style="width: 25px"><b>Ozone</b><br><mark
                                            class="fore_ozone">75</mark>%
                                    </p>
                                </div>
                                <br><br>
                                <div class="w3-container">
                                    <p><img src="images/icons/uvi.png" style="width: 20px"><b> Uvi</b><br><mark
                                            class="fore_uvi">13</mark>
                                    </p>
                                </div>
                            </div>

                            <div class="w3-col l3 s6">
                                <br><br>
                                <div class="w3-container">
                                    <p style="margin-top: 5px;"><img src="images/icons/13d.png" style="width: 25px">
                                        <b>Snow</b><br><mark class="fore_snow">1</mark>mm</p>
                                </div>

                                <br><br>
                                <div class="w3-container">
                                    <p style="margin-top: 5px;"><img src="images/icons/02d.png"
                                            style="width: 23px;"><b>Moon
                                            Phase</b><br><mark class="fore_moon_phase">0</mark></p>
                                </div>
                            </div>

                        </div><!--row-->
                        <br>
                    </div><!--container-->
                </div>
            </div>
        </div>


        <!--*****************************************************************LARGER MAP************************************************************************************-->
        
        <div id="mapbox" class="mapbox">
            <button onclick="close_mapbox()"
                style="float: right;background-color: yellow;width: 40px;height: 40px;font-size: 35px;margin-top:25px;margin-right: 20px;border: none;outline: 0;">
                <p style="margin-top: -10px;">&times;</p>
            </button>
            <br><br><br><br>

            <div class="two" style="background-color: white;height: 600px;width: 1600px">
                <div id="map_large" class="map_large" frameborder="0" allowfullscreen="" aria-hidden="false"
                    tabindex="0" style="height: 100%;width: 100%"></div>
            </div>
        </div>



        <!--CHANGE BACKGROUND IMAGE ACCORDING TO USER REQUESTED CITY FROM DATABASE-->
        <input type="hidden" id="cities" value="${sessionScope.city}" />




    </div><!--END OF BACKGROUND IMAGE-->

    <!--JAVASCRIPT PAGE-->
    <script src="JS/main.js"></script>
    <!-- Jquery JS-->
    <script src="JS/forecast/jquery/jquery.min.js"></script>
    <!-- DATE PICKER forecast JS-->
    <script src="JS/forecast/datepicker/moment.min.js"></script>
    <script src="JS/forecast/datepicker/daterangepicker.js"></script>

    <!-- DATE BUILD Main JS-->
    <script src="JS/forecast/forecast_datebuild.js"></script>
</body>




</html>

<%-- 

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>


<% String temp1 = null;
	Statement statement = null;
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3308/virtusa","root","");
	statement = connection.createStatement(); 
	String name = (String) session.getAttribute("email");
	String query = "SELECT * FROM reg where email='"+name+"';" ;
	ResultSet resultset = statement.executeQuery(query); 
	       
	        while(resultset.next()){ 
	        temp1 = resultset.getString(5);
	       	} 
	       	%>

--%>
