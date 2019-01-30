<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fom" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <style>
        input, select, textarea{
            display: block;
            margin:15px 0;
            width: 100%;
        }
    </style>
    <%@include file="/WEB-INF/views/header.jsp"%>
<body class="p-3 mb-2 bg-info text-white">

<form:form method="post"
           action="${pageContext.request.contextPath}/user/save"
           modelAttribute="user"
           cssClass="container col-2" >

    <%--<form:input path="email" placeholder="Email" cssClass="form-input"/>--%>
    <%--<form:errors path="email" cssClass="alert alert-danger" element="div"/>--%>

    <%--<form:input path="oldPassword" placeholder="Your old password"/>--%>

    <form:password path="password" placeholder="Enter Your new password" cssClass="form-input"/>
    <form:errors path="password" cssClass="alert alert-danger" element="div"/>

    <form:input type="password" path="passwordConfirm" cssClass="form-input" placeholder="Confirm your new password"/>
    <form:errors path="passwordConfirm" cssClass="alert alert-danger" element="div"/>

    <form:textarea path="details.description" cssClass="form-input" placeholder="Description"/>

    <p></p>
    Enabled: <form:checkbox path="enabled" value="${user.enabled}"/>

    Roles:
    <form:select path="roles">
        <form:options items="${roles}"
                      itemValue="id"
                      itemLabel="name" />
    </form:select>

    Groups:
    <select name="groups" multiple>
        <c:forEach items="${groups}" var="group">
            <option value="${group.id}" >${group.name}</option>
        </c:forEach>
    </select>
    <%--<form:select path="groups" multiple="true">--%>
        <%--<form:options items="${groups}"--%>
                      <%--itemValue="id"--%>
                      <%--itemLabel="name" />--%>
    <%--</form:select>--%>

    <input type="submit" value="Submit" class="btn btn-dark">
</form:form>

</body>
<%@include file="/WEB-INF/views/footer.jsp"%>
</html>