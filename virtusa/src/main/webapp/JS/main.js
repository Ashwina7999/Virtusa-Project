//OPEN WEATHER MAP API
const api = {
    key: "d83f650ab69024255a3ea1f819ddb171",
    base: "https://api.openweathermap.org/data/2.5/"
}

//WEATHER BIT API
const wb_api = {
    key: "d398358203ce4cdfa7523fc2141161cb",
    base: "https://api.weatherbit.io/v2.0/"
}




$(document).ready(function () {
    const searchbox = document.querySelector('.search-box');
    $(searchbox).keyup(function (evt) {
        if (evt.keyCode == 13) {
            getResults(searchbox.value);
        }

    });



    function getResults(query) {


        //CURRENT WEATHER
        $.ajax({
            url: `${api.base}weather?q=${query}&units=metric&APPID=${api.key}`, success: function (result) {
                displayResults(result);
            }
        });

        //AIR QUALITY
        //$.ajax({
            //url: `${wb_api.base}current/airquality?city=${query}&key=${wb_api.key}`, success: function (air) {
                //air_pollution(air);
            //}
        //});


        //DAILY FORECAST 16 DAYS
        $.ajax({
            url: `${wb_api.base}forecast/daily?city=${query}&units=metric&key=${wb_api.key}`, success: function (result) {
                fcast = result;
                daily_forecast_bit(result);

            }
        });


        //ALERT BOX
        $.ajax({
            url: `${wb_api.base}alerts?city=${query}&key=${wb_api.key}`, success: function (alert) {
                alert_open(alert);
            }
        });


    }



    function displayResults(weather) {

        console.log(weather);

		//DAILY FORECAST 7 DAYS
        $.ajax({
            url: `${api.base}onecall?lat=${weather.coord.lat}&lon=${weather.coord.lon}&units=metric&exclude=current,hourly&appid=${api.key}`, success: function (forecast) {
                console.log(forecast);
                daily_forecast(forecast);

            }
        });





        //GOOGLE MAP
		var map_large = new mapboxgl.Map({
			container: 'map_large', // container id
    		style: 'mapbox://styles/mapbox/streets-v11',
    		center: { lat: `${weather.coord.lat}`, lng: `${weather.coord.lon}` }, // starting position
    		zoom: 9 // starting zoom
		});
		var map = new mapboxgl.Map({
    		container: 'map', // container id
    		style: 'mapbox://styles/mapbox/streets-v11',
    		center: { lat: `${weather.coord.lat}`, lng: `${weather.coord.lon}` }, // starting position
    		zoom: 9 // starting zoom
		});



        //CITY
        $(".city").text(`${weather.name}`);


        //DATE-MONTH-YEAR
        let now = new Date();
        $(".D-M-Y").text(dateBuilder(now));

        function dateBuilder(d) {
            let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
            let days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
            let dates = ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10",
                "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
                "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"]
            let day = days[d.getDay()];
            let date = dates[d.getDate()];
            let month = months[d.getMonth()];
            let year = d.getFullYear();

            return `${day}, ${date} ${month} ${year}`;
        }


        //COUNTRY
        $(".country").text(`${weather.sys.country}`);



        $('.temp').text(Math.round(weather.main.temp));
        var iconcode = weather.weather[0].icon;
        var icon = "images/icons/" + iconcode + ".png";
        $('#icon').attr('src', icon);


        //BACKGROUND IMAGES
        let bgimg = document.querySelector('.bgimg');
        var desc = weather.weather[0].description;
        if (iconcode == "01d" || iconcode == "01n") {
            bgimg.style.backgroundImage = "url('images/bg/clear sky.jpg')";
        }
        else if (iconcode == "02d" || iconcode == "02n") {
            bgimg.style.backgroundImage = "url('images/bg/few clouds.jpg')";
        }
        else if (iconcode == "03d" || iconcode == "03n") {
            bgimg.style.backgroundImage = "url('images/bg/scattered clouds.jpg')";
        }
        else if (iconcode == "04d" || iconcode == "04n") {
            if (desc == "broken clouds") {
                bgimg.style.backgroundImage = "url('images/bg/broken clouds.jpg')";
            }
            else if (desc == "overcast clouds") {
                bgimg.style.backgroundImage = "url('images/bg/overcast clouds.jpg')";
            }

        }
        else if (iconcode == "09d" || iconcode == "09n") {
            if (desc == "heavy intensity shower rain") {
                bgimg.style.backgroundImage = "url('images/bg/rain1.jpg')";
            }

            else {
                bgimg.style.backgroundImage = "url('images/bg/rain2.jpg')";
            }
        }

        else if (iconcode == "10d" || iconcode == "10n") {
            if (desc == "heavy intensity rain" || desc == "very heavy rain" || desc == "extreme rain") {
                bgimg.style.backgroundImage = "url('images/bg/rain1.jpg')";
            }
            else {
                bgimg.style.backgroundImage = "url('images/bg/rain2.jpg')";
            }
        }
        else if (iconcode == "11d" || iconcode == "11n") {
            bgimg.style.backgroundImage = "url('images/bg/thunderstorm.jpg')";
        }
        else if (iconcode == "13d" || iconcode == "13n") {
            bgimg.style.backgroundImage = "url('images/bg/snow.jpg')";
        }
        else if (iconcode == "50d" || iconcode == "50n") {
            if (desc == "mist") {
                bgimg.style.backgroundImage = "url('images/bg/mist.jpg')";
            }
            else if (desc == "haze") {
                bgimg.style.backgroundImage = "url('images/bg/haze.jpg')";
            }
            else {
                bgimg.style.backgroundImage = "url('images/bg/mist_haze.jpg')";
            }

        }


        //DESCRIPTION
        $(".description").text(`${weather.weather[0].description}`);


        //HUMIDITY
        $(".humi").text(`${weather.main.humidity}`);


        //PRECIPITATION
        $(".preci").text(`${weather.main.feels_like}`);


        //PRESSURE
        $(".press").text(`${weather.main.pressure}`);


        //WIND DEGREE
        $(".wind_d").text(`${weather.wind.deg}`);


        //WIND SPEED
        $(".wind_s").text(`${weather.wind.speed}`);


        //VISIBILITY
        $(".visible").text(`${weather.visibility}`);





        //LATITUDE
        $(".lat").text(`${weather.coord.lat}`);


        //LONGITUDE
        $(".lon").text(`${weather.coord.lon}`);


        //MINIMUM TEMPERATURE
        $(".min_temp").text(`${weather.main.temp_min}`);


        //MAXIMUM TEMPERATURE
        $(".max_temp").text(`${weather.main.temp_max}`);


        //SUN RISE & //SUN SET
        $(".sun_rise").text(sun_rise_set(`${weather.sys.sunrise}`));
        $(".sun_set").text(sun_rise_set(`${weather.sys.sunset}`));

        function sun_rise_set(t) {
            var date = new Date(t * 1000);
            var time = date.toLocaleTimeString();
            return `${time}`;
        }


        //TIMEZONE
        $(".timezone").text(`${weather.timezone}`);


        //CLOUDS/MAIN
        $(".cloud_main").text(`${weather.clouds.all} / ${weather.weather[0].main}`);





    }//CURRENT WEATHER END


});



