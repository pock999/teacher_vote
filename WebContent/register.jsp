<!DOCTYPE html>
<html lang="en">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="./style/login_regist.css">
    <script src="./scripts/scripts.js"></script>
    <title>register</title>
    
</head>

<body>
<%
		String userID = (String)session.getAttribute("userID");
		if(userID == null ){
			;
		}else{
			response.sendRedirect("afterIndex.jsp");
		}
	%>
    <div class="container login_contain">
        <h1>註冊</h1>
        <form action="/ProjectVote/register" method="post">
            <div class="form-group">
                <label for="exampleFormControlInput1">姓名</label>
                <input type="text" class="form-control"  placeholder="name" name="name">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1">帳號</label>
                <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter account" name="account">
                <small id="emailHelp" class="form-text text-muted">若沒有帳戶，請先註冊</small>
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">密碼</label>
                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="pwd">
            </div>
            <div class="register_sub">
                <button type="submit" class="btn btn-primary">確認</button>
            </div>
           </form>
    </div>
    


    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
	
</body>
<script>
		function pageRefresh(){
			window.location.reload();
		}
		setTimeout('pageRefresh()',60000);
	</script>
</html>