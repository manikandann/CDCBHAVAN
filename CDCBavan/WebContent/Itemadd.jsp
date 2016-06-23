<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=EDGE" />
<title>CDCBavan</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> -->
<script src="js/jquery.js"></script>
<script >
$(document).on({
    ajaxStart: function() {  $(".loader").css("display","block");   },
     ajaxStop: function() {  $(".loader").css("display","none"); }    
});

$(document).ready(function() {
	$.ajax({  
	    dataType: "json",
	    cache: false,
	    headers: {
	        Accept:"application/json",
	        "Access-Control-Allow-Origin": "*"
	    },
	    type: "GET",
	    url: "http://d-113101847:1235/itemadd?itemName=<%= request.getParameter("itemname")%>&itemPrice=<%= request.getParameter("itemprice")%>&status=<%= request.getParameter("status")%> ",    
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
<style type="text/css">
  body {
  background: radial-gradient(circle, red, white);
  background-size: cover; 
} 
.loader{
position:   fixed;
z-index:    1000;
height: 100%;
width:100%;
background-color: black;
overflow: hidden;
opacity:0.4;
background-image: url("images/loader.gif");
background-repeat: no-repeat;
background-position: 50% 50%;
display: none;
}
</style> 
</head>
<body>
<div class="loader">
</div>
<a  href='Adminhome.jsp'><img src="images/back.jpeg" alt="Home" style="width:50px;height:50px;"></a>
<div align="center">
<TABLE  BORDER="2">

          <tr><td>Item Id is </td> <td><p class="greeting-itemId"/></td></tr>
            <tr><td> ItemName is </td><td><p class="greeting-itemName"/></td></tr>
           <tr><td> Item Price is </td><td> <p class="greeting-itemPrice"/></td></tr>
           <tr><td>Price is last updated on  </td> <td><p class="greeting-time"/> </td></tr>  
           <tr><td> Available Status </td> <td><p class="greeting-status"/> </td></tr>      
</TABLE>
<br>
<br>
 <center> Item successfully added to database, Item id is <p class="greeting-itemId"/> </center>
</div>
</body>
</html>