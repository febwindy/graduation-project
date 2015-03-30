<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户创建</title>
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
                    <li class="active">用户创建</li>
                </ol>
                <div class="thumbnail">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="username" class="col-sm-3 control-label">用户名</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="username" name="username"
                                       required="true" placeholder="请输入用户名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-3 control-label">密码</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="password" name="password"
                                       required="true" placeholder="请输入密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="confirmPassword" class="col-sm-3 control-label">确认密码</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword"
                                       required="true" placeholder="请再次输入密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-sm-3 control-label">邮件</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="email" name="email" required="true"
                                       placeholder="请输入邮箱">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="telephone" class="col-sm-3 control-label">手机号码</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="telephone" name="telephone" required="true"
                                       placeholder="请输入手机号码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="sex" class="col-sm-3 control-label">性别</label>
                            <div class="col-sm-6">
                                <select id="sex" name="sex" class="form-control" placeholder="请选择性别" required="true">
                                    <option value="">请选择</option>
                                    <option value="0">女</option>
                                    <option value="1">男</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="remark" class="col-sm-3 control-label">备注</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="remark" name="remark"
                                       placeholder="请输入备注">
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
</html>
