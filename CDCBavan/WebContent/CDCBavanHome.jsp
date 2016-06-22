<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CDCBavan</title>
<style type="text/css">
 
     body {
    
     background: url("images/welcome.jpeg") no-repeat center center fixed  ;  
     background-size: cover;    
       
}   

</style> 
</head>
<body>
<marquee><h2><font color="green"><B> Welcome to CDCBavan - <i><font color="red"> Taste that makes you fly</font></i></B></font></h2></marquee>
<div align="right"><font color="yellow">
<%
   response.setIntHeader("Refresh", 15);
   Calendar calendar = new GregorianCalendar();
   String am_pm;
   int hour = calendar.get(Calendar.HOUR);
   int minute = calendar.get(Calendar.MINUTE);
   int second = calendar.get(Calendar.SECOND);
   if(calendar.get(Calendar.AM_PM) == 0)
      am_pm = "AM";
   else
      am_pm = "PM";
   String CT = hour+":"+ minute +":"+ second +" "+ am_pm;
   out.println("Current Time in IST: " + CT + "\n");
%>
</font>
</div>


<div align="center">
<br>
<br>
<br>
<br>
<h1><a href='Login.jsp'><font color="blue">Administrator</font></a></h1>
<h1><a href='User.jsp'><font color="red">User</font></a></h1>
</div>
</body>
</html>