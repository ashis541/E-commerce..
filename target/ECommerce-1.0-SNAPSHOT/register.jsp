<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
     
    <%@include file="components/navbar.jsp" %>
    <div class="row mt-5">
       <div class="col-md-4 offset-md-4"> 
    
         <div class="card">
             <%@include file="components/Message.jsp" %>
            <div class="card-body px-5">
               <h3 class="text-center my-3">Sign Up here</h3>
               <form action="RegisterServlet"  name="f1" method="post" onsubmit="return validateRegister()" >
  <div class="form-group">
    <label for="user">User Name</label>
    <input type="text" name="user_name" class="form-control" id="user"  placeholder="Enter name here">
  </div>
  <div class="form-group">
    <label for="email">Email address</label>
    <input type="email" name="user_email" class="form-control" id="email" placeholder="Enter email here">
  </div>
  <div class="form-group">
    <label for="password">User Password</label>
    <input type="password" name="user_password" class="form-control" id="password" placeholder="Enter password here">
  </div> 
  <div class="form-group">
    <label for="phone">User phone</label>
    <input type="text" name="user_phone" class="form-control" id="phone" placeholder="Enter Phone number here" maxlength="10">
  </div>
  <div class="form-group">
    <label for="address">User address</label>
    <textarea name="user_address" class="form-control" style="height:200px;" placeholder="Enter your Address"></textarea>
  </div>
  <div class="container text-center">
        <button type="submit" class="btn btn-success">Submit</button>
        <button type="reset" value="clear" class="btn btn-warning">Reset</button>    
  </div> 
</form>
            </div>
         </div>
       </div>    
    </div>
</body>
</html>
<script>
    function validateRegister()
{

	let uName = document.f1.user_name.value;
	let uEmail = document.f1.user_email.value;
	let uPassword = document.f1.user_password.value;
	let uPhone = document.f1.user_phone.value;
	let uAddress = document.f1.user_address.value;
	let atpos = uEmail.indexOf('@');
	let dotpos = uEmail.lastIndexOf('.');	
	
	if(uName.length<1 || uEmail.length<1 || uPassword.length<1 || uPhone.length<1 || uAddress.length<1)
	{
		alert("Please Enter all details!!");
		return false;
	}
	
	else if (atpos<1 || dotpos-atpos<=2 || dotpos+2>=uEmail.length)
	{
		alert("Enter valid Email id!");
		return false;
	}
	
	else if(uPhone.length!=10 || isNaN(uPhone))
	{
		alert("Enter valid mobile number!");
		return false;
	}
	
	else if(uPassword.length<4 || uPassword.length>15)
	{
		alert("Please enter password length 4-12 char");
		return false;
	}
	
	else if(uAddress.length<10)
	{
		alert("Please enter full Address! with pincode");
		return false;
	}

}

</script>