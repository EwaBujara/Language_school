<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title></title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<div class="p-3 mb-2 bg-dark text-white">
    <a class="btn btn-info" href="http://localhost:8080/user/login">Sign In</a>
    <a class="btn btn-info" href="http://localhost:8080/user/registration">Sign Up</a>
</div>
</head>
<body class="p-3 mb-2 bg-info text-dark">

<h1 class="text-center">Welcome to Language School</h1>
<%--<p class="text-center">--%>
    <%--<img src="../../images/UK-flag-union-jack-1024x683.jpg" width="10%">--%>
<%--</p>--%>

</body>
<%@include file="/WEB-INF/views/footer.jsp"%>
</html>
