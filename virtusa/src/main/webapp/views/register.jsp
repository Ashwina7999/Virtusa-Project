<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register Page</title>
<link rel="stylesheet" href="CSS/register_style.css">
<link rel="icon" type="image/png" href="images/icons/register_icon.jpg" />
</head>
<body style="background-image: url('/images/bg/register.jpg');">

    <div class="reg_main">

        <div class="container">
            <form method="POST" action="addregister" class="register-form">
                <h2>Register Page</h2>
                <div class="form-group-1">
                    <input type="text" name="name" id="name" placeholder="Name" autocomplete="off" required />
                    <input type="text" name="email" id="email" placeholder="Email" autocomplete="off" required />
                    <input type="password" name="password" id="password" placeholder="Password" required />
                    
                    
                  
                        <select name="gender" id="gender">
                            <option name="gender" id="gender" slected value="male">Male</option>
                            <option name="gender" id="gender" value="female">Female</option>
                            <option name="gender" id="gender" value="others">Others</option>
                        </select>
                    
                    
                    <input type="text" name="phone" id="phone" placeholder="Phone number" autocomplete="off" required />
                   
                    <input type="text" name="city" id="city" placeholder="City" autocomplete="off" required />

                    <input type="text" name="country" id="country" placeholder="Country" autocomplete="off" required />

                </div>
             <div class="reg_button">
                <button class="btn danger" type="submit">Register</button>
            </div>
            </form>
        </div>

    </div>

 
  

</body>
</html>