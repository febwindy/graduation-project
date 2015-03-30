<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户查看</title>
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
            <section class="thumbnail">
                <ol class="breadcrumb">
                    <li><a href="/user/list">用户管理</a></li>
                    <li class="active">用户查看</li>
                </ol>
                <div class="thumbnail">
                    <form class="form-horizontal" action="/user/create" method="post">
                        <div class="form-group">
                            <label for="username" class="col-sm-3 control-label">用户名</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="username" name="username"
                                       required="true" placeholder="请输入用户名" readonly value="${user.username}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-sm-3 control-label">邮件</label>
                            <div class="col-sm-6">
                                <input type="email" class="form-control" id="email" name="email" required="true"
                                       placeholder="请输入邮箱" readonly value="${user.email}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="telephone" class="col-sm-3 control-label">手机号码</label>
                            <div class="col-sm-6">
                                <input type="tel" class="form-control" id="telephone" name="telephone" required="true"
                                       placeholder="请输入手机号码" readonly value="${user.telephone}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="sex" class="col-sm-3 control-label">性别</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="sex" name="sex" required="true"
                                       placeholder="请输入性别" readonly
                                       value="<c:if test="${user.sex}">男</c:if><c:if test="${user.sex == false}">女</c:if>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="remark" class="col-sm-3 control-label">备注</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="remark" name="remark"
                                       placeholder="请输入备注" readonly value="${user.remark}">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-6">
                                <div class="col-sm-2">
                                    <a href="/user/list" class="btn btn-md btn-primary btn-block" type="button">返回</a>
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
</html>
