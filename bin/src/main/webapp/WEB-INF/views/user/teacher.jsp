<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Teacher Page</title>
</head>
<body>
<p>I am: ${currentUser} :) My name is ${currentUser.username}</p>
<c:if test='${fn:contains(currentUserRoles, "User")}'>
    <p>i'm a student i can see this</p>
</c:if>

<c:if test='${fn:contains(currentUserRoles, "Teacher")}'>
    <p>i'm a teacher i can see this</p>
</c:if>

<c:if test='${fn:contains(currentUserRoles, "Admin")}'>
    <p>i'm an admin i can see this</p>
</c:if>

<p>all can see this</p>
</body>
</html>
