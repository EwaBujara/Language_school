<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users List</title>
    <%@include file="/WEB-INF/views/header.jsp"%>
<body class="p-3 mb-2 bg-info text-white">

<c:if test="${currentUser == null}">
    <div class="p-3 mb-2 bg-light text-dark">
        <h3 class="text-center">You have no access!</h3>
        <p class="text-center">You must sign in</p>
    </div>
</c:if>

<c:if test="${currentUser != null}">

<table class="table table-striped">
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Actions</th>
    </tr>
    <c:forEach items="${users}" var="user">
        <tr>
            <td>${user.username}</td>
            <td>${user.email}</td>
            <td>
                <a class="btn btn-dark" href="http://localhost:8080/home">Send message</a>
                <a class="btn btn-dark" href="http://localhost:8080/user/show/${user.id}">Account</a>
            </td>
        </tr>
    </c:forEach>
</table>
</c:if>

</body>
<%@include file="/WEB-INF/views/footer.jsp"%>
</html>
