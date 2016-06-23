<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=EDGE" />
<title>CDCBavan</title>
<script type="text/javascript">
function validateForm() {
	var error=document.getElementById('error');
    var x = document.forms["menu"]["id"].value;
    if (x == null || x == "") {
    	error.innerHTML="Please enter the Item id";
        return false;
    }
}
function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
       return false;
    }   
    return true;
}

</script>
<style type="text/css">
 
  /*    body {
    
     background: url("menu.jpeg") no-repeat center center fixed  ;  
     background-size: cover;    
       
}  */  
body {
  background: radial-gradient(circle, white, pink);
  background-size: cover; 
} 

</style> 
</head>
<body>
<a  href='Adminhome.jsp'><img src="images/back.jpeg" alt="Home" style="width:50px;height:50px;"></a>
<div align="center">
<br>
<br>
<br>
<h2><font color="green"><B> Enter the stock id </B></font></h2>
<form name="menu"  action="AdminView.jsp" onsubmit="return validateForm()" onkeypress="return isNumber(event)"  method="GET">
<h4><font color="green">Menu id: <input type="text" name="id"></font></h4>
<font color="red"><p id="error"> </p></font>
<br />
<input type="submit" value="Fetch" />
</form>
</div>
</body>
</html>