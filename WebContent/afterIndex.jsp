<!DOCTYPE html>
<html lang="en">

<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*,control.*,java.util.*"
    pageEncoding="UTF-8"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="./css/style.css">
    <script src="./scripts/scripts.js"></script>
    <title>index</title>
</head>

<body>
	<%
		String userID = (String)session.getAttribute("userID");
		if(userID == null ){
			response.sendRedirect("index.jsp");
		}
	%>
    <nav class="navbar navbar-dark bg-dark">
        <a class="navbar-brand" href="#">
            Vote
        </a>
        <div style="color:aliceblue;">Hi! <%=userID%></div>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="/ProjectVote/logout">登出</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="voteState.jsp">票數狀況</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="votehome.jsp">投票</a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container" >
    <h2 style="text-align:center;">前20名</h2>
        <% 
    	DBsearch dbs = new DBsearch();
    	int totalVote;
		totalVote = dbs.getTotalVote();
    	ResultSet rs = dbs.getRank(20);
    	int i = 0;
    	
    	
    	while(rs.next()){
       		out.println("<span>"+rs.getString(1)+"</span>");
       		out.println("<span>ID-"+rs.getString(2)+"</span>");
       		out.println("<div class='progress'>");
       		int vote = Integer.parseInt(rs.getString(3));
       		double percent = ((double)vote/(double)totalVote)*100;
       		if(i==0){
       			out.println("<div class='progress-bar bg-danger' role='progressbar' style='width: "+percent+"%' aria-valuenow='"+percent+"' aria-valuemin='0' aria-valuemax='100'></div>");
       		}else{
       			out.println("<div class='progress-bar' role='progressbar' style='width: "+percent+"%' aria-valuenow='"+percent+"' aria-valuemin='0' aria-valuemax='100'></div>");
       		}
       		out.println("</div>");
       		i++;
       	}
    	
    	
    %>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</body>

</html>