<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<title>Language School</title>
<div class="p-3 mb-2 bg-dark text-white">
    <c:if test="${currentUser != null}">
    <p class="text-right">Welcome, ${currentUser.getUsername()}</p>
    <a class="btn btn-info float-right" href="http://localhost:8080/home">Log OUT</a>
        <p></p>
        <%--<a class="btn btn-info" href="http://localhost:8080/meow/add">Add New Meow</a>--%>
        <%--<a class="btn btn-info" href="http://localhost:8080/meow/list">Meows List</a>--%>
        <%--<a class="btn btn-info" href="http://localhost:8080/user/list">Users List</a>--%>
        <%--<a class="btn btn-info" href="http://localhost:8080/user/box">Your Meow-box</a>--%>
        <a class="btn btn-info" href="http://localhost:8080/user/account">Your profile</a>
    </c:if>

    <c:if test="${currentUser == null}">
        <a class="btn btn-info float-right" href="http://localhost:8080/user/login">Sign In</a>
    </c:if>


</div>
</head>
