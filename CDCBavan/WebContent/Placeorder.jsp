<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CDCBavan</title>
<script src="js/jquery.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">

<style type="text/css">
body {
	background: radial-gradient(circle, white, white);
	background-size: cover;
}

.resultDiv {
	display: none;
}
</style>

<SCRIPT language="javascript">
	function addRow(tableID) {

		var table = document.getElementById(tableID);

		var rowCount = table.rows.length;
		var row = table.insertRow(rowCount);

		var cell1 = row.insertCell(0);
		var element1 = document.createElement("input");
		element1.type = "checkbox";
		element1.name = "chkbox";
		cell1.appendChild(element1);

		/* var cell2 = row.insertCell(1);
		cell2.innerHTML = rowCount + 1; */

		var cell2 = row.insertCell(1);
		var element2 = document.createElement("input");
		element2.type = "text";
		element2.name = "itemid";
		cell2.appendChild(element2);

	}

	function deleteRow(tableID) {
		try {
			var table = document.getElementById(tableID);
			var rowCount = table.rows.length;

			for (var i = 0; i < rowCount; i++) {
				var row = table.rows[i];
				var chkbox = row.cells[0].childNodes[0];
				if (null != chkbox && true == chkbox.checked) {
					table.deleteRow(i);
					rowCount--;
					i--;
				}

			}
		} catch (e) {
			alert(e);
		}

	}

	function submitOrder() {

		var itemArray = [];
		$("#dataTable tr").each(function(index, row) {
			//console.log( index + ": " + $( this ).text() );
			var $row = $(row), $itemVal = $row.find('input[name="itemid"]')
			itemArray.push(parseInt($itemVal.val()));
			console.log($itemVal.val());

		});
		console.log(itemArray);
		//Start Ajax

		$.ajax({
			dataType : "json",
			cache : false,
			headers : {
				Accept : "application/json",
				"Access-Control-Allow-Origin" : "*"
			},
			type : "POST",
			url : "http://localhost:1239/order/getAllOrders",
			data : JSON.stringify(itemArray),
			contentType : 'application/json',
			success : function(data) {
				$(".orderForm").css("display", "none");
				$(".resultDiv").css("display", "block");
				console.log("received listener: " + JSON.stringify(data));
				var totalPrice = 0;
				$.each(data, function(index) {
					console.log("Item Name: " + data[index].itemName
							+ "Item Price: " + data[index].itemPrice);
					$(".itemDetailsTable").append(
							"<tr><td>" + data[index].itemName + "</td><td>"
									+ data[index].itemPrice + "</td></tr>");
					totalPrice = totalPrice + data[index].itemPrice;
				});
				$(".itemDetailsTable").append(
						"<tr><td><strong>Total</strong></td><td>" + totalPrice
								+ "</td></tr>");
			},
			error : function(data) {
				
				
				if(data.responseJSON!=null){	
					$(".errorMessage").append(data.responseJSON.message);
				}else{
				window.location='Error.jsp'
				}
			}
		});

		// End Ajax
		return itemArray;
	}
	function Validate(event) {
	    var regex = new RegExp("^[0-9?.*!@#$%^&*]+$");
	    var key = String.fromCharCode(event.charCode ? event.which : event.charCode);
	    if (!regex.test(key)) {
	        event.preventDefault();
	        return false;
	    }
	}
	
</SCRIPT>
</head>
<body>
	<br>
	<a href='User.jsp'><img src="images/back.jpeg" alt="Home"
		style="width: 50px; height: 50px;"></a>

	<form name="order" action="#" method="GET" class="orderForm" >
		<div align="center">
			<h2>
				<font color="green"> Please Enter the Item Id</font>
			</h2>
			<br>

			<TABLE id="dataTable" width="350px" onkeypress="Validate(event)">
				<TR>
					<TD><INPUT type="checkbox" name="chk" /></TD>
					<!-- <TD> 1 </TD> -->
					<TD><INPUT type="text" name="itemid" /></TD>
                    
				</TR>
				
			</TABLE>
			<br> <br> <a href='#' 
				onclick="addRow('dataTable')">Add Item</a>&nbsp;&nbsp;&nbsp; <a href="#" onclick="deleteRow('dataTable')">Remove Item</a>
		</div>
		<p id="error" class="errorMessage" style="color:red"></p>
		<br>
		<center>
			<INPUT type="button" value="Place Order" name="order"
				onclick="submitOrder();">

		</center>
	</form>
	<div class="resultDiv" align="center">
		<h2>
			<font color="Green"> Please find the order summary</font>
		</h2>
		<br>
		<table
			class='table table-striped table-bordered table-hover itemDetailsTable'
			style='width: 500px'>
			<thead>
				<tr>
					<td>Item Name</td>
					<td>Item Price</td>
				</tr>
			</thead>
		</table>
		<br>
		<br>
		<center><h2><font color="Red"><b>Thanks for Visiting CDC BAVAN</b></font></h2></center>
	</div>
	
</body>
</html>