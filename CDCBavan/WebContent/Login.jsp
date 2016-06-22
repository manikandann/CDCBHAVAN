<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>CDCBavan</title>
       <link rel="stylesheet" href="css/style.css">
         <script type="text/javascript">
         function validateForm()
         {
        	 var a = document.getElementById("username").value;
        	    var b = document.getElementById("password").value;
        	    var error1=document.getElementById('error1');

        	    if (a != "mani"  && b != "mani"){
        	        
        	    	error1.innerHTML="Login Failed !! Please check the user name and password ";
        	    	document.getElementById('error1').style.visibility='visible';
        	    	
        	    	return false;
        	    	
        	    }
        	    else{
        	    	
        	    	document.getElementById('error1').style.visibility='hide';
        	   
        	    	return true;
        	    }
         }
         function validateLink() {
        	 var error2=document.getElementById('error2');
        	 error2.innerHTML="Plese contact your Administrator";
 	    	document.getElementById('error2').style.visibility='visible';
		
		}
         </script> 
  </head>

    <body>
    <br>
    <a  href='CDCBavanHome.jsp'><img src="images/images.jpeg" alt="Home" style="width:50px;height:50px;"></a>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
<div class="container" align="center">
	<section id="content">
		<form name="login" action="Adminhome.jsp" onsubmit="return validateForm()">
			<h1>Admin Login Form</h1>
			<div>
				<input type="text" name ="username" id="username" placeholder="Username" required  />
			</div>
			<div>
				<input type="password" name="password" id="password" placeholder="Password" required />
			</div>
			<div>
			<font color="red"><p id="error1"> </p></font>
				<input type="submit" value="Log in" /><br>
				<a href="#" onclick="validateLink()">Lost your password?</a>
			</div>
		</form>
		<font color="red"><p id="error2"> </p></font>
		<!-- form -->
	</section><!-- content -->
</div><!-- container -->
</body>
 
</html>
