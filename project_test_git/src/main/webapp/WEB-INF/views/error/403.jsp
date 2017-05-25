<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>::KIMBUISOR</title>

    <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/css/font-awesome.css" rel="stylesheet">

    <link href="../resources/css/animate.css" rel="stylesheet">
    <link href="../resources/css/style.css" rel="stylesheet">

</head>

<body class="gray-bg">


    <div class="middle-box text-center animated fadeInDown">
        <h1><i class="fa fa-warning"></i></h1>
        <h2>죄송합니다. 접근 권한이 없습니다.</h2>
        </br>

        <div class="error-desc">
            <h4>권한을 먼저 부여 받아야합니다. </br></br> 담당 관리자에게 문의 하십시오.</h4>
            
                <div class="form-group">
                	<a class="btn btn-primary" href="${pageContext.request.contextPath}/composeMSG.htm"><i class="fa fa-envelope"></i>문의 하기</a>
                	<a class="btn btn-warning" href="javascript:history.go(-1)"><i class="fa fa-arrow-left"></i>뒤로 가기</a>
                </div>
                	
           
        </div>
    </div>

    <!-- Mainly scripts -->
    <script src="../resources/js/jquery-2.1.1.js"></script>
    <script src="../resources/js/bootstrap.min.js"></script>
    

</body>

</html>
