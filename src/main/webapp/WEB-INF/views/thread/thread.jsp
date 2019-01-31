<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thread</title>
    <%@include file="/WEB-INF/views/header.jsp"%>
<body class="p-3 mb-2 bg-info text-white">

<table class="table table-striped">
    <tr>
        <th>Title</th>
        <th>Author</th>
        <th>Created</th>
    </tr>
    <tr>
        <td>${thread.title}</td>
        <td>${thread.user.username}</td>
        <td>${thread.created}</td>
    </tr>
</table>

<div class="p-3 mb-2 bg-light text-dark container col-6">
    <h4 class="text-center container col-6">${thread.text}</h4>
</div>

<a class="btn btn-dark float-right" href="http://localhost:8080/forum/${groupId}/thread/${thread.id}/addComment">Add new comment</a>
<h5>Comments (${comments.size()}):</h5>

<table class="table table-striped">
    <tr>
        <th>Author</th>
        <th>Created</th>
        <th>Comment</th>
    <c:if test='${ ( fn:contains(currentUserRoles, "Admin")
    or (fn:contains(currentUserRoles,"Teacher") and (fn:contains(currentUserGroups,group.name) and group.id!=1)))}'>
        <th>Action</th>
    </c:if>
    </tr>
    <c:forEach items="${comments}" var="comment">
        <tr>
            <td>${comment.user.username}</td>
            <td>${comment.created}</td>
            <td>${comment.text}</td>

            <c:if test='${ ( fn:contains(currentUserRoles, "Admin")
    or (fn:contains(currentUserRoles,"Teacher") and (fn:contains(currentUserGroups,group.name) and group.id!=1)))}'>
            <td>
                <a class="btn btn-dark float-right"
                   href="http://localhost:8080/forum/${groupId}/thread/${thread.id}/deleteComment/${comment.id}">
                    Delete comment</a>
            </td>
            </c:if>

        </tr>
    </c:forEach>
</table>

</body>
<%@include file="/WEB-INF/views/footer.jsp"%>
</html>
