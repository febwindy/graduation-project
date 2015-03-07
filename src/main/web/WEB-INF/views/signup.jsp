<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>注册</title>
    <jsp:include page="commons/inc_css.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signup.css"/>
    <jsp:include page="commons/inc_js.jsp"/>
</head>
<body>
<jsp:include page="layout/nav.jsp"/>
<div class="container">
    <hr/>
    <form class="form-signup" action="/signup" method="post">
        <h2 class="form-signup-heading" style="text-align: center;">注册用户</h2>
        <label for="username" class="sr-only">用户名</label>
        <input type="text" id="username" name="username" class="form-control" placeholder="请输入用户名" required="true"
               autofocus="true">
        <label for="password" class="sr-only">密码</label>
        <input type="password" id="password" name="password" class="form-control" placeholder="请输入密码" required="true">
        <label for="confirmPassword" class="sr-only">确认密码</label>
        <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="请输入确认密码"
               required="true">
        <label for="email" class="sr-only">邮件</label>
        <input type="email" id="email" name="email" class="form-control" placeholder="请输入邮件" required="true">
        <label for="telephone" class="sr-only">手机号码</label>
        <input type="tel" id="telephone" name="telephone" class="form-control" placeholder="请输入手机号码">
        <label for="sex" class="sr-only">性别</label>
        <select id="sex" name="sex" class="form-control" placeholder="请选择性别" required="true">
            <option value="">请选择</option>
            <option value="0">女</option>
            <option value="1">男</option>
        </select>
        <label for="remark" class="sr-only">备注</label>
        <input type="text" id="remark" name="remark" class="form-control" placeholder="请输入备注">

        <div class="row">
            <div class="col-md-6">
                <button class="btn btn-md btn-primary btn-block" type="submit">提交</button>
            </div>
            <div class="col-md-6">
                <button class="btn btn-md btn-danger btn-block" type="reset">重置</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
