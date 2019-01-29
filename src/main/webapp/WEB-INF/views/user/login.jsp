<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <style>
        #id, input, select{
            display: block;
            margin:15px 0;
            width: 100%;
        }
    </style>
    <%--<%@include file="/WEB-INF/views/header.jsp"%>--%>
    <div class="p-3 mb-2 bg-dark text-white">
        <h3 class="text-center">Welcome back to Meower</h3>
    </div>
</head>
<body class="p-3 mb-2 bg-info text-white">

<form:form method="post"
           action="${pageContext.request.contextPath}/user/login"
           modelAttribute="userLog"
           cssClass="container col-6" >

    <form:input path="email" placeholder="Email" cssClass="form-input"/>
    <form:errors path="email" cssClass="alert alert-danger" element="div"/>

    <form:password path="password" placeholder="Enter Your password" cssClass="form-input"/>
    <form:errors path="password" cssClass="alert alert-danger" element="div"/>

    <input type="submit" value="Send" class="btn btn-dark">
</form:form>

<p></p>
    <a class="btn btn-dark container col-6" href="http://localhost:8080/user/registration">Create a new account</a>

</body>
</html>
