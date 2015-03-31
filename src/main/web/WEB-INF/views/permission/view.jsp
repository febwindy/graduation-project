<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>资源查看</title>
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
            <section class="thumbnail">
                <ol class="breadcrumb">
                    <li><a href="/permission/list">资源管理</a></li>
                    <li class="active">资源查看</li>
                </ol>
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="resource" class="col-sm-3 control-label">资源名</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="resource" name="resource"
                                   required="true" placeholder="请输入资源名" readonly value="${permission.resource}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="description" class="col-sm-3 control-label">资源描述</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="description" name="description"
                                   required="true" placeholder="请输入资源描述" readonly value="${permission.description}">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-6">
                            <div class="col-sm-2">
                                <a href="/permission/list" class="btn btn-md btn-primary btn-block" type="button">返回</a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>
</body>
</html>
