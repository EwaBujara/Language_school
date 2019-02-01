<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Users List</title>
    <%@include file="/WEB-INF/views/header.jsp"%>
<body class="p-3 mb-2 bg-info text-white">

<table class="table table-striped">
    <tr>
    <c:if test='${fn:contains(currentUserRoles, "Admin")}'>
        <th>Id</th>
        <th>Enabled</th>
    </c:if>
        <th>Name</th>
        <th>Email</th>
        <th>Description</th>
     <c:if test='${currentUser.id==user.id or fn:contains(currentUserRoles, "Admin")}'>
        <th>Address</th>
        <th>Phone Number</th>
     </c:if>
    </tr>

    <tr>
    <c:if test='${fn:contains(currentUserRoles, "Admin")}'>
        <td>${user.id}</td>
        <td>${user.enabled}</td>
    </c:if>
        <td>${user.username}</td>
        <td>${user.email}</td>
        <td>${user.details.description}</td>
        <c:if test='${currentUser.id==user.id or fn:contains(currentUserRoles, "Admin")}'>
        <td>${user.details.address}</td>
        <td>${user.details.accountNumber}</td>
    </c:if>
    </tr>
</table>

<c:if test='${fn:contains(currentUserRoles, "Admin")}'>
<table class="table table-striped">
    <tr>
        <th>Roles:</th>
    </tr>

    <tr>
        <td>
            <ul>
            <c:forEach items="${user.roles}" var="role">
                <li>${role.name}</li>
            </c:forEach>
            </ul>
        </td>
    </tr>
</table>
</c:if>

<table class="table table-striped">
    <tr>
        <th>Groups</th>
    </tr>

    <tr>
        <td>
            <ul>
                <c:forEach items="${groups}" var="group">
                    <li>${group.name}</li>
                </c:forEach>
            </ul>
        </td>
    </tr>

</table>

<c:if test='${fn:contains(currentUserRoles, "Admin") or currentUser.id==user.id}'>
    <a class="btn btn-dark" href="http://localhost:8080/user/edit/${user.id}">Edit profile</a>
</c:if>

<p></p>
</body>
<%@include file="/WEB-INF/views/footer.jsp"%>
</html>