//************************************************************* */

var fcast = '';
var fdate = generate(new Date());

function castmore() {
    let fin = document.getElementById('inpt');
    fdate = fin.value;
    console.log("Submit " + fdate);
    daily_forecast_bit(fcast);
};


function generate(now) {
    let months = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"];
    let dates = ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10",
        "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
        "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"]

    let date = dates[now.getDate()];
    let month = months[now.getMonth()];
    let year = now.getFullYear();
    return `${date}/${month}/${year}`


}
//*************************************************************







//******************************************************************************************************************************************************************* */
//                                                                              DAILY FORECAST   



function daily_forecast(forecast) {



    //BOX 1
    let box1 = document.querySelector('.box1');
    let fore1 = foreBuilder(new Date(`${forecast.daily[1].dt}` * 1000));
    const icon1 = forefind(fore1, `${forecast.daily[1].weather[0].icon}`, `${Math.round(forecast.daily[1].temp.day)}`, `${Math.round(forecast.daily[1].temp.min)}`, box1);



    //BOX 2
    let box2 = document.querySelector('.box2');
    let fore2 = foreBuilder(new Date(`${forecast.daily[2].dt}` * 1000));
    const icon2 = forefind(fore2, `${forecast.daily[2].weather[0].icon}`, `${Math.round(forecast.daily[2].temp.day)}`, `${Math.round(forecast.daily[2].temp.min)}`, box2);


    //BOX 3
    let box3 = document.querySelector('.box3');
    let fore3 = foreBuilder(new Date(`${forecast.daily[3].dt}` * 1000));
    const icon3 = forefind(fore3, `${forecast.daily[3].weather[0].icon}`, `${Math.round(forecast.daily[3].temp.day)}`, `${Math.round(forecast.daily[3].temp.min)}`, box3);


    //BOX 4
    let box4 = document.querySelector('.box4');
    let fore4 = foreBuilder(new Date(`${forecast.daily[4].dt}` * 1000));
    const icon4 = forefind(fore4, `${forecast.daily[4].weather[0].icon}`, `${Math.round(forecast.daily[4].temp.day)}`, `${Math.round(forecast.daily[4].temp.min)}`, box4);


    //BOX 5
    let box5 = document.querySelector('.box5');
    let fore5 = foreBuilder(new Date(`${forecast.daily[5].dt}` * 1000));
    const icon5 = forefind(fore5, `${forecast.daily[5].weather[0].icon}`, `${Math.round(forecast.daily[5].temp.day)}`, `${Math.round(forecast.daily[5].temp.min)}`, box5);



    function foreBuilder(d) {
        let days = ["SUN", "MON", "TUE", "WED", "THUR", "FRI", "SAT"];
        let dates = ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10",
            "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
            "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"]
        let day = days[d.getDay()];
        let date = dates[d.getDate()];
        return `${day} ${date}`;
    }


    function forefind(fore, icon, max, min, box) {
        if (icon == "01d" || icon == "01n") {
            box.innerHTML = `${fore}<br><img src="images/icons/01d.png" style="margin-top: 15px;"><br>${max}&#176;c<br>${min}&#176;c`;
        }
        else if (icon == "02d" || icon == "02n") {
            box.innerHTML = `${fore}<br><img src="images/icons/02d.png" style="margin-top: 15px;"><br>${max}&#176;c<br>${min}&#176;c`;
        }
        else if (icon == "03d" || icon == "03n") {
            box.innerHTML = `${fore}<br><img src="images/icons/03d.png" style="margin-top: 15px;"><br>${max}&#176;c<br>${min}&#176;c`;
        }
        else if (icon == "04d" || icon == "04n") {
            box.innerHTML = `${fore}<br><img src="images/icons/04d.png" style="margin-top: 15px;"><br>${max}&#176;c<br>${min}&#176;c`;
        }
        else if (icon == "09d" || icon == "09n") {
            box.innerHTML = `${fore}<br><img src="images/icons/09d.png" style="margin-top: 15px;"><br>${max}&#176;c<br>${min}&#176;c`;
        }
        else if (icon == "10d" || icon == "10n") {
            box.innerHTML = `${fore}<br><img src="images/icons/10d.png" style="margin-top: 15px;"><br>${max}&#176;c<br>${min}&#176;c`;
        }
        else if (icon == "11d" || icon == "11n") {
            box.innerHTML = `${fore}<br><img src="images/icons/11d.png" style="margin-top: 15px;"><br>${max}&#176;c<br>${min}&#176;c`;
        }
        else if (icon == "13d" || icon == "13n") {
            box.innerHTML = `${fore}<br><img src="images/icons/13d.png" style="margin-top: 15px;"><br>${max}&#176;c<br>${min}&#176;c`;
        }
        else if (icon == "50d" || icon == "50n") {
            box.innerHTML = `${fore}<br><img src="images/icons/50d.png" style="margin-top: 15px;"><br>${max}&#176;c<br>${min}&#176;c`;
        }


    }



    $("#bx1").click({ val: 1 }, which_box);
    $("#bx2").click({ val: 2 }, which_box);
    $("#bx3").click({ val: 3 }, which_box);
    $("#bx4").click({ val: 4 }, which_box);
    $("#bx5").click({ val: 5 }, which_box);



    function which_box(event) {

        let num = event.data.val;

        console.log(num);


        $(".feel_morn").text(Math.round(forecast.daily[num].feels_like.morn));
        $(".feel_after").text(Math.round(forecast.daily[num].feels_like.day));
        $(".feel_even").text(Math.round(forecast.daily[num].feels_like.eve));
        $(".feel_night").text(Math.round(forecast.daily[num].feels_like.night));


        let fore = new Date(forecast.daily[num].dt * 1000);
        $(".fore_D-M-Y").text(dateBuilder(fore));


        $(".fore_temp").text(Math.round(forecast.daily[num].temp.day));

        var fore_iconcode = `${forecast.daily[num].weather[0].icon}`
        var fore_icon = "images/icons/" + fore_iconcode + ".png";
        $('#fore_icon').attr('src', fore_icon);


        $(".fore_desc").text(`${forecast.daily[num].weather[0].description}`);


        function dateBuilder(d) {
            let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
            let days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
            let dates = ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10",
                "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
                "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"]
            let day = days[d.getDay()];
            let date = dates[d.getDate()];
            let month = months[d.getMonth()];
            let year = d.getFullYear();

            return `${day}, ${date} ${month} ${year}`;
        }



        $(".temp_morn").text(Math.round(forecast.daily[num].temp.morn));
        $(".temp_after").text(Math.round(forecast.daily[num].temp.day));
        $(".temp_even").text(Math.round(forecast.daily[num].temp.eve));
        $(".temp_night").text(Math.round(forecast.daily[num].temp.night));


        $(".fore_humi").text(Math.round(forecast.daily[num].humidity));

        $(".fore_press").text(forecast.daily[num].pressure);

        $(".fore_feels").text(Math.round(forecast.daily[num].feels_like.day));

        $(".fore_wind_d").text(Math.round(forecast.daily[num].wind_deg));

        $(".fore_sun_rise").text(sun_rise_set(forecast.daily[num].sunrise));

        $(".fore_wind_s").text(Math.round(forecast.daily[num].wind_speed));

        $(".fore_sun_set").text(sun_rise_set(forecast.daily[num].sunset));

        function sun_rise_set(t) {
            var date = new Date(t * 1000);
            var time = date.toLocaleTimeString();
            return `${time}`;
        }




        /**********************************************************/


        $(".fore_dew").text(Math.round(forecast.daily[num].dew_point));

        $(".fore_pop").text(forecast.daily[num].pop);

        $(".fore_min_t").text(Math.round(forecast.daily[num].temp.min));

        $(".fore_max_t").text(Math.round(forecast.daily[num].temp.max));

        $(".fore_clouds").text(forecast.daily[num].clouds);

        $(".fore_rain").text(Math.round(forecast.daily[num].rain));

        $(".fore_uvi").text(Math.round(forecast.daily[num].uvi));

        $(".fore_main").text(forecast.daily[num].weather[0].main);


    }//FUNCTION

}



