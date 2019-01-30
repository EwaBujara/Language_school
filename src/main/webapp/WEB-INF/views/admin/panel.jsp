<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Panel</title>
    <%@include file="/WEB-INF/views/header.jsp"%>
<body class="p-3 mb-2 bg-info text-white">

<div class="p-3 mb-2 bg-white text-dark">
    <a class="btn btn-info" href="http://localhost:8080/admin/groupList">Groups List</a>
    <a class="btn btn-info" href="http://localhost:8080/admin/addGroup">Create New Group</a>
    <a class="btn btn-info" href="http://localhost:8080/admin/memberList">Members List</a>
</div>

</body>
<%@include file="/WEB-INF/views/footer.jsp"%>
</html>
