<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thread List</title>
</head>
<body>

<table class="table table-striped">
    <tr>
        <th>Title</th>
        <th>Author</th>
        <th>Created</th>
        <th>Meow</th>
        <th>Actions</th>
    </tr>
    <c:forEach items="${threads}" var="thread">
        <tr>
            <td>${thread.title}</td>
            <td>${thread.user.username}</td>
            <td>${thread.created}</td>
            <td>${fn:substring(thread.text, 0, 40)}</td>
            <td><a class="btn btn-dark" href="http://localhost:8080/forum/${groupId}/thread/${thread.id}">See more</a></td>
        </tr>

    </c:forEach>
</table>


</body>
</html>
