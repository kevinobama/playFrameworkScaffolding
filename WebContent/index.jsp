<%@ page import="java.sql.*" %> 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>Play Framework:</p>
 
<table  width="900" border="1">
 <tr> <td>table Name</td></tr>
 <tr><td>
 <% 
try {  
	Class.forName("com.mysql.jdbc.Driver");  
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/viewfinquanttrading?useSSL=false","root","1");  

	Statement stmt=conn.createStatement();  
	ResultSet rs=stmt.executeQuery("show tables");
	String link = "";
	while(rs.next()) {		
		link = "<a href='index.jsp?table=?'>"+rs.getString(1)+" </a><br> ";
		out.println(link); 
	}	 			
	conn.close();  	
} catch(Exception e) { 
	out.println(e);
} 		   
%>
</td></tr>
</table>

</body>
</htm>
