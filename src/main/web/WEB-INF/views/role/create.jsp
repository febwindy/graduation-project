<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>角色创建</title>
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
            <section class="thumbnail">
                <ol class="breadcrumb">
                    <li><a href="/role/list">角色管理</a></li>
                    <li class="active">角色创建</li>
                </ol>
                <div class="thumbnail">
                    <form class="form-horizontal" action="/role/create" method="post">
                        <div class="form-group">
                            <label for="role" class="col-sm-3 control-label">角色名</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="role" name="role"
                                       required="true" placeholder="请输入角色名" value="${role.role}">
                                <form:errors cssStyle="color: #FA4707;" path="role.role" role="alert"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="description" class="col-sm-3 control-label">角色描述</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="description" name="description"
                                       required="true" placeholder="请输入角色描述" value="${role.description}">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-6">
                                <div class="col-sm-offset-3 col-sm-2">
                                    <button class="btn btn-md btn-primary btn-block" type="submit">提交</button>
                                </div>
                                <div class="col-sm-2">
                                    <button id="reset" class="btn btn-md btn-danger btn-block" type="button">重置</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/resources/js/clear-tips.js"></script>
</html>
