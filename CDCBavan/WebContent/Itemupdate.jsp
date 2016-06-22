<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CDCBavan</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> -->
<script src="js/jquery.js"></script>
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
	    url: "http://localhost:1235/itemmodify?itemId=<%= request.getParameter("itemid")%>&itemName=<%= request.getParameter("itemname")%>&itemPrice=<%= request.getParameter("itemprice")%>&status=<%= request.getParameter("status")%> ",    
	    success: function(data){  
	    	$('.greeting-itemId').append(data.itemId);
	        $('.greeting-itemName').append(data.itemName);
	        $('.greeting-itemPrice').append(data.itemPrice);
	        $('.greeting-time').append(data.time);
	        $('.greeting-status').append(data.status);
	       
	    },  
	    error: function(data){  
	      /* alert('Some Error occured in processing the data' + data); */
	    	window.location='Error.jsp'
	    }  
	  });
	});
</script>
</head>
<body>
<a  href='Adminhome.jsp'><img src="images/back.jpeg" alt="Home" style="width:50px;height:50px;"></a>
<div align="center">
<TABLE  BORDER="2">

          <tr><td>Item Id is </td> <td><p class="greeting-itemId"/></td></tr>
            <tr><td> ItemName is </td><td><p class="greeting-itemName"/></td></tr>
           <tr><td> Item Price is </td><td> <p class="greeting-itemPrice"/></td></tr>  
           <tr><td> Available Status </td> <td><p class="greeting-status"/> </td></tr>      
</TABLE>
<br>
<br>
 <center>Item id <%= request.getParameter("itemid")%> successfully updated in the database !</center>
</div>
</body>
</html>