function daily_forecast_bit(forecast) {


    console.log(forecast);


    var user_dmy = fdate;
    console.log("Date " + user_dmy);
    var i; var t = 0;
    // let [year, month, date] = forecast.data[0].valid_date.split("-")
    // var current_dmy = date + "/" + month + "/" + year;

    for (i = 0; i < 16; i++) {

        let [year, month, date] = forecast.data[i].valid_date.split("-")
        var fore_dmy = date + "/" + month + "/" + year;

        if (fore_dmy == user_dmy) {
            t = t + 1;
            console.log("forecast date matched", i);

            curr_date = generate(new Date());
            console.log("current date", curr_date);
            console.log("user date", user_dmy);
            if (curr_date != user_dmy) {
                document.getElementById('id02').style.display = 'block';
            }






            $(".clouds").text(Math.round(forecast.data[i].clouds));
            $(".clouds_low").text(Math.round(forecast.data[i].clouds_low));
            $(".clouds_mid").text(Math.round(forecast.data[i].clouds_mid));
            $(".clouds_high").text(Math.round(forecast.data[i].clouds_hi));


            let fore = new Date(forecast.data[i].ts * 1000);
            $(".fore_D-M-Y").text(dateBuilder(fore));


            $(".fore_temp").text(Math.round(forecast.data[i].temp));

            // var fore_iconcode = `${forecast.daily[num].weather[0].icon}`
            // var fore_icon = "images/icons/" + fore_iconcode + ".png";
            // $('#fore_icon').attr('src', fore_icon);


            $(".fore_desc").text(`${forecast.data[i].weather.description}`);


            function dateBuilder(d) {
                let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
                let days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
                let dates = ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10",
                    "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
                    "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"]
                let day = days[d.getDay()];
                let date = dates[d.getDate()];
                let month = months[d.getMonth()];
                let year = d.getFullYear();

                return `${day}, ${date} ${month} ${year}`;
            }



            $(".low_temp").text(Math.round(forecast.data[i].low_temp));
            $(".high_temp").text(Math.round(forecast.data[i].high_temp));
            $(".app_max_temp").text(Math.round(forecast.data[i].app_max_temp));
            $(".app_min_temp").text(Math.round(forecast.data[i].app_min_temp));



            $(".fore_humi").text(Math.round(forecast.data[i].rh));

            $(".fore_press").text(Math.round(forecast.data[i].pres));

            $(".fore_perci").text(Math.round(forecast.data[i].precip));

            $(".fore_wind_d").text(Math.round(forecast.data[i].wind_dir));

            $(".fore_sun_rise").text(sun_rise_set(forecast.data[i].sunrise_ts));

            $(".fore_wind_s").text(Math.round(forecast.data[i].wind_spd));

            $(".fore_sun_set").text(sun_rise_set(forecast.data[i].sunset_ts));

            $(".fore_visi").text(Math.round(forecast.data[i].vis));

            function sun_rise_set(t) {
                var date = new Date(t * 1000);
                var time = date.toLocaleTimeString();
                return `${time}`;
            }




            // /**********************************************************/


            $(".fore_dew").text(Math.round(forecast.data[i].dewpt));

            $(".fore_pop").text(forecast.data[i].pop);

            $(".fore_min_t").text(Math.round(forecast.data[i].min_temp));

            $(".fore_max_t").text(Math.round(forecast.data[i].max_temp));

            $(".fore_ozone").text(Math.round(forecast.data[i].ozone));

            $(".fore_snow").text(Math.round(forecast.data[i].snow));

            $(".fore_uvi").text(Math.round(forecast.data[i].uv));

            $(".fore_moon_phase").text(Math.round(forecast.data[i].moon_phase));







            break;

        }
    }

    if (t == 0) {
        let [year_s, month_s, date_s] = forecast.data[1].valid_date.split("-")
        start = date_s + "/" + month_s + "/" + year_s;
        let [year_e, month_e, date_e] = forecast.data[15].valid_date.split("-")
        end = date_e + "/" + month_e + "/" + year_e;
        alert("Enter the vaild DD/MM/YY between (" + start + ") To (" + end + ")");
    }


}









