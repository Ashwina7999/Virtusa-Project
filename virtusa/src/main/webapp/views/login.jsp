<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="icon" type="image/png" href="images/icons/login_icon.png" />
<link rel="stylesheet" type="text/css" href="images/icons/css/material-design-iconic-font.min.css">
<link rel="stylesheet" type="text/css" href="CSS/login_style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">

</head>


<body style="background-image: url('images/bg/login.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-position: center;
  background-size: cover;">

	<div class="contain">
		<div class="wrap">
			<form action="${pageContext.request.contextPath }/addlogin" method="POST">
				<h1 class="title">Login</h1>
				<br><br>
				<div class="hold">
					<input class="input" type="email" id="email" name="email" autocomplete="off" placeholder="Email" required="">
					<span class="icons" data-placeholder="&#xf207;"></span>
				</div>
				<br>
				<div class="hold">
					<input class="input" type="password" id="password" name="password" placeholder="Password" required="">
					<span class="icons" data-placeholder="&#xf191;"></span>
					<i class="far fa-eye" id="togglePassword" style="color: white;float: right;margin-top: -25px;margin-right: 30px;cursor: pointer;"></i>

					
				</div>


				<br><br>
				<button class="btn danger" type="submit">Login</button>


				<br><br><br>
				<a href="register"><p class="new_user">New User? Sign up</p></a>
				<br>
			</form>
		</div>
	</div>

	<div class="login_error" style="color: yellow;text-align: center;margin-top: -50px">
	${error}
	</div>
	
	
	
<script>
	const togglePassword = document.querySelector('#togglePassword');
const password = document.querySelector('#password');


togglePassword.addEventListener('click', function (e) {
    // toggle the type attribute
    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
    password.setAttribute('type', type);
    // toggle the eye slash icon
    this.classList.toggle('fa-eye-slash');
});

</script>	
	

</body>
</html>
