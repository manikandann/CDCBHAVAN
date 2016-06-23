<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=EDGE" />
 
  <link rel="stylesheet" href="css/bootstrap.min.css">

 
<title>CDCBavan</title>
<style type="text/css">
  body {
  background: radial-gradient(circle, white, white);
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
	    url: "http://d-113101847:1237/itemviewall",    
	    success: function(data){ 
	    	console.log("received listener: " + data);
	    	/* for (var x = 0; x < data.length; x++) { */
	    		var HTML = "<table class='table table-striped table-bordered table-hover' style='width:500px'>";
   HTML += "<tr><td>ITEM ID</td><td>ITEM NAME</td><td>ITEM PRICE</td></tr>";

   for(var i = 0;i<data.length;i++){
	   HTML += "<tr><td>" + data[i].ITEM_ID + "</td><td>" + data[i].ITEM_NAME + "</td><td>" + data[i].ITEM_PRICE +"</td></tr>";
	    }
 
		HTML += "</table>";
		document.getElementById('myTable').innerHTML = HTML;

	    },  
	    error: function(data){  
	      /* alert('Some Error occured in processing the data' + data);  */ 
	    	window.location='Error.jsp'
	    }  
	  });
	});
</script>

</head>
<body>
<div class="loader">
</div>
<br>
<a  href='User.jsp'><img src="images/back.jpeg" alt="Home" style="width:50px;height:50px;"></a>
<div align="center">
<h2>
			<font color="Green"> Please find the available items</font>
		</h2>
		<br>
		<br>
		</div>
<div align="center" id="myTable">

         
</div>
<center><a href=Placeorder.jsp>Order your menu</a></center>
</body>
</html>