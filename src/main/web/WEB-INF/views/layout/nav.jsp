<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid navbar-red-background" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/"><img src="${pageContext.request.contextPath}/resources/images/logo.png"/>重庆市流动党员管理系统</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="/about">关于我们</a>
                </li>
                <sec:authorize access="isAuthenticated()">
                    <li>
                        <a href="/logout">退出</a>
                    </li>
                </sec:authorize>
            </ul>
        </div>
    </div>
</nav>