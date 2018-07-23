<%--
  Created by IntelliJ IDEA.
  User: prince
  Date: 7/22/18
  Time: 6:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Home</title>
</head>
<body>
    <h2>Welcome to Home Page</h2>
    <hr>
        User: <security:authentication property="principal.username" />
        <br>
        Roles: <security:authentication property="principal.authorities" />
    <hr>
        <security:authorize access="hasRole('ADMIN')">
            <p>
                <a href="${pageContext.request.contextPath}/systems">Systems Meeting</a>(Only for Admin peeps)
            </p>
        </security:authorize>

        <security:authorize access="hasRole('MANAGER')">
            <p>
                <a href="${pageContext.request.contextPath}/leaders">LeaderShip Meeting</a>(Only for Manager peeps)
            </p>
        </security:authorize>


    <hr>
    <p>
        <sf:form method="post" action="${pageContext.request.contextPath}/logout">
            <input type="submit" value="Logout" />
        </sf:form>
    </p>
</body>
</html>