//************************************************************************************************************************* */
//                                                   AIR POLLUTION


function air_pollution(air) {

    console.log(air);


    //AIR QUALITY INDEX
    $(".aqi").text(`${air.data[0].aqi}`);


    //CO
    $(".co").text(`${air.data[0].co}`);


    //MOLD LEVEL
    $(".mold_level").text(`${air.data[0].mold_level}`);


    //NO2
    $(".no2").text(`${air.data[0].no2}`);


    //O3
    $(".o3").text(`${air.data[0].o3}`);

    //SO2
    $(".so2").text(`${air.data[0].so2}`);


    //PM10
    $(".pm10").text(`${air.data[0].pm10}`);


    //PM25
    $(".pm25").text(`${air.data[0].pm25}`);


    //GRASS
    $(".grass").text(`${air.data[0].pollen_level_grass}`);


    //WEED
    $(".weed").text(`${air.data[0].pollen_level_weed}`);


    //STATE CODE
    $(".city_name").text(`${air.city_name}`);


    //TREE
    $(".tree").text(`${air.data[0].pollen_level_tree}`);


    //PREDOM
    $(".predom").text(`${air.data[0].predominant_pollen_type}`);


}



//ALERT BOX
function alert_open(alert) {

    $(".title_alert").text(`${alert.title}`);

    $(".description_alert").text(`${alert.description}`)

    $(".Severity").text(`${alert.severity}`);

    $(".effective_utc").text(`${alert.effective_utc}`);

    $(".effective_local").text(`${alert.effective_local}`);

    $(".expires_local").text(`${alert.expires_local}`);

    $(".expires_utc").text(`${alert.expires_utc}`);

    $(".uri").text(`${alert.uri}`);

    $(".regions").text(`${alert.regions}`);


}















