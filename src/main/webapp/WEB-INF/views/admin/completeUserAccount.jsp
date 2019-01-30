<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users List</title>
    <%@include file="/WEB-INF/views/header.jsp"%>
<body class="p-3 mb-2 bg-info text-white">


<table class="table table-striped">
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Description</th>
        <th>Address</th>
        <th>Account Number</th>
    </tr>

    <tr>
        <td>${user.username}</td>
        <td>${user.email}</td>
        <td>${user.details.description}</td>
        <td>${user.details.address}</td>
        <td>${user.details.accountNumber}</td>
    </tr>
</table>

<table class="table table-striped">
    <tr>
        <th>Roles:</th>
    </tr>
    <c:forEach items="${user.roles}" var="role">
    <tr>
        <td>${role.name}</td>
    </tr>
    </c:forEach>
</table>

<table class="table table-striped">
    <tr>
        <th>Groups</th>
    </tr>
    <c:forEach items="${groups}" var="group">
        <tr>
            <td>${group.name}</td>
        </tr>
    </c:forEach>
</table>

<form:form method="post"
           action="${pageContext.request.contextPath}/user/save"
           modelAttribute="user"
           cssClass="container col-2" >

    <form:select path="roles">
        <form:options items="${roles}"
                      itemValue="id"
                      itemLabel="name" />
    </form:select>
    <p></p>
    Enabled: <form:checkbox path="enabled" value="${user.enabled}"/>
    <p></p>
    <input type="submit" value="Submit" class="btn btn-dark">
</form:form>

</body>
<%@include file="/WEB-INF/views/footer.jsp"%>
</html>
