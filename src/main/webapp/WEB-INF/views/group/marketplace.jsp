<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Marketplace</title>
    <%@include file="/WEB-INF/views/header.jsp"%>
<body class="p-3 mb-2 bg-info text-white">

<div class="p-3 mb-2 bg-white text-dark">
    <h3>${group.name}</h3>
    <a class="btn btn-info" href="http://localhost:8080/forum/${group.id}"> ${group.name}-Forum</a>
    <c:if test="${group.id != 1}">
    <a class="btn btn-info" href="http://localhost:8080/group/members/${group.id}">${group.name}-Members List</a>
    </c:if>

    <c:if test='${fn:contains(currentUserRoles, "Teacher")}'>
    <%--<c:if test='${ ( fn:contains(currentUserRoles, "Admin")--%>
    <%--or (fn:contains(currentUserRoles,"Teacher") and (fn:contains(currentUserGroups,group.name) and group.id!=1)))}'>--%>
        <a class="btn btn-info" href="http://localhost:8080/group/${group.id}/addLink">Add New Link</a>
    </c:if>
</div>

<h3>Discover the Amazing World of Education:</h3>
<table class="table table-striped">
    <tr>
        <th>Title</th>
        <th>Actions</th>
        <th>View</th>
    </tr>
    <c:forEach items="${links}" var="link">
        <tr>
            <td>${link.title}</td>
            <td>
                <c:if test='${ ( fn:contains(currentUserRoles, "Admin")
    or (fn:contains(currentUserRoles,"Teacher") and (fn:contains(currentUserGroups,group.name) and group.id!=1)))}'>
                    <a class="btn btn-dark" href="http://localhost:8080/group/deleteLink/${link.id}">Delete</a>
                </c:if>
                <a class="btn btn-dark" href="${link.url}">Enter</a>
            </td>
            <td><iframe src="${link.url}">IFrame</iframe></td>
            <%--<td><iframe src="https://www.youtube.com/embed/c4pq38RFBL4">IFrame</iframe></td>--%>
        </tr>

    </c:forEach>
</table>

</body>
</html>
