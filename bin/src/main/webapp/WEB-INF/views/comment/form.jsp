<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fom" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Comment</title>
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


<form:form method="post"
           modelAttribute="comment"
           action="${pageContext.request.contextPath}/forum/${groupId}/thread/${threadId}/addComment"
           cssClass="container col-6" >

    <form:textarea path="text" placeholder="Your comment" cssClass="form-input"/>
    <form:errors path="text" cssClass="alert alert-danger" element="div"/>

    <input type="submit" value="Send"  class="btn btn-dark">
</form:form>

</body>
<%@include file="/WEB-INF/views/footer.jsp"%>
</html>
