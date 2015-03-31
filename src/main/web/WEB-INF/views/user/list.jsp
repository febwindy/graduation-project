<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户列表</title>
    <jsp:include page="../commons/inc_css.jsp"/>
    <jsp:include page="../commons/inc_js.jsp"/>
</head>
<body>
<jsp:include page="../layout/nav.jsp"/>
<div class="container-fluid">
    <div class="row">
        <jsp:include page="../layout/menu.jsp"/>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">用户管理</h1>

            <jsp:include page="../layout/alert.jsp"/>

            <section class="thumbnail">
                <ol class="breadcrumb">
                    <li><a href="/user/list">用户管理</a></li>
                    <li class="active">用户列表</li>
                </ol>
                <div class="thumbnail">
                    <form class="form-inline">
                        <div class="form-group">
                            <label for="username">用户名</label>
                            <input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名"
                                   value="${user.username}">
                        </div>
                        <button type="submit" class="btn btn-success">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>查询
                        </button>
                        <a class="btn btn-info" href="/user/create">创建</a>
                    </form>
                    <table class="table table-striped thumbnail">
                        <thead>
                            <tr>
                                <th>编号</th>
                                <th>用户名</th>
                                <th>性别</th>
                                <th>邮箱</th>
                                <th>手机号码</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${pagination.data}" varStatus="list">
                                <tr>
                                    <th scope="row">${list.index + 1}</th>
                                    <td>${user.username}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${user.sex}">男</c:when>
                                            <c:otherwise>女</c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>${user.email}</td>
                                    <td>${user.telephone}</td>
                                    <td>
                                        <a class="btn btn-info btn-sm" href="/user/authorization/${user.id}">授权</a>
                                        <a class="btn btn-primary btn-sm" href="/user/view/${user.id}">查看</a>
                                        <a class="btn btn-warning btn-sm" href="/user/edit/${user.id}">编辑</a>
                                        <a class="btn btn-danger btn-sm" href="/user/delete/${user.id}">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <jsp:include page="../layout/pagination.jsp">
                        <jsp:param name="url" value="/user/list?username=${user.username}"/>
                    </jsp:include>
                </div>
            </section>
        </div>
    </div>
</div>
</body>
</html>
