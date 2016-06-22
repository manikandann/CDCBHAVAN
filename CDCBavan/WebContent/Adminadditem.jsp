<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CDCBavan</title>
<script type="text/javascript">
function validateForm() {
    var a = document.forms["menu1"]["itemname"].value;
    var b = document.forms["menu1"]["itemprice"].value;
    var error1=document.getElementById('error1');
    var error2=document.getElementById('error2');

    if (a == null || a == "") {
        error1.innerHTML="Please enter the Item Name";
        return false;
    }
    if (b == null || b == "") {
        error2.innerHTML="Please enter the Item Price";
        
        return false;
    }
   
}

function Validate(event) {
    var regex = new RegExp("^[0-9?.*!@#$%^&*]+$");
    var key = String.fromCharCode(event.charCode ? event.which : event.charCode);
    if (!regex.test(key)) {
        event.preventDefault();
        return false;
    }
}   
function myFunctionName() {
	var a = document.forms["menu1"]["itemname"].value;
    var error1=document.getElementById('error1');

    if (a == null || a == "") {
    	document.getElementById('error1').style.visibility='visible';  
    }
    else{
    	document.getElementById('error1').style.visibility='hidden';
    }
  
}
function myFunctionPrice() {
    var b = document.forms["menu1"]["itemprice"].value;
    var error2=document.getElementById('error2');
    if (b == null || b == "") {
    	document.getElementById('error2').style.visibility='visible'; 
    }
    else{
    	document.getElementById('error2').style.visibility='hidden';
    }
    
}

</script>
 <style type="text/css">
  body {
  background: radial-gradient(circle, pink, white);
  background-size: cover; 
} 

</style> 
</head>
<body>

<a  href='Adminhome.jsp'><img src="images/back.jpeg" alt="Home" style="width:50px;height:50px;"></a>
<div align="center">
<form name="menu1"  action="Itemadd.jsp" onsubmit="return validateForm()"  method="POST">
<h1><font color="green">Enter the Item details</font></h1>
<table>
<tr><td><h4><font color="blue">Item Name:</font></h4></td> <td> <input type="text" name="itemname"  onchange="myFunctionName()" ></td><td><font color="red"><p id="error1"> </p></font></td></tr>
<tr><td><h4><font color="blue">Item price:</font></h4></td> <td>  <input type="text" name="itemprice" onchange="myFunctionPrice()" onkeypress="Validate(event)"  ></td><td><font color="red"><p id="error2"> </p></font></td></tr>
<tr><td><h4><font color="blue">Availability Status: </font></h4></td> <td><input type="radio" value="available" name="status" checked>Available
<input type="radio" value="notavailable" name="status" >Not-available
<tr><td> </td><td><input type="submit"  value="Add"  /></td> <td>
</table>
</form>
</div>
</body>
</html>