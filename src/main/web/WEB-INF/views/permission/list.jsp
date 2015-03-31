<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>资源列表</title>
    <jsp:include page="../commons/inc_css.jsp"/>
    <jsp:include page="../commons/inc_js.jsp"/>
</head>
<body>
<jsp:include page="../layout/nav.jsp"/>
<div class="container-fluid">
    <div class="row">
        <jsp:include page="../layout/menu.jsp"/>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">资源管理</h1>

            <jsp:include page="../layout/alert.jsp"/>

            <section class="thumbnail">
                <ol class="breadcrumb">
                    <li><a href="/permission/list">资源管理</a></li>
                    <li class="active">资源列表</li>
                </ol>
                <div class="thumbnail">
                    <a class="btn btn-info btn-create" href="/permission/create">创建</a>
                    <table class="table table-striped thumbnail">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>资源名</th>
                            <th>资源描述</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="permission" items="${pagination.data}" varStatus="list">
                            <tr>
                                <th scope="row">${list.index + 1}</th>
                                <td>${permission.resource}</td>
                                <td>${permission.description}</td>
                                <td>
                                    <a class="btn btn-primary btn-sm" href="/permission/view/${permission.id}">查看</a>
                                    <a class="btn btn-warning btn-sm" href="/permission/edit/${permission.id}">编辑</a>
                                    <a class="btn btn-danger btn-sm" href="/permission/delete/${permission.id}">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <jsp:include page="../layout/pagination.jsp">
                        <jsp:param name="url" value="/permission/list"/>
                    </jsp:include>
                </div>
            </section>
        </div>
    </div>
</div>
</body>
</html>
