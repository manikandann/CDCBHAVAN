<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CDCBavan</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> -->
<script src="js/jquery.js"></script>
<!-- <script src="menu.js"></script> -->
 <style type="text/css">
  body {
  background: radial-gradient(circle, red, white);
  background-size: cover; 
} 

</style> 
<script >

$(document).ready(function() {
	$.ajax({  
	    dataType: "json",
	    cache: false,
	    headers: {
	        Accept:"application/json",
	        "Access-Control-Allow-Origin": "*"
	    },
	    type: "GET",
	    url: "http://localhost:1235/itemdelete?itemId="+ <%= request.getParameter("id")%>,    
	    success: function(data){  
	    	$('.greeting-itemId').append(data.itemId);
	        $('.greeting-itemName').append(data.itemName);
	        $('.greeting-itemPrice').append(data.itemPrice);
	        $('.greeting-time').append(data.time);
	        $('.greeting-status').append(data.status);
	       
	    },  
	    error: function(data){  
	      /* alert('Some Error occured in processing the data' + data);  */
	    	window.location='Error.jsp'
	    }  
	  });
	});
</script>

</head>
<body  >
<a  href='Adminhome.jsp'><img src="images/back.jpeg" alt="Home" style="width:50px;height:50px;"></a>
<div align="center">
<br>
<br>
<br>
<br>
<br>
<br>
<center><h2>Item id <%= request.getParameter("id")%> deleted successfully </h2></center>
</div>
</body>
</html>