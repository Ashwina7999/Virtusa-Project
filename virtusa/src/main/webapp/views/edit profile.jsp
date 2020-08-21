<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Profile</title>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="icon" type="image/png" href="images/icons/edit.jpg" />
<link href="CSS/edit.css" rel="stylesheet">
</head>
<body>

  <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
            <div class="card card-4">
                <div class="card-body">
                    <h2 class="title">Profile</h2>
                    <h3 onclick="document.getElementById('submit').style.display='block'" style="float: right;color: blue;font-weight: 500;margin-top: -65px;cursor: pointer;">Edit <i style='font-size:15px;margin-left: 5px' class='fas'>&#xf044;</i></h3>
                    <form method="POST" action="addregister">
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Name</label>
                                    <input class="input--style-4" type="text" name="name" id="name" autocomplete="off" value="${sessionScope.name}">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Email</label>
                                    <input class="input--style-4" type="text" name="email" id="email" autocomplete="off" value="${sessionScope.email}">
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Gender</label>
                                    <input class="input--style-4" type="text" name="gender" id="gender" autocomplete="off" value="${sessionScope.gender}">
                                </div>
                                <div class="input-group">
                                    <label class="label">Password</label>
                                    <input class="input--style-4" type="text" name="password" id="password" autocomplete="off" value="${sessionScope.password}">
                                </div>
                            </div>

                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">City</label>
                                    <input class="input--style-4" type="text" name="city" id="city" autocomplete="off" value="${sessionScope.city}">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Country</label>
                                    <input class="input--style-4" type="text" name="country" id="country" autocomplete="off" value="${sessionScope.country}">
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="input-group">
                            <label class="label">Phone Number</label>
                            <input class="input--style-4" type="text" name="phone" id="phone" autocomplete="off" value="${sessionScope.phone}">
                        </div>
                        <div class="p-t-15">
                            <button id="submit" style="display:none" class="btn btn--radius-2 btn--blue" type="submit">Update</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
