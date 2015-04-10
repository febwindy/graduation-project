<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户审核列表</title>
    <jsp:include page="../../commons/inc_css.jsp"/>
    <jsp:include page="../../commons/inc_js.jsp"/>
</head>
<body>
<jsp:include page="../../layout/nav.jsp"/>
<div class="container-fluid">
    <div class="row">
        <jsp:include page="../../layout/menu.jsp"/>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">用户审核管理</h1>

            <jsp:include page="../../layout/alert.jsp"/>

            <section class="thumbnail">
                <ol class="breadcrumb">
                    <li><a href="/user/verified/list">用户审核管理</a></li>
                    <li class="active">用户审核列表</li>
                </ol>
                <div class="thumbnail">
                    <table class="table table-striped thumbnail">
                        <thead>
                            <tr>
                                <th>编号</th>
                                <th>用户名</th>
                                <th>真实姓名</th>
                                <th>性别</th>
                                <th>邮箱</th>
                                <th>手机号码</th>
                                <th>身份证号</th>
                                <th>组织</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${pagination.data}" varStatus="list">
                                <tr>
                                    <th scope="row">${list.index + 1}</th>
                                    <td>${user.username}</td>
                                    <td>${user.realName}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${user.sex}">男</c:when>
                                            <c:otherwise>女</c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>${user.email}</td>
                                    <td>${user.telephone}</td>
                                    <td>${user.idCard}</td>
                                    <td>${user.organization}</td>
                                    <td>
                                        <a class="btn btn-primary btn-sm" href="/user/verified/ok/${user.id}">激活</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <jsp:include page="../../layout/pagination.jsp">
                        <jsp:param name="url" value="/user/verified/list"/>
                    </jsp:include>
                </div>
            </section>
        </div>
    </div>
</div>
</body>
</html>
