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
 
<table  width="100%"  border="1">
 <tr> <td width="20%">table Name</td><td width="80%">view</td></tr>
 <tr ><td valign="top">
 <% 
String view = "";
String talbe = request.getParameter("table");
if(talbe == null) {
	talbe = "user";
}
try {  
	Class.forName("com.mysql.jdbc.Driver");  
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/viewfinquanttrading?useSSL=false","root","1");  

	Statement stmt=conn.createStatement();  
	ResultSet rs=stmt.executeQuery("show tables");
	String link = "";
	
	while(rs.next()) {		
		link = "<a href='index.jsp?table="+rs.getString(1)+"'>"+rs.getString(1)+"</a><br> ";
		out.println(link); 
	}	 	
	
	ResultSet structure=stmt.executeQuery("DESCRIBE "+talbe);
	StringBuilder sb=new StringBuilder("");  
  	
	while(structure.next()) {		
		String field = structure.getString(1);
		String type = structure.getString(2);
		sb.append(" @inputText(computerForm(\" "+structure.getString(1)+" \"), '_label -> \" "+structure.getString(1)+" \", '_help -> \"\")");
		sb.append(" \n ");
		//sb.append(structure.getString(2)+" \n ");		 
	}		
	
	view = sb.toString();
	
	conn.close();
} catch(Exception e) { 
	out.println(e);
} 		   
%>
</td>
<td valign="top">
 
<textarea rows="40" cols="200">
 <%=view %>
</textarea>

</td>

</tr>
</table>

</body>
</htm>
