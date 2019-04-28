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
    <title>voteState</title>
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
                    <a class="nav-link" href="votehome.jsp">投票</a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container" style="margin-top:20px;">
		<div class="jumbotron">
			  <h1 class="display-4">系所得票情形</h1>
			  <p class="lead">本頁面可以列出各系所得票比例</p>
			  <hr class="my-4">
			  <p>前往系所排名</p>
			  <a class="btn btn-primary btn-lg" href="DeptRank.jsp" role="button">確認</a>
		</div>
		<div class="jumbotron">
			  <h1 class="display-4">老師資訊</h1>
			  <p class="lead">本頁面可以看到老師的詳細資訊</p>
			  <hr class="my-4">
			  <p>前往老師資訊</p>
			  <a class="btn btn-primary btn-lg" href="TeacherInfo.jsp" role="button">確認</a>
		</div>
	</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</body>

</html>