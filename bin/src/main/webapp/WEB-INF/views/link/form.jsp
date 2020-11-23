<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fom" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Link</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <style>
        input{
            display: block;
            margin:15px 0;
            width: 100%;
        }
    </style>
    <%@include file="/WEB-INF/views/header.jsp"%>

<body class="p-3 mb-2 bg-info text-white">


<form:form method="post"
           modelAttribute="link"
           action="${pageContext.request.contextPath}/group/${groupId}/addLink"
           cssClass="container col-6" >

    <form:input path="title" placeholder="Link title" cssClass="form-input"/>
    <form:errors path="title" cssClass="alert alert-danger" element="div"/>

    <form:input path="url" placeholder="Link URL" cssClass="form-input"/>
    <form:errors path="url" cssClass="alert alert-danger" element="div"/>

    <input type="submit" value="Send"  class="btn btn-dark">
</form:form>

</body>
<%@include file="/WEB-INF/views/footer.jsp"%>
</html>
