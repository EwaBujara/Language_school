<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fom" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Meow</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <style>
        input, textarea{
            display: block;
            margin:15px 0;
            width: 100%;
        }
    </style>
    <%@include file="/WEB-INF/views/header.jsp"%>

<body class="p-3 mb-2 bg-info text-white">

<c:if test="${currentUser == null}">
    <div class="p-3 mb-2 bg-light text-dark">
        <h3 class="text-center">You have no access!</h3>
        <p class="text-center">You must be sign in</p>
    </div>
</c:if>

<c:if test="${currentUser != null}">
    <form:form method="post"
           action="${pageContext.request.contextPath}/meow/add"
           modelAttribute="meow"
           cssClass="container col-6" >


    <form:input path="title" placeholder="Title" cssClass="form-input"/>
    <form:errors path="title" cssClass="alert alert-danger" element="div"/>

    <form:textarea path="meowText" placeholder="Meow Text" cssClass="form-input"/>
    <form:errors path="meowText" cssClass="alert alert-danger" element="div"/>

    <input type="submit" value="Send"  class="btn btn-dark">
</form:form>
</c:if>
</body>
<%@include file="/WEB-INF/views/footer.jsp"%>
</html>
