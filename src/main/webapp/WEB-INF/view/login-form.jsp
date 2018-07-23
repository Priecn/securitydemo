<%--
  Created by IntelliJ IDEA.
  User: prince
  Date: 7/22/18
  Time: 8:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login</title>
</head>
<body>

    <h2>Enter your credentials</h2>
    <p>
        <c:if test="${param.error != null}" >
            wrong username or password
        </c:if>
    </p>
    <p>
        <c:if test="${param.logout != null}" >
            logged out!
        </c:if>
    </p>
    <sf:form method="post" action="${pageContext.request.contextPath}/authenticateUser">
        <input type="text" name="username" placeholder="Username" />
        <input type="password" name="password" placeholder="Password" />
        <input type="submit" value="Login" />
    </sf:form>
</body>
</html>
