<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<title>Language School</title>
<div class="p-3 mb-2 bg-dark text-white">
    <c:if test="${currentUser != null}">
        <%--<img src="htps://www.federalflags.com/resize/images/_0020_UK-flag-emblem.jpg?bw=1000&w=1000&Abh=1000&h=1000" width="5%">--%>

        <p class="text-right">Welcome, ${currentUser.getUsername()}</p>
        <p></p>
    <a class="btn btn-info float-right" href="http://localhost:8080/home">Log OUT</a>

        <p></p>
        <%--<img src="https://www.federalflags.com/resize/images/_0020_UK-flag-emblem.jpg?bw=1000&w=1000&Abh=1000&h=1000" width="5%">--%>
        <c:if test='${fn:contains(currentUserRoles, "Admin")}'>
            <a class="btn btn-danger" href="http://localhost:8080/admin">Admin panel</a>
        </c:if>
        <a class="btn btn-info" href="http://localhost:8080/group/1">Home</a>
        <a class="btn btn-info" href="http://localhost:8080/user/show/${currentUser.id}">Your profile</a>
        <a class="btn btn-info" href="http://localhost:8080/group/list/${currentUser.id}">Your Groups</a>
        <a class="btn btn-secondary" href="http://localhost:8080/proposal">Proposal of the Day</a>
    </c:if>

    <c:if test="${currentUser == null}">
        <a class="btn btn-info float-right" href="http://localhost:8080/user/login">Sign In</a>
    </c:if>


</div>
</head>
