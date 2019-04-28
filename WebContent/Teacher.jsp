<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*,control.*"
    pageEncoding="UTF-8"%>
    
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Document</title>
  <link rel="stylesheet" type="text/css" href="./css/reset.css">
  <link rel="stylesheet" type="text/css" href="./css/style.css">
 
</head>
<body>
	<% 
		String userID = (String)session.getAttribute("userID");
		if(userID == null ){
			response.sendRedirect("index.jsp");
		}
		String dept = request.getParameter("dept");
		out.println("<h1>"+dept+"</h2>");
		DBsearch dbs = new DBsearch();
		ResultSet resultRS = dbs.getDeptAllTeacher(dept);
		
	%>
	
		<p class="mb-0"><%=dept%>系</p>
		  
		  <table class="table">
			  <thead class="thead-dark">
			    <tr>
			      <th scope="col">#</th>
			      <th scope="col">教師姓名</th>
			      <th scope="col">教師級別</th>
			      <th scope="col">教師專長</th>
			    </tr>
			  </thead>
			  <tbody>
			      <tr>
					  <%while(resultRS.next()){
						String id = resultRS.getString(1);
						String name = resultRS.getString(2);
						String degree = resultRS.getString(3);
						String exper = resultRS.getString(4);
					  %>
					  <th scope="row"><%=id%></th>
					  <td><%=name%></td>
				      <td><%=degree%></td>
				      <td><%=exper%></td>
			      </tr>
			  <%}%>
			  </tbody>
			</table>
		
	
</body>
</html>