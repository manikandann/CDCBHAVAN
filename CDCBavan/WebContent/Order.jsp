<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=EDGE" />
<title>CDCBavan</title>
<style type="text/css">
  body {
  background: radial-gradient(circle, white, pink);
  background-size: cover; 
} 

</style> 
<script src="js/jquery.js"></script>
 <script >
$(document).ready(function() {
	
	var testData=[<%=request.getParameter("order")%>]
	$.ajax({  
	    dataType: "json",
	    cache: false,
	    headers: {
	        Accept:"application/json",
	        "Access-Control-Allow-Origin": "*"
	    },
	    type: "POST",
	    url: "http://localhost:1239/order/getAllOrders",
	    data: JSON.stringify(testData),
        contentType: 'application/json',
	    success: function(data){ 
	    	console.log("received listener: " + data);
	    	
	    		var HTML = "<table class='table table-striped table-bordered table-hover' style='width:500px'>";
   HTML += "<tr><td>ITEM ID</td><td>ITEM NAME</td><td>ITEM PRICE</td></tr>";

   for(var i = 0;i<data.length;i++){
	   HTML += "<tr><td>" + data[i].itemId + "</td><td>" + data[i].itemName + "</td><td>" + data[i].itemPrice +"</td></tr>";
	    }
 
		HTML += "</table>";
		document.getElementById('myTable').innerHTML = HTML;

	    },  
	    error: function(data){  
	      alert('Some Error occured in processing the data' + data);  
	    }  
	  });
	});
</script>
</head>
<body>
<br>
<a  href='User.jsp'><img src="images/back.jpeg" alt="Home" style="width:50px;height:50px;"></a>
<div align="center" id="myTable">
<%-- <table>
         <tr><td><%= request.getParameter("itemid")%></td></tr>
         <tr><td><%= request.getParameter("itemid")%></td></tr>
         </table> --%>
</div>



</body>
</html>