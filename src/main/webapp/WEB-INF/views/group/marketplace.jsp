<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Marketplace</title>
    <%@include file="/WEB-INF/views/header.jsp"%>
<body class="p-3 mb-2 bg-info text-white">

<div class="p-3 mb-2 bg-white text-dark">
    <a class="btn btn-info" href="http://localhost:8080/forum/${group.id}"> ${group.name}-Forum</a>
    <c:if test="${group.id != 1}">
    <a class="btn btn-info" href="http://localhost:8080/group/members/${group.id}">${group.name}-Members List</a>
    </c:if>
</div>


</body>
</html>
