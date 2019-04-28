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
		ResultSet resultRS = dbs.getDeptTeacher(dept);
		
	%>
	
		<p class="mb-0">請投票選出你喜歡的老師</p>
		<form method = "post" action="/ProjectVote/voter">
		  
		  
		  <%while(resultRS.next()){
			String name = resultRS.getString(1);
			String degree = resultRS.getString(2);
			String id = resultRS.getString(4);
		  %>
		  <p class="mb-0">
		  	<span><%=dept%>:</span><input type = "radio" name="teacher" value=<%=id%>/><%=name%>
		  </p>
		  
		  <%}%>
		  <p><input type="submit" value="確認" class="btn btn-secondary btn-lg btn-block"/></p>
		</form>	
		
	
</body>
</html>