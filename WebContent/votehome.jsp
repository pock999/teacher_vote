<!DOCTYPE>
<html>
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*,control.*"
	    pageEncoding="UTF-8"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>vote</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
</head>
<body>
	<% 
		DBsearch dbs = new DBsearch();
		String userID = (String)session.getAttribute("userID");
		if(userID == null ){
			response.sendRedirect("index.jsp");
		}
		if(dbs.checkVote(userID)==true){
			out.println("<script type=\"text/javascript\">");
			out.println("alert('您已經投過票');");
			out.println("window.location.href='index.jsp';</script>");
			
		}
		ResultSet resultRS = dbs.getDname();
		
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
	<div class="container">
	<p style="margin-top:20px"><strong>搜尋條件</strong></p>
	<select name="dept" id="inputState"  class="form-control">
	<% 
	while(resultRS.next()){
		String dname = resultRS.getString(1);
	%>
	<option value=<%=dname%>><%=dname%></option>
	<%} %>
	</select>
	<p><input type="button" value="搜尋" id="sub" class="btn btn-primary btn-lg btn-block" style="margin-top:10px;"/></p>
	
	
	<div id='main'></div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
	
	$(document).ready(function(){
		$('#sub').click(function(){
			let sentData = $("#inputState").find(":selected").val();
			$.ajax({
                url: 'PartVote.jsp',
                type: 'GET',
                data: {"dept": sentData},
            })
            .done(function(data) {
                console.log("success");
                $('#main').html(data);
            })
            .fail(function() {
                console.log("error");
            })
            .always(function() {
                console.log("complete");
            });
		});
	});
	
	</script>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</body>
</html>