//********************************************************************************************************************************************************************

//SIDEBAR
function opensidebar() {
    document.getElementById("sidebar").style.width = "250px";
}

function closesidebar() {
    document.getElementById("sidebar").style.width = "0";
}


//AIR BOX
function openairbox() {
    document.getElementById("airbox").style.width = "100%";
}

function closeairbox() {
    document.getElementById("airbox").style.width = "0";
}



//FORECAST SIDE BOX
function open_fore_sidebox() {
    document.getElementById("fore_sidebox").style.width = "100%";
}

function close_fore_sidebox() {
    document.getElementById("fore_sidebox").style.width = "0";
}



//MAP LARGE SIDE BOX
function open_mapbox() {
    document.getElementById("mapbox").style.width = "100%";
}

function close_mapbox() {
   document.getElementById("mapbox").style.width = "0";
}
	


//GOOGLE MAP
mapboxgl.accessToken = 'pk.eyJ1IjoiYWthc2hyYW1hbiIsImEiOiJja2Q3YXpmamowN3Z6MnlzOHlxYms5dTRoIn0.GXTYidZePo1PPu_Wvr0wWg';
var map_large = new mapboxgl.Map({
    container: 'map_large', // container id
    style: 'mapbox://styles/mapbox/streets-v11',
    center: { lat: 51.51, lng: -0.13 }, // starting position
    zoom: 9 // starting zoom
});
var map = new mapboxgl.Map({
    container: 'map', // container id
    style: 'mapbox://styles/mapbox/streets-v11',
    center: { lat: 51.51, lng: -0.13 }, // starting position
    zoom: 9 // starting zoom
});

// Add zoom and rotation controls to the map.
map.addControl(new mapboxgl.NavigationControl());
