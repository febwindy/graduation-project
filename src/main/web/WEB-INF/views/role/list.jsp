<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>角色列表</title>
    <jsp:include page="../commons/inc_css.jsp"/>
    <jsp:include page="../commons/inc_js.jsp"/>
</head>
<body>
<jsp:include page="../layout/nav.jsp"/>
<div class="container-fluid">
    <div class="row">
        <jsp:include page="../layout/menu.jsp"/>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">角色管理</h1>

            <jsp:include page="../layout/alert.jsp"/>

            <section class="thumbnail">
                <ol class="breadcrumb">
                    <li><a href="/role/list">角色管理</a></li>
                    <li class="active">角色列表</li>
                </ol>
                <div class="thumbnail">
                    <a class="btn btn-info btn-create" href="/role/create">创建</a>
                    <table class="table table-striped thumbnail">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>角色名</th>
                            <th>角色描述</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="role" items="${pagination.data}" varStatus="list">
                            <tr>
                                <th scope="row">${list.index + 1}</th>
                                <td>${role.role}</td>
                                <td>${role.description}</td>
                                <td>
                                    <a class="btn btn-primary btn-sm" href="/role/view/${role.id}">查看</a>
                                    <a class="btn btn-warning btn-sm" href="/role/edit/${role.id}">编辑</a>
                                    <a class="btn btn-danger btn-sm" href="/role/delete/${role.id}">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <jsp:include page="../layout/pagination.jsp">
                        <jsp:param name="url" value="/role/list"/>
                    </jsp:include>
                </div>
            </section>
        </div>
    </div>
</div>
</body>
</html>
