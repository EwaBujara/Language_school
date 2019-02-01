<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Marketplace</title>
    <%@include file="/WEB-INF/views/header.jsp"%>
<body class="p-3 mb-2 bg-info text-dark">


<h3>Proposals of the Day:</h3>
<table class="table table-striped">
    <%--<tr>--%>
        <%--<th>Proposal</th>--%>
    <%--</tr>--%>
    <c:forEach items="${links}" var="link">
        <tr class="table-info">
            <td>
                ${link}
            </td>
        </tr>

    </c:forEach>
</table>

<script src="../../../js/script.js"></script>
</body>
</html